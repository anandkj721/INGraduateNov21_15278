'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.bulkInsert('Accounts', [
      {
        accno: 1,
        accname: 'Anandkumar',
        balance:5000,
       createdAt: new Date(),
       updatedAt: new Date()       

     },

     {
      accno: 2,
      accname: 'katrina kaif',
      balance:2500,
     createdAt: new Date(),
     updatedAt: new Date()      
    },

    {
      accno: 1,
      accname: 'samantha',
      balance:6200,
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
