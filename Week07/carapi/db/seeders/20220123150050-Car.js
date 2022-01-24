'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.bulkInsert('Cars', [
      {
        carName: 'Honda City',
        brandName: 'HC0005',
       createdAt: new Date(),
       updatedAt: new Date()       

     },

     {
      carName: 'SWIFT',
      brandName: 'SW002',
     createdAt: new Date(),
     updatedAt: new Date()       

   },

   {
    carName: 'SeVeN hAbIt Of lIfE',
    brandName: 'alexendra',
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
