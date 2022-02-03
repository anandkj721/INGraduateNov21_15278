const db=require('../db/models');
const Users=db.User;

//1.select *
exports.findAll=(req,resp)=>{
  Users.findAll()
     .then(data=>resp.json(data))
      .catch(err=>{
          resp.status(500)
              .send({message:err.message||
              `Something went wrong`})
    });
};
// 2. seelct * from Productpage where id=?=>findByPK
exports.findByPk=(req,resp)=>{
  const id=parseInt(req.params.id);
  Users.findByPk(id)
      .then(data=>resp.json(data))
      .catch(err=>{
          resp.status(500)
              .send({message:err.message||
             `Something went wrong`})
      });
};

//create a new Productpage
exports.createUser=(req,resp)=>{
 if(!req.body.firstName){
       resp.status(400)
      .send({message:"firstName name must be provided"});
    return req.body.firstName;
   }
 if(!req.body.lastName){
  resp.status(400)
  .send({message:"lastName name must be provided"});
}
if(!req.body.address){
  resp.status(400)
  .send({message:"address name must be provided"});
}
if(!req.body.phoneNumber){
  resp.status(400)
  .send({message:"phoneNumber name must be provided"});
}
if(!req.body.email){
  resp.status(400)
  .send({message:"email name must be provided"});
}
if(!req.body.userName){
  resp.status(400)
  .send({message:"userName name must be provided"});
}
if(!req.body.password){
  resp.status(400)
  .send({message:"password name must be provided"});
}

   const newUser={
    firstName:req.body.firstName,
    lastName:req.body.lastName,
    address:req.body.address,
    phoneNumber:req.body.phoneNumber,
    email:req.body.email,
    userName:req.body.userName,
    password:req.body.password,
    createdAt:new Date(),
    updatedAt:new Date()
  };

  Users.create(newUser)
  .then(data=>resp.send(data))
  .catch(err=>{
      resp.status(500)
      .send({message:err.message})
 })
};

exports.updateUser=(req,resp)=>{
  const c_id=parseInt(req.params.id);
  Users.update(req.body,{where:{id:c_id}})
  .then(num=>{
      if(num>1){
          resp.send({message:`user with id= ${id} updated successfully`});
      }
      else{
          resp.send({message:`cannot user with id ${id} updated successfully`});
      }
  })
  .catch(err=>{
      resp.status(500)
      .send({message:err.message || "some error retriving Productpage data"})
  })

 }

//delete
exports.deleteUser=(req,resp)=>{
  const c_id=parseInt(req.params.id);
  Users.destroy({where:{id:c_id}})
  .then(num=>{
      if(num==1){
          resp.send({message:`user with id=${id} deleted sucessfully!`});
      }
      else{
          resp.send({message:`user can not delete with id=${id} deleted sucessfully may be Productpage not found!`});
      }
  })
  .catch((err=>{
      resp.status(500).send({
          message:err.message || "could not delete user with id ="+id
      })
  }))
}




