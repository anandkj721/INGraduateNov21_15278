'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.bulkInsert('Productpages', [
      {
        productId: 1,
        productName: 'Hp1',
        productPrice:25000,
		    productDescription:'this is new hp-ay020 laptop ',
        productImage:'assets\Image\hp1.jpg',
        createdAt: new Date(),
			  updatedAt: new Date()
            
     },

     {
        productId: 2,
        productName: 'Hp2',
        productPrice:25000,
	    	productDescription:'this is new hp-ay020 laptop ',
        productImage:'assets\Image\hp1.jpg',
        createdAt: new Date(),
			  updatedAt: new Date()
    
    },

    {

        productId: 3,
        productName: 'Hp3',
        productPrice:25000,
		    productDescription:'this is new hp-ay020 laptop ',
        productImage:'assets\Image\hp1.jpg',
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
