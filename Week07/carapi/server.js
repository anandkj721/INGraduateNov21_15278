const express=require('express');
const server=express();
const port=3000;
const cors=require('cors');
const CORS_OPTIONS={origin:"http://localhost:4200"};
server.use(express.json())
server.use(express.urlencoded({extended:true}))
server.use(cors(CORS_OPTIONS));

//require('./app/app-route')(server);

const db=require('./db/models');
db.sequelize.sync();

server.get('/',(req,resp)=>{
    resp.send({message:"Welcome to express + postgre+ node"});
})

require('./app/app-route')(server);
server.listen(port,()=>{
    console.log(`http://localhost:${port} started`);
})