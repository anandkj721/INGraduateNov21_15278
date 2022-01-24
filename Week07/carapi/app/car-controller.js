const db=require('../db/models');//index.js=>db

const Car=db.Car;

// 1. select * from Car => findAll
exports.findAll=(req,resp)=>{
    Car.findAll()
       .then(data=>resp.json(data))
        .catch(err=>{
            resp.status(500)
                .send({message:err.message||
                `Something went wrong`})
      });
};

// 2. seelct * from Car where id=?=>findByPK
exports.findByPk=(req,resp)=>{
    const id=parseInt(req.params.id);
    Car.findByPk(id)
        .then(data=>resp.json(data))
        .catch(err=>{
            resp.status(500)
                .send({message:err.message||
               `Something went wrong`})
        });
};

// //create a new Car
 exports.createCar=(req,resp)=>{
     if(!req.body.CarName){
         resp.status(400)
         .send({message:"Car name must be provided"});
    }
      const newCar={
        carName:req.body.carName,
        brandName:req.body.brandName,
          craetedAt:new Date(),
          updatedAt:new Date()

        
     };
     Car.create(newCar)
     .then(data=>resp.send(data))
     .catch(err=>{
         resp.status(500)
         .send({message:err.message})
    })
 };

//update by id
exports.updateCar=(req,resp)=>{
    const c_id=parseInt(req.params.id);
    Car.update(req.body,{where:{id:c_id}})
    .then(num=>{
        if(num>1){
            resp.send({message:`Car with id= ${id} updated successfully`});
        }
        else{
            resp.send({message:`cannot Car with id ${id} updated successfully`});
        }
    })
    .catch(err=>{
        resp.status(500)
        .send({message:err.message || "some error retriving Car data"})
    })

   }  

//delete
exports.delete=(req,resp)=>{
    const c_id=parseInt(req.params.id);
    Car.destroy({where:{id:c_id}})   
    .then(num=>{
        if(num==1){
            resp.send({message:`Car with id=${id} deleted sucessfully!`});
        }
        else{
            resp.send({message:`Car can not delet with id=${id} deleted sucessfully may be Car not found!`});
        }
    })
    .catch((err=>{
        resp.status(500).send({
            message:err.message || "could not delete Car with id ="+id
        })
    }))
}