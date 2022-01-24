module.exports=(app)=>{
    const express=require('express');
    const ROUTER=express.Router();
    const UserController=require('./car-controller');
    ROUTER.get('/cars',UserController.findAll);
    ROUTER.get('/cars/:id',UserController.findByPk);
    ROUTER.post('/cars/add',UserController.createCar);
    ROUTER.put('/cars/update/:id',UserController.updateCar);
    ROUTER.delete('/cars/delete/:id',UserController.delete);
    app.use('/app',ROUTER);
}