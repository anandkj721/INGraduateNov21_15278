module.exports=(app)=>{
    const express=require('express');
    const ROUTER=express.Router();
    const UserController=require('./hero-controller');
    ROUTER.get('/heros',UserController.findAll);
    ROUTER.get('/heros/:id',UserController.findByPk);
    ROUTER.post('/heros/add',UserController.createHero);
    ROUTER.put('/heros/update/:id',UserController.updateHero);
    ROUTER.delete('/heros/delete/:id',UserController.delete);

    app.use('/app',ROUTER);

}