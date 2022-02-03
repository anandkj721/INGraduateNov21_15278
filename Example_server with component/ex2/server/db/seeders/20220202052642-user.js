'use strict';

const { getMaxListeners } = require("process");

module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.bulkInsert('Users', [
      {
       firstName: 'Harshal',
       lastName: 'Patil',
        address:'parola',
        phoneNumber:7020669539,
        email:'harsh@getMaxListeners.com',
        userName:'harsh',
        password:'123',
       createdAt: new Date(),
       updatedAt: new Date()
     }
    ], {});
  },

  async down (queryInterface, Sequelize) {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
  }
};
