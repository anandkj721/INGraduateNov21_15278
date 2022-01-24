module.exports=(app)=>{
    const express=require('express');
    const ROUTER=express.Router();
    const BookController=require('./book-controller');
    ROUTER.get('/books',BookController.findAll);
    ROUTER.get('/books/:id',BookController.findByPk);
    ROUTER.post('/books/add',BookController.createBook);
    ROUTER.put('/books/update/:id',BookController.updateBook);
    ROUTER.delete('/books/delete/:id',BookController.delete);

    app.use('/app',ROUTER);

}