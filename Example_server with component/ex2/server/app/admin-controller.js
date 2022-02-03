const db=require('../db/models');//index.js=>db

const Admin=db.Admin;

// 1. select * from users => findAll

exports.findAll=(req,resp)=>{
    Admin.findAll()
        .then(data=>resp.json(data))
        .catch(err=>{
            resp.status(500)
              .send({message:err.message||
                `Something went wrong`})
        });
};

// 2. select * from users where id=?=>findByPK

exports.findByPk=(req,resp)=>{
 const id=parseInt(req.params.id);
    Admin.findByPk(id)
        .then(data=>resp.json(data))
        .catch(err=>{
            resp.status(500)
                .send({message:err.message||
                `Something went wrong`})
        });

};

exports.createAdmin=(req,res)=>{
    if(!req.body.firstName){
        res.status(400)
        .send({message:"Name must be provided"});
    }
    const newAdmin={
        firstName:req.body.firstName,
        lastName:req.bosy.lastName,
        emailId:req.body.emailId,
        password:req.body.password,
        createdAt:new Date(),
        updatedAt: new Date()
    }
    Admin.create(newAdmin)
    .then(data=>res.send(data))
    .catch(err=>{
        res.status(500)
        .send({message:err.message})
    })
};

exports.updateAdmin=(req,resp)=>{
    const c_id=parseInt(req.params.id);
    Admin.update(req.body,{where:{id:c_id}})
    .then(num=>{
        if(num==1){
        resp.send({message:`Admin with  id ${c_id} updated sucessfully`});
        }
        else{
        resp.send({message:`Admin with  id ${c_id} not updated sucessfully`});
        }
        })
        .catch((err) => {
        resp.status(500).send({
        message: err.message || " Some error retriving Admin data"
        });
        });
};

exports.deleteAdmin=(req,resp)=>{
    const c_id = parseInt(req.params.id);
    Admin.destroy({where:{id:c_id}})
    .then(num => {
    if (num == 1) {
    resp.send({ message: `Admin with id=${c_id} deleted successfully!` });
    } else {
    resp.send({ message: `Cannot delete Admin with id=${c_id}. Maybe Admin was not found!` });
    }
    })
    .catch((err) => {
    resp.status(500).send({
    message: err.message || " Could not delete Admin with id=" + c_id
    });
    });
};
