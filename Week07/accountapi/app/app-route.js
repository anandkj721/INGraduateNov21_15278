module.exports=(app)=>{
    const express=require('express');
    const ROUTER=express.Router();
    const UserController=require('./account-controller');
    ROUTER.get('/accounts',UserController.findAll);
    ROUTER.get('/accounts/:id',UserController.findByPk);
    ROUTER.post('/accounts/add',UserController.createAccount);
    ROUTER.put('/accounts/update/:id',UserController.updateAccount);
    ROUTER.delete('/accounts/delete/:id',UserController.delete);

    app.use('/app',ROUTER);

}