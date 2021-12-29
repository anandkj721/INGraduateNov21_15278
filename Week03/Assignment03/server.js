const express=require('express');
const app=express();
const port =3000;


app.get('/',(req,resp)=>{
    resp.sendFile(__dirname+"/index.html");
});

 app.post('/register',(req,resp,next)=>{
    //resp.sendFile(__dirname+"/success.html");
    const { firstName, lastName } = req.body;
    if(!firstName || !lastName){
        resp.sendFile(__dirname+"/error.html");
    }
    else{
        resp.sendFile(__dirname+"/success.html");
    }

});

app.listen(port,()=>{
    console.log(`http://localhost:${port} Express server started `);;
})
//node server.js