module.exports=(app)=>{
    const express=require('express');
    const ROUTER=express.Router();
    const ProductpageController=require('./productpage-controller');
    ROUTER.get('/productpages',ProductpageController.findAll);
    ROUTER.get('/productpages/:id',ProductpageController.findByPk);
    ROUTER.post('/productpages/add',ProductpageController.createProductpage);
    ROUTER.put('/productpages/update/:id',ProductpageController.updateProductpage);
    ROUTER.delete('/productpages/delete/:id',ProductpageController.deleteProductpage);
	
    const UserController=require('./user-controller');
  ROUTER.get('/users',UserController.findAll);
  ROUTER.get('/users/:id',UserController.findByPk);
  ROUTER.post('/users/add',UserController.createUser);
  ROUTER.put('/users/update/:id',UserController.updateUser);
  ROUTER.delete('/users/delete/:id',UserController.deleteUser);

  //divyashree
  const LoginComponent=require('./admin-controller');
  ROUTER.get('/admin',LoginComponent.findAll);
  ROUTER.get('/admin/:id',LoginComponent.findByPk);
  ROUTER.post('/admin/add',LoginComponent.createAdmin);
  ROUTER.put('admin/update/:id',LoginComponent.updateAdmin);
 ROUTER.delete('admin/delete/:id',LoginComponent.deleteAdmin);

    app.use('/app',ROUTER);
}