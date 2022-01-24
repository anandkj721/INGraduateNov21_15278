'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.bulkInsert('Heros', [
      {
        heroname: 'Jhonny DEep',
        film: 'Pirate of caribean',
       createdAt: new Date(),
       updatedAt: new Date()       

     },

     {
      heroname: 'suriya',
      film: 'jai bhim ',
     createdAt: new Date(),
     updatedAt: new Date()      
    },

    {
      heroname: 'allu',
        film: 'pushpa',
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
