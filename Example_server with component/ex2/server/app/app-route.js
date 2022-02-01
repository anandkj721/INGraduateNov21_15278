module.exports=(app)=>{
    const express=require('express');
    const ROUTER=express.Router();
    const ProductpageController=require('./productpage-controller');
    ROUTER.get('/productpages',ProductpageController.findAll);
    ROUTER.get('/productpages/:id',ProductpageController.findByPk);
    ROUTER.post('/productpages/add',ProductpageController.createProductpage);
    ROUTER.put('/productpages/update/:id',ProductpageController.updateProductpage);
    ROUTER.delete('/productpages/delete/:id',ProductpageController.deleteProductpage);

    app.use('/app',ROUTER);
}