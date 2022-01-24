const db=require('../db/models');//index.js=>db

const Book=db.Book;

// 1. select * from Book => findAll
exports.findAll=(req,resp)=>{
    Book.findAll()
       .then(data=>resp.json(data))
        .catch(err=>{
            resp.status(500)
                .send({message:err.message||
                `Something went wrong`})
      });
};

// 2. seelct * from Book where id=?=>findByPK
exports.findByPk=(req,resp)=>{
    const id=parseInt(req.params.id);
    Book.findByPk(id)
        .then(data=>resp.json(data))
        .catch(err=>{
            resp.status(500)
                .send({message:err.message||
               `Something went wrong`})
        });
};

// //create a new Book
 exports.createBook=(req,resp)=>{
     if(!req.body.bookName){
         resp.status(400)
         .send({message:"book name must be provided"});
    }
      const newBook={
        bookName:req.body.bookName,
        BookName:req.body.BookName,
        publicationdate:req.body.publicationdate,
          craetedAt:new Date(),
          updatedAt:new Date()
     };
     Book.create(newBook)
     .then(data=>resp.send(data))
     .catch(err=>{
         resp.status(500)
         .send({message:err.message})
    })
 };

//update by id
exports.updateBook=(req,resp)=>{
    const c_id=parseInt(req.params.id);
    Book.update(req.body,{where:{id:c_id}})
    .then(num=>{
        if(num>1){
            resp.send({message:`book with id= ${id} updated successfully`});
        }
        else{
            resp.send({message:`cannot Book with id ${id} updated successfully`});
        }
    })
    .catch(err=>{
        resp.status(500)
        .send({message:err.message || "some error retriving Book data"})
    })

   }  

//delete
exports.delete=(req,resp)=>{
    const c_id=parseInt(req.params.id);
    Book.destroy({where:{id:c_id}})   
    .then(num=>{
        if(num==1){
            resp.send({message:`Book with id=${id} deleted sucessfully!`});
        }
        else{
            resp.send({message:`Book can not delet with id=${id} deleted sucessfully may be Book not found!`});
        }
    })
    .catch((err=>{
        resp.status(500).send({
            message:err.message || "could not delete book with id ="+id
        })
    }))
}