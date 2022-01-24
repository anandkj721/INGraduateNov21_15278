module.exports=(app)=>{
    const express=require('express');
    const ROUTER=express.Router();
    const UserController=require('./account-controller');
    ROUTER.get('/accounts',UserController.findAll);
    ROUTER.get('/accounts/:id',UserController.findByPk);
    ROUTER.post('/accounts/add',(req,resp)=>{    });
    ROUTER.put('/accounts/update/:id',(req,resp)=>{    });
    ROUTER.delete('/accounts/delete/:id',(req,resp)=>{    });

    app.use('/app',ROUTER);

}