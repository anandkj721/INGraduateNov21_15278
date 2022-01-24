'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.bulkInsert('Authors', [
      {
        authorid: '1',
        authorname: 'apj kalam',
        bookname:'MIssile Man',
       createdAt: new Date(),
       updatedAt: new Date()       

     },

     {
      authorid: '2',
      authorname: 'XYZ',
      bookname:'a mAN WITH Liar',
     createdAt: new Date(),
     updatedAt: new Date()       

   },

   {
    authorid: '3',
    authorname: 'abc',
    bookname:'Dream Girls',
   createdAt: new Date(),
   updatedAt: new Date()       

 }

    ], {});	;
    
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
