const { Sequelize } = require('sequelize');
const config = require('config');
const { base64encode, base64decode } = require('nodejs-base64');
const db=config.get('dbConfig')
const sequelize = new Sequelize(`${base64decode(db.database)}`, `${base64decode(db.username)}`, `${base64decode(db.password)}`, {
    host: `${base64decode(db.host)}`,
    dialect: `${db.dialect}`,
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
 });
module.exports = sequelize;
