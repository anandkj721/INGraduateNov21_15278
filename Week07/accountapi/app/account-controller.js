const db=require('../db/models');//index.js=>db

const Account=db.Account;

// 1. select * from Account => findAll
exports.findAll=(req,resp)=>{
    Account.findAll()
       .then(data=>resp.json(data))
        .catch(err=>{
            resp.status(500)
                .send({message:err.message||
                `Something went wrong`})
      });
};

// 2. seelct * from Account where id=?=>findByPK
exports.findByPk=(req,resp)=>{
    const id=parseInt(req.params.id);
    Account.findByPk(id)
        .then(data=>resp.json(data))
        .catch(err=>{
            resp.status(500)
                .send({message:err.message||
               `Something went wrong`})
        });
};

// //create a new Account
 exports.createAccount=(req,resp)=>{
     if(!req.body.AccountName){
         resp.status(400)
         .send({message:"Account name must be provided"});
    }
      const newAccount={
        //  firstName=req.body.firstName,
        //   lastName=req.body.lastName,
        //   craetedAt:new Date(),
        //   updatedAt:new Date()
     };
     Account.create(newAccount)
     .then(data=>resp.send(data))
     .catch(err=>{
         resp.status(500)
         .send({message:err.message})
    })
 };

//update by id
exports.updateAccount=(req,resp)=>{
    const c_id=parseInt(req.params.id);
    Account.update(req.body,{where:{id:c_id}})
    .then(num=>{
        if(num>1){
            resp.send({message:`Account with id= ${id} updated successfully`});
        }
        else{
            resp.send({message:`can not Account with id ${id} updated successfully`});
        }
    })
    .catch(err=>{
        resp.status(500)
        .send({message:err.message || "some error retriving people data"})
    })

   }  

//delete
exports.delete=(req,resp)=>{
    const c_id=parseInt(req.params.id);
    Account.destroy({where:{id:c_id}})   
    .then(num=>{
        if(num==1){
            resp.send({message:`Account with id=${id} deleted sucessfully!`});
        }
        else{
            resp.send({message:`Account can not delet with id=${id} deleted sucessfully may be Account not found!`});
        }
    })
    .catch((err=>{
        resp.status(500).send({
            message:err.message || "could not delete person with id ="+id
        })
    }))
}