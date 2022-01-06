const express=require('express');
const {USER}=require('./user');

const server=express();
const port=3000;
const users1=USER;
const cors=require('cors');
const CORS_OPTIONS= {
    origin: 'http://localhost:4200',
    optionsSuccessStatus: 200 
  }

  server.use(cors(CORS_OPTIONS));
server.get("/",(req,resp)=>{
    resp.send("hi");
});
server.get('/userapi',(req,resp)=>{
    resp.setHeader("Content-Type","application/json")
    resp.send(users1);
});
server.get('/userapi/users',(req,resp)=>{
    resp.setHeader("Content-Type","application/json")
    resp.send(users1);
});
server.use(express.json())
server.use(express.urlencoded({extended:true}));
server.post('/userapi/add',(req,resp)=>{
    resp.setHeader("Content-Type","application/json")
    console.log(req.body);
    const user=req.body;
    users1.push(user);
    resp.send(JSON.stringify(user)+" added in user list");  
});
server.listen(port,()=>{
    console.log("http://localhost:3000 started ");
});
