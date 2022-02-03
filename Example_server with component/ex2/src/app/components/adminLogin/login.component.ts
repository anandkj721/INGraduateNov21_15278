import { FormGroup, FormControl, Validators,FormBuilder} from '@angular/forms';
import { Router } from '@angular/router';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { AdminloginService } from 'src/app/services/adminlogin.service';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class adminlogin implements OnInit {
  form!: FormGroup;

  emailId = "";
  password = "";

  btnDisabled = false;

  constructor(private formbuilder:FormBuilder,private http: HttpClient,
    private router:Router,public adminService: AdminloginService) { }

  ngOnInit(): void {
    this.form = this.formbuilder.group({

      emailId:[''],
      password:['']

    });

    // login(){
    //   this.userService.getUsers().subscribe(res => {
    //     const user=res.find((a:any)=> {
    //       return a.emailId === this.form.value.emailId && a.password === this.form.value.password
    //     });
  }
  login(){
    this.adminService.getAdmins().subscribe(res => {
      const user=res.find((a:any)=> {
        return a.emailId === this.form.value.emailId && a.password === this.form.value.password
      });

      if(user){
        alert("Login Success");
        this.form.reset;
        this.router.navigateByUrl('/admin');
      }else{
        alert("Please enter email id and password..!!");
      }
    },err=>{
      alert("Something went wrong!!");
    })
  }
}