const dummyUser = { userId: 29, role: 'ADMIN' };

const TIME_CONSTANT = {
    DATA_TIME_FORMAT: 'YYYY-MM-DD HH:mm:ss'
}

const FILE_PATH = {
    GCP_TEMP_LOCATION: '/tmp/gcp/',
    STANDARD_CONTROL_LOCATION: '/tmp/standardControl/',
    TF_FILE: "/tmp/TF_FILE/",
    TF_ROOT_PATH: "TF_ROOT_PATH",
}


module.exports = { dummyUser, TIME_CONSTANT, FILE_PATH };