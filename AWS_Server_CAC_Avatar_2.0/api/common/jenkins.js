var jenkinsapi = require('../../node_modules/jenkins-api');
const axios = require('../../node_modules/axios');
const xml = require("../../node_modules/xml2js");
const { base64encode, base64decode } = require('nodejs-base64');
const RequestDetails = require('../../model/requestDetails');
const RequestLogs = require('../../model/requestLogs');
const Requests = require('../../model/requests');
const { useCaseStatus } = require('../constant/useCaseConstant');
const { processOutputFileAndGetResourceDetails } = require('./terraformOutputProcessor');
const config = require('config');

const username = base64decode(config.get('jenkins.username'))
const Token = base64decode(config.get('jenkins.Token'))
const Pipeline = base64decode(config.get('jenkins.Pipeline'))
const IP = base64decode(config.get('jenkins.IP'))
const basicAuth = base64decode(config.get('jenkins.basicAuth'))

var jenkins = jenkinsapi.init(`http://${username}:${Token}@${IP}/`);

const buildNo = function (queueId) {

    const headers = { 'Authorization': `Basic ${basicAuth}` };

    const id = setInterval(function () {
        axios.get(`http://${IP}/job/${Pipeline}/api/xml?tree=builds[id,number,result,queueId]&xpath=//build[queueId=${queueId}][position()=1]`, { headers })
            .then(res => {
                var parsedXML = xml.parseString(res.data, (err, res) => {

                    if (err) { console.log(err) }

                    const build_no = parseInt(res.build.number[0])
                    console.log(build_no);
                    jenkins.console_output(Pipeline, build_no, function (err, data2) {
                        if (err) { return console.log('processing : : ', err); }
                        else if (data2.body) {
                            output_string = data2.body
                            if (output_string.includes('Finished: SUCCESS') || output_string.includes('Finished: FAILURE')) {
                                clearInterval(id)
                                
                                var [out1,echo ,out2] = output_string?.split('STARTApply')
                                var [out3, out4] = out2?.split("ENDApply")                                
                                if (output_string.includes('Finished: FAILURE')) {
                                    try {    
                                        Requests.update({ completedOn: new Date(), status: useCaseStatus.ERROR }, { where: { requestId: process.argv[3]} });
                                        RequestLogs.update({ terraFormLog: output_string, terraFormOutput: "some error occured please check the logs" }, { where: { requestLogId: process.argv[4] } });
                                    } catch (error) {
                                        console.log(error);
                                    }

                                } else {
                                    try {
                                        Requests.update({ completedOn: new Date(), status: useCaseStatus.COMPLETE }, { where: { requestId: process.argv[3] } });
                                        
                                        console.log("out3",out3);
                                        let [terraFormLog, terraFormOutput] = out3?.split('Apply complete!');
                                        terraFormLog = terraFormLog?.trim();
                                        terraFormOutput = terraFormOutput?.trim();
                                        const requestDetails = processOutputFileAndGetResourceDetails(terraFormOutput, process.argv[3]);
                                        RequestDetails.bulkCreate(requestDetails);

                                        console.log("----------------------------------",terraFormLog,terraFormOutput,"-------------------------------");
                                        RequestLogs.update({ terraFormLog: terraFormLog, terraFormOutput: terraFormOutput }, { where: { requestLogId: process.argv[4] } });
                                    } catch (error) {
                                        console.log(error);
                                    }
                                }
                            }
                        }
                    });
                })
            })
            .then(res => { 
                return res })
            .catch(err => {

                clearInterval(id)
                console.log("something went wrong:", err)})

    }, 10000);




}

// console.log(process.argv[3],process.argv[4]),"jenkins";

jenkins.build_with_params(Pipeline, { working_dir: process.argv[2], req_id: process.argv[3] }, function (err, data) {
    if (err) { return console.log(err); }
    buildNo(data.queueId)
    console.log(data.queueId)
});

