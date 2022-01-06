const express=require('express');
const app=express();
const port =3000;
app.get('/',(req,resp)=>{
    resp.send("WElcome to Express demo");
})



app.post('/',(req,resp)=>{
    resp.send("Anandkumar Post Method ");
})
app.put('/',(req,resp)=>{
    resp.send("Anandkumar put Method");
})
app.delete('/',(req,resp)=>{
    resp.send("Anandkumar delete Method");
})




app.listen(port,()=>{
    console.log(`http://localhost:${port} Express server started `);;
})