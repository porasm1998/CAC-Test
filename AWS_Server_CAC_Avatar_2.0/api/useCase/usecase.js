const express = require('express')
const router = express.Router()
const UseCaseTemplate = require('../common/useCaseExecutor')
const config = require('config');
const Usecases = require('../../model/usecases');
const fs = require('fs');

router.post('/', async (req, res) => {
    const { session } = req;
    const { user } = session;
    console.log(session);
    console.log(req.body.configList);
    const useCase = await Usecases.findOne({ where: { useCaseId: `${req.body.configList.usecaseid}` } });
    const usecaseId = useCase.useCaseId;
    const cloudId = useCase.cloudId;
    const { parameter } = req.body.configList;
    // const generateScript = (location, content) => {
    //     fs.writeFile(location, content, async (err) => {
    //         if (err) {
    //             console.log(err);
    //         }
    //     });
    // }
    const toTfvar = (a, level = 0) => {
        return Object.entries(a).reduce((acc, [key, val]) => {
            if (val?.constructor.name == 'Object') {
                const subLevelObject = toTfvar(val, level + 1);
                if (level > 0) {
                    acc += `\n { \n ${subLevelObject} } ,`;
                } else {
                    acc += `\n ${key} = { \n ${subLevelObject} } \n`;
                }
            } else if (val?.constructor.name == 'Array') {
                const value = toTfvar(val, level+1);
                if (value[value.length - 1] === ',') {
                    acc += `${key} = [${value.substring(0, value.length - 1)}] \n`;
                } else {
                    acc += `${key} = [${value}] \n`;
                }
            } else {
                if (isNaN(key)) {
                    if (val?.constructor.name === 'String') {
                        acc += `${key} = "${val}"${level > 0 ? ',' : ''} \n`;
                    } else {
                        acc += `${key} = ${val}${level > 0 ? ',' : ''} \n`;
                    }
                } else {
                    if (val?.constructor.name === 'String') {
                        acc += `"${val}",`;
                    } else {
                        acc += `${val},`;
                    }
                }
            }
            return acc;
        }, '');
    }
    console.log(req.body,"-----------------------------", toTfvar(parameter), "-----------------------------",cloudId);
    // if (config.has(`Location.${req.body.configList.providerName}.${req.body.configList.usecaseType}.${req.body.configList.usecaseName}`)) {
        
    //     if (cloudId !== 3) {
    //         const path = config.get(`Location.${req.body.configList.providerName}.${req.body.configList.usecaseType}.${req.body.configList.usecaseName}`)

    //         if (req.body.configList.usecaseName == "AmiHardning" || req.body.configList.usecaseName == "WindowsAmihardening") {
    //             generateScript(path.tfvarPath + `/${parameter.folderName}/demo.sh`,
    //                 `cd ${path.tfvarPath}/${parameter.folderName}\npacker build configuration`)


    //             const usecase = new UseCaseTemplate(path.tfvarPath + `/${parameter.folderName}/demo.sh`, path.tfvarPath + `/${parameter.folderName}/configuration`, user.userId, cloudId, usecaseId);
    //             delete parameter.folderName
    //             usecase.run(JSON.stringify(parameter, null, " "), req.body.reviewParams);
    //         }
    //         else {
    //             const usecase = new UseCaseTemplate(path.scriptPath, path.tfvarPath + `/${user.userId}.tfvars`, user.userId, cloudId, usecaseId);
    //             usecase.run(toTfvar(parameter), req.body.reviewParams);
    //         }
    //         res.sendStatus(200);
    //     } else {

    //         const path = config.get(`Location.${req.body.configList.providerName}.${req.body.configList.usecaseType}.${req.body.configList.usecaseName}`)
    //         const usecase = new UseCaseTemplate(path.scriptPath, path.tfvarPath + `/${user.userId}.tfvars`, user.userId, cloudId, usecaseId);
    //         usecase.createJson(path.credPath, req.body.configList.gcpCred)

    //         usecase.run(toTfvar(parameter), req.body.reviewParams);
    //         res.sendStatus(200);
    //     }
    // } else {
    //     res.status(400).send('UseCase location not found');
    // }
    const usecase = new UseCaseTemplate( user.userId,cloudId, usecaseId);
    usecase.run(toTfvar(parameter), req.body.reviewParams);
});


module.exports = router
