const express = require('express');
const fs = require('fs');
const router = express.Router();
const { FILE_PATH } = require('../constant/apiConstant');
const uploadFile = require('../middleware/fileUpload');
const path = require('path');
const { base64encode, base64decode } = require('nodejs-base64');
const child_process = require('child_process');
const axios = require('axios');
const Clouds = require('../../model/clouds');
const config = require('config');

const unseal_key = base64decode(config.get('vault.unsealKey'));
const root_token = base64decode(config.get('vault.rootKey'));
const vaultUrl = base64decode(config.get('vault.url'));

const getValueFromVault = function (userId, cloudProvider) {
    const headers = { 'X-Vault-Token': root_token };
    return axios.get(`${vaultUrl}/${userId}/${cloudProvider}`, { headers });
}

const postValueToVault = function (userId, cloudProvider, body) {
    console.log('inside post method below is body');
    console.log(body);
    let a = JSON.stringify(body);
    const headers = { 'X-Vault-Token': root_token };
    return axios.post(`${vaultUrl}/${userId}/${cloudProvider}`, {'key': base64encode(a)}, { headers });
}

const deleteValueFromVault = function (userId, cloudProvider) {
    const headers = { 'X-Vault-Token': root_token };
    return axios.delete(`${vaultUrl}/${userId}/${cloudProvider}`, { headers });
}

router.get('/', async (req, res) => {
    const { session: { user: { userId } } } = req;
    try {
        const cloudProviders = await Clouds.findAll();
        const apis = cloudProviders.map(c => getValueFromVault(userId, c.code.toLowerCase()));
        
        const responses = await Promise.allSettled(apis);
        const data = responses.reduce((acc, res, index) => {
            const { value } = res;
            const { data: reqData } = value || {};
            const { data } = reqData || {};
            let { key } = data || {};
            let decoded;  
            if (key){

             decoded = base64decode(`${key}`);
            decoded =  JSON.parse(decoded);
            };
           
            // decoded = JSON.parse(decoded + '');
            if (decoded) {
                decoded.cloud = cloudProviders[index];
                acc.push(decoded);
            }
            return acc;
        }, []);
        res.status(200).send(data);
    } catch (err) {
        console.log('error fetching CloudConnections from Vault : ', err);
        res.status(500).send(err);
    }
});

router.get('/:userId/:cloudId', async (req, res) => {
    const { userId, cloudId } = req.params;
    try {
        const cloudProviders = await Clouds.findAll();
        const { code } = cloudProviders.find(c => parseInt(c.cloudId) === parseInt(cloudId));
        const { data: response } = await getValueFromVault(userId, code.toLowerCase());
        const { data } = response || {};
       // console.log(data);
         let { key } = data || {};
           // console.log(key);
            let decoded = base64decode(`${key}`);
           // console.log(decoded);
        if (decoded) {
            res.status(200).send(decoded);
        } else {
            res.status(200).send();
        }
    } catch (err) {
        console.log('error fetching CloudConenction table : ', err);
        res.status(500).send(err);
    }
});

router.post('/', async (req, res) => {
    const { userId, cloudId } = req.body;
    try {
        const cloudProviders = await Clouds.findAll();
        const { code } = cloudProviders.find(c => c.cloudId === cloudId);
        const { data } = await postValueToVault(userId, code.toLowerCase(), req.body);
        res.status(200).send(data);
    } catch (err) {
        console.log('error inserting into CloudConnections table :', err);
        res.status(500).send(err);
    }
});

router.post('/gcp/upload', uploadFile(FILE_PATH.GCP_TEMP_LOCATION).single('file'), async (req, res) => {
    const { cloudId, userId } = req.body;
    try {
        const pathUrl = path.join(__dirname, '..', `${FILE_PATH.GCP_TEMP_LOCATION}`);
        const gcpFile = fs.readFileSync(`${pathUrl}${req.file.filename}`).toLocaleString();
        const gcpFileName = req.file.originalname;
        const cloudProviders = await Clouds.findAll();
        const { code } = cloudProviders.find(c => parseInt(c.cloudId) === parseInt(cloudId));
        const { data } = await postValueToVault(userId, code.toLowerCase(), { gcpFile, gcpFileName, cloudId });
        res.status(200).send(data);
    } catch (err) {
        console.log('error inserting into CloudConnections table :', err);
        res.status(500).send(err);
    }
});

router.put('/:cloudConnectionId', async (req, res) => {
    const { userId, cloudId } = req.body;
    try {
        const cloudProviders = await Clouds.findAll();
        const { code } = cloudProviders.find(c => parseInt(c.cloudId) === parseInt(cloudId));
        const { data } = await postValueToVault(userId, code.toLowerCase(), req.body);
        res.status(200).send(data);
    } catch (err) {
        console.log('error inserting into CloudConnections table :', err);
        res.status(500).send(err);
    }
});

router.put('/gcp/upload/:cloudConnectionId', uploadFile(FILE_PATH.GCP_TEMP_LOCATION).single('file'), async (req, res) => {
    const { cloudId, userId } = req.body;
    try {
        const pathUrl = path.join(__dirname, '..', `${FILE_PATH.GCP_TEMP_LOCATION}`);
        const gcpFile = fs.readFileSync(`${pathUrl}${req.file.filename}`).toLocaleString();
        const gcpFileName = req.file.originalname;
        const cloudProviders = await Clouds.findAll();
        const { code } = cloudProviders.find(c => c.cloudId === cloudId);
        const { data } = await postValueToVault(userId, code.toLowerCase(), { gcpFile, gcpFileName, cloudId });
        res.status(200).send(data);
    } catch (err) {
        console.log('error inserting into CloudConnections table :', err);
        res.status(500).send(err);
    }
});

router.delete('/:cloudConnectionId', async (req, res) => {
    const { session: { user: { userId } } } = req;
    const { cloudConnectionId } = req.params;
    try {
        const _ = await deleteValueFromVault(userId, cloudConnectionId.toLowerCase());
        res.sendStatus(200);
    } catch (err) {
        console.log('error deleting record from CloudConnections table :', err);
        res.status(500).send(err);
    }
});

const addConnectionDetailsToVault = () => {
    const path = `users/`;
    const command = `sh ./vault_scripts/vault.sh ${unseal_key} ${root_token} ${path}`;
    console.log('Command executing to create path in vault: ', command);
    console.log('start time of intializing the vault:', new Date());
    child_process.exec(command, (error, stdout, stderr) => {
        console.log('error creating path in vault : ', error, '-->', stdout, '-->', stderr);
        console.log('end time of intialization:', new Date());
    });
}

module.exports = { router, addConnectionDetailsToVault };
