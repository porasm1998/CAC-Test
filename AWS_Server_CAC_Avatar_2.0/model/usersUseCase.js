const sequelize = require('./index');
const { DataTypes, Model } = require('sequelize');
const Users = require('./users');
const Usecases = require('./usecases');
const { addModel } = require('../api/common/queryUtil');

// Assuming you have a UsersUseCases instance called userUseCase
// const Usecases = await UsersUseCases.getUseCase();

// // The `useCase` variable now contains the related Usecases instance
// console.log(`The use case name is ${Usecases.name}.`);

class UsersUseCases extends Model { }
UsersUseCases.init({
    userId: {
        type: DataTypes.BIGINT,
        allowNull: false
    },
    useCaseId: {
        type: DataTypes.BIGINT,
        allowNull: false
    },
    selected: {
        type: DataTypes.TINYINT,
        allowNull: false,
        get() {
            return Boolean(this.getDataValue('selected'));
        },
        set(value) {
            this.setDataValue('selected', (value ? 1 : 0));
        }
    },
    partialSelected: {
        type: DataTypes.TINYINT,
        allowNull: false,
        get() {
            return Boolean(this.getDataValue('partialSelected'));
        },
        set(value) {
            this.setDataValue('partialSelected', (value ? 1 : 0));
        }
    }
}, {
    sequelize,
    modelName: 'usersUseCases',
    tableName: 'usersUseCases',
    timestamps: true,
    updatedAt: 'updatedOn',
    createdAt: 'createdOn'
});
//UsersUseCases.hasMany(Usecases, {foreignKey: 'useCaseId', as:'Usecases'});
//UsersUseCases.belongsTo(Usecases, { through: 'Usecases', foreignKey: 'useCaseId', as: 'uu2' });
// addModel(UsersUseCases, 'uuseCase');

module.exports = UsersUseCases;