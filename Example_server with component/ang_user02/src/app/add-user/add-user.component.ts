import { Component, Input, OnInit } from '@angular/core';
import * as $ from 'jquery';
import { EmployeeService } from '../service/employee.service';
import { IEmployee } from '../IEmployee';
import { IEmployeeData } from '../IEmployeeData';



@Component({
  selector: 'app-add-user',
  templateUrl: './add-user.component.html',
  styleUrls: ['./add-user.component.css']
})
export class AddUserComponent implements OnInit {
  employees!:IEmployee[];

  // @Input()  
  // firstName:string="";
  // @Input() 
  // lastName:string="";
  // @Input() 
  // email:string="";
  
  constructor(private employeeService:EmployeeService) { }

  ngOnInit(): void {

      this. getEmployeeDetails();
    
  }
  emp:any;
  getEmployeeDetails(){
   // this.employeeService.getEmployeeDetails().subscribe(emp=>this.employees=emp);
  }

  addUser(){}


}
