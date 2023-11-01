const sequelize = require('./index');
const { DataTypes, Model } = require('sequelize');
const Clouds = require('./clouds');
const { addModel } = require('../api/common/queryUtil');
const UsersUseCases = require('./usersUseCase');

class Usecases extends Model { }
Usecases.init({
    useCaseId: {
        type: DataTypes.BIGINT,
        autoIncrement: true,
        primaryKey: true
    },
    cloudId: {
        type: DataTypes.BIGINT,
        allowNull: false
    },
    code: {
        type: DataTypes.STRING,
        allowNull: true,
        defaultValue: null
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    parentId: {
        type: DataTypes.BIGINT,
        allowNull: true,
        defaultValue: null
    },
    UIRoute: {
        type: DataTypes.STRING,
        allowNull: true,
        defaultValue: null
    },
    
    JSON_File_Path: {
        type: DataTypes.STRING,
        allowNull: true
    },
    TF_File_Path: {
        type: DataTypes.STRING,
        allowNull: true
    }

    
}, {
    sequelize,
    modelName: 'useCases',
    tableName: 'useCases',
    timestamps: true,
    updatedAt: 'updatedOn',
    createdAt: 'createdOn'
});

Usecases.belongsTo(Clouds, { foreignKey: 'cloudId', as: 'cloud' });
Usecases.belongsTo(Usecases, { foreignKey: 'parentId', as: 'useCase' });
//Usecases.belongsTo(UsersUseCases, { foreignKey: 'useCaseId'});
//Usecases.belongsToMany(UsersUseCases, { through: 'UsersUseCases', foreignKey: 'useCaseId', as: 'uu1' });
Usecases.hasMany(UsersUseCases, { foreignKey: 'useCaseId', as: 'uu1' });
addModel(Usecases, 'useCase');
module.exports = Usecases;