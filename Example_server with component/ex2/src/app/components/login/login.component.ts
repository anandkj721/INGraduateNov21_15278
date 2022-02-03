import { Component, OnInit,ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { FormBuilder,FormGroup,Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UserService } from 'src/app/services/user.service';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  loginForm!: FormGroup;
  submitted = false;

  constructor(private formBuilder: FormBuilder,private http:HttpClient,
    private router:Router, public userService:UserService) { }

    ngOnInit(): void {
      this.loginForm=this.formBuilder.group({
        userName:['',Validators.required],
        password: ['', [Validators.required, Validators.minLength(6)]]
      })
  }
  get f() { return this.loginForm.controls; }
//  id:any='';

  onSubmit(){

    this.userService.userLogin().subscribe(res=>{
      const data=res.find((a:any)=>{
        return a.userName===this.loginForm.value.userName && a.password===this.loginForm.value.password;
      });
      if(data){
        alert("Login suceesfull");
        this.loginForm.reset;
        this.router.navigateByUrl('/home');
      }
      else{
        alert("Invalied creadential");
      }
    })

  }
}

