'use strict';
	module.exports = {
	  up: async (queryInterface, Sequelize) => {
		  await queryInterface.bulkInsert('Admins', [
			{
			firstName: 'Divya',
			lastName:'Karangutkar',
            emailId:'divya@gmail.com',
            password:'divya28',
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
