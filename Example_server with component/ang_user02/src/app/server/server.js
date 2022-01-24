const express=require('express');
const {EMPLOYEE}=require('./employee');

const server=express();
const port=3000;
const employee1=EMPLOYEE;
console.log(employee1);
const cors=require('cors');
const CORS_OPTIONS= {
    origin: 'http://localhost:4200',
    optionsSuccessStatus: 200 
  }

  server.use(cors(CORS_OPTIONS));
server.get("/",(req,resp)=>{
    resp.send("hi");
});
server.get('/employeeapi',(req,resp)=>{
    resp.setHeader("Content-Type","application/json")
    resp.send(employee1);
});
server.get('/employeeapi/employees',(req,resp)=>{
    resp.setHeader("Content-Type","application/json")
    resp.send(employee1);
});

// server.get('/jq.js',(req,resp)=>{
//     resp.sendFile(__dirname+'/jq.js');
// })
//add
// server.get('/jquery.min.js',(req,resp)=>{
//     resp.sendFile(__dirname+"/node_modules/jquery/dist/jquery.min.js");  
//   })
//   server.get('/bootstrap.min.css',(req,resp)=>{
//     resp.sendFile(__dirname+"/node_modules/bootstrap/dist/css/bootstrap.min.css");  
//   })
//   server.get('/bootstrap.min.js',(req,resp)=>{
//     resp.sendFile(__dirname+"/node_modules/bootstrap/dist/js/bootstrap.min.js");  
//   })
  //ang_user02\node_modules\bootstrap\dist\js\bootstrap.min.js
  //added
server.use(express.json())
server.use(express.urlencoded({extended:true}));

server.post('/employeeapi/add',(req,resp)=>{
    resp.setHeader("Content-Type","application/json")
    console.log(req.body);
    //add
    const firstName=req.body.firstName;
    const lastName=req.body.lastName;
    const email=req.body.email;
    const id=employee1[employee1.length-1].id+1;
    const employee={"id":id,"firstName":firstName,"lastName":lastName,"email":email};;

    employee1.push(employee);
    console.log(employee);
    resp.send(JSON.stringify(employee)+" added in employeeapi list");  
});
server.listen(port,()=>{
    console.log("http://localhost:3000 started ");
});
