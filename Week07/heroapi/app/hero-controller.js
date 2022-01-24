const db=require('../db/models');//index.js=>db

const Hero=db.Hero;

// 1. select * from Hero => findAll
exports.findAll=(req,resp)=>{
    Hero.findAll()
       .then(data=>resp.json(data))
        .catch(err=>{
            resp.status(500)
                .send({message:err.message||
                `Something went wrong`})
      });
};

// 2. seelct * from Hero where id=?=>findByPK
exports.findByPk=(req,resp)=>{
    const id=parseInt(req.params.id);
    Hero.findByPk(id)
        .then(data=>resp.json(data))
        .catch(err=>{
            resp.status(500)
                .send({message:err.message||
               `Something went wrong`})
        });
};

// //create a new Hero
 exports.createHero=(req,resp)=>{
     if(!req.body.HeroName){
         resp.status(400)
         .send({message:"Hero name must be provided"});
    }
      const newHero={
         heroname:req.body.heroname,
          film:req.body.film,
          craetedAt:new Date(),
          updatedAt:new Date()
     };
     Hero.create(newHero)
     .then(data=>resp.send(data))
     .catch(err=>{
         resp.status(500)
         .send({message:err.message})
    })
 };

//update by id
exports.updateHero=(req,resp)=>{
    const c_id=parseInt(req.params.id);
    Hero.update(req.body,{where:{id:c_id}})
    .then(num=>{
        if(num>1){
            resp.send({message:`Hero with id= ${id} updated successfully`});
        }
        else{
            resp.send({message:`can not Hero with id ${id} updated successfully`});
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
    Hero.destroy({where:{id:c_id}})   
    .then(num=>{
        if(num==1){
            resp.send({message:`Hero with id=${id} deleted sucessfully!`});
        }
        else{
            resp.send({message:`Hero can not delet with id=${id} deleted sucessfully may be Hero not found!`});
        }
    })
    .catch((err=>{
        resp.status(500).send({
            message:err.message || "could not delete person with id ="+id
        })
    }))
}