const db=require('../db/models');//index.js=>db

const Author=db.Author;

// 1. select * from Author => findAll
exports.findAll=(req,resp)=>{
    Author.findAll()
       .then(data=>resp.json(data))
        .catch(err=>{
            resp.status(500)
                .send({message:err.message||
                `Something went wrong`})
      });
};

// 2. seelct * from Author where id=?=>findByPK
exports.findByPk=(req,resp)=>{
    const id=parseInt(req.params.id);
    Author.findByPk(id)
        .then(data=>resp.json(data))
        .catch(err=>{
            resp.status(500)
                .send({message:err.message||
               `Something went wrong`})
        });
};

// //create a new Author
 exports.createAuthor=(req,resp)=>{
     if(!req.body.AuthorName){
         resp.status(400)
         .send({message:"Author name must be provided"});
    }
      const newAuthor={
    
        authorid:req.body.authorid,
        authorname:req.body.authorname,
        bookname:req.body.bookname,
          craetedAt:new Date(),
          updatedAt:new Date()
     };
     Author.create(newAuthor)
     .then(data=>resp.send(data))
     .catch(err=>{
         resp.status(500)
         .send({message:err.message})
    })
 };

//update by id
exports.updateAuthor=(req,resp)=>{
    const c_id=parseInt(req.params.id);
    Author.update(req.body,{where:{id:c_id}})
    .then(num=>{
        if(num>1){
            resp.send({message:`people with id= ${id} updated successfully`});
        }
        else{
            resp.send({message:`cannot Author with id ${id} updated successfully`});
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
    Author.destroy({where:{id:c_id}})   
    .then(num=>{
        if(num==1){
            resp.send({message:`Author with id=${id} deleted sucessfully!`});
        }
        else{
            resp.send({message:`Author can not delet with id=${id} deleted sucessfully may be Author not found!`});
        }
    })
    .catch((err=>{
        resp.status(500).send({
            message:err.message || "could not delete person with id ="+id
        })
    }))
}