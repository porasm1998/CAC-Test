const { addListener } = require('process');
const RequestDetails = require('../../model/requestDetails');
const RequestLogs = require('../../model/requestLogs');
const Requests = require('../../model/requests');
const Usecases = require('../../model/usecases')
const { useCaseStatus } = require('../constant/useCaseConstant');
const fs = require('fs');
const { processOutputFileAndGetResourceDetails } = require('./terraformOutputProcessor');
const { commit } = require('./githubApi')
class UseCaseExecutor {
  constructor(userId, cloudId, usecaseId) {
    this.userId = userId;
    this.cloudId = cloudId;
    this.useCaseId = usecaseId;
  }

  async run(content, inputparam) {
    this.request = await Requests.create({ cloudId: this.cloudId, useCaseId: this.useCaseId, userId: this.userId, submittedOn: new Date(), status: useCaseStatus.INPROGRESS });
    this.requestLogs = await RequestLogs.create({ requestId: this.request.requestId, terraFormInput: inputparam });
    fs.writeFile(`requests/${this.request.requestId}.tfvars`, content, async (err) => {
      if (err) {
        console.log(err);
        await Requests.update({ completedOn: new Date(), status: STATUS.ERROR }, { where: { requestId: this.request.requestId } });
        await RequestLogs.update({ terraFormLogs: err }, { where: { requestLogId: this.requestLogs.requestLogId } });
      } else {
        // commit("cloudAuto9","AWS_Server_CAC_Avatar_2.0","dev",content,`requests/${this.request.requestId}`,"terraform.tfvars")
        const { exec } = require('child_process');
            var yourscript = exec('sh tfvarsCommit.sh',
              (error, stdout, stderr) => {
                console.log(stdout);
                console.log(stderr);
                if (error !== null) {
                  console.log(`exec error: ${error}`);
                }
              });
        this.getSciptPath(this.useCaseId)
          .then((res) => {
            var child_process = require('child_process');
            const child = child_process.fork(`api/common/jenkins.js`, [`api${res}`, this.request.requestId, this.requestLogs.requestLogId])
            child.on('message', (error) => {
              console.log(error);
            })
          })
      }
    });
  }
  async getSciptPath(useCaseId) {
    return Usecases.findOne({
      where: {
        useCaseId: useCaseId,
      },
    }).then((data) => {

      return data.TF_File_Path

    })
  }

  executeTfvarScript() {
    var child_process = require('child_process');

    console.log(this.scriptLocation);
    const command = "sh " + this.scriptLocation + " tfinputs/" + this.userId + ".tfvars"
    console.log("command: ", command)
    child_process.exec(command, async (error, stdout, stderr) => {
      console.log(error, "---------------------", stdout, "----------------------", stderr)
      if (stderr) {

        await Requests.update({ completedOn: new Date(), status: useCaseStatus.ERROR }, { where: { requestId: this.request.requestId } });
        await RequestLogs.update({ terraFormLog: stderr, terraFormOutput: "some error occured please check the logs" }, { where: { requestLogId: this.requestLogs.requestLogId } });
      } else {
        console.log(this.request.requestId)
        await Requests.update({ completedOn: new Date(), status: useCaseStatus.COMPLETE }, { where: { requestId: this.request.requestId } });
        const requestDetails = processOutputFileAndGetResourceDetails(stdout, this.request.requestId);

        await RequestDetails.bulkCreate(requestDetails);
        let [terraFormLog, , terraFormOutput] = stdout.split(/(Outputs:|==> Builds finished)/);
        terraFormLog = terraFormLog?.trim();
        terraFormOutput = terraFormOutput?.trim();
        await RequestLogs.update({ terraFormLog: terraFormLog, terraFormOutput: terraFormOutput }, { where: { requestLogId: this.requestLogs.requestLogId } });
      }
    });
  }
}
module.exports = UseCaseExecutor;