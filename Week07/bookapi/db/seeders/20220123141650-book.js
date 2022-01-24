'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.bulkInsert('Books', [
      {
        bookName: 'SeVeN hAbIt Of lIfE',
        authorName: 'alexendra',
        publicationdate:new CURRENT_TIMESTAMP(),
       createdAt: new Date(),
       updatedAt: new Date()       

     },

     {
      bookName: 'MiSSlE mAN',
      authorName: 'APJ KALAM',
      publicationdate:new CURRENT_TIMESTAMP(),
      createdAt: new Date(),
      updatedAt: new Date()       
    },

    {

      bookName: 'sIgN oF rUlE',
      authorName: 'xyz',
      publicationdate:new CURRENT_TIMESTAMP(),
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
