import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpHandler, HttpHeaders } from '@angular/common/http';
import { FormBuilder,FormGroup,Validators,FormGroupDirective,Form, FormControl } from '@angular/forms';
import { Router } from '@angular/router';
import { UserService } from '../services/user.service';
import { IUser } from '../IUser';
import { first } from 'rxjs/operators';
import { Observable } from 'rxjs';


@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  form!: FormGroup ;
  UserService: any;
  httpClient: any;
  submitted = false;
  registerForm!: FormGroup;

  constructor(private formBuilder: FormBuilder,private http:HttpClient,private dataService:UserService,private router:Router,private userService :UserService) { }

  data ={
    firstName: '',
    lastName:'',
    address: '',
    phoneNumber: '',
    userName:'',
    email: '',
    password:""
  }
  //registerForm = this.formBuilder.group({});

  ngOnInit():void {
    this.registerForm = this.formBuilder.group({
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      address:['', Validators.required],
      phoneNumber:['', Validators.required],
      email: ['', [Validators.required, Validators.email,Validators.pattern('^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$')]],
      userName:['', Validators.required],
      password: ['', [Validators.required, Validators.minLength(6)]]
  });
}

// // convenience getter for easy access to form fields
get f() { return this.registerForm.controls; }

submit(){

  this.submitted=true;
  const user:IUser=this.registerForm.value;
  console.log("submit() "+JSON.stringify(user))
  this.adduser(user)
  alert("registratoin sucesfull");
}
adduser(user:IUser){
  this.userService.addUser(user).subscribe(
        data=>{
          //this.datasave=true;
          console.log("value is "+data);
        }
      )
    }


}















// get firstName(){
//   return this.registerForm.get('firstName')
// }
// get laststName(){
//   return this.registerForm.get('laststName')
// }
// get address(){
//   return this.registerForm.get('address')
// }
// get phoneNumber(){
//   return this.registerForm.get('phoneNumber')
// }
// get email(){
//   return this.registerForm.get('email')
// }
// get userName(){
//   return this.registerForm.get('userName')
// }

// get password(){
//   return this.registerForm.get('password')
// }
