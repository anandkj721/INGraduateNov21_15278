import { Component, OnInit } from '@angular/core';
import { EmployeeService } from '../service/employee.service';
import { IEmployee } from '../IEmployee';

@Component({
  selector: 'app-show-all-user',
  templateUrl: './show-all-user.component.html',
  styleUrls: ['./show-all-user.component.css']
})
export class ShowAllUserComponent implements OnInit {

  employees:IEmployee[]=[];
  constructor(private employeeService:EmployeeService ) { }

  ngOnInit(): void {
    this.getEmployee();
  }
  getEmployee(){
    this.employeeService.getEmployee().subscribe(allemployee=>this.employees=allemployee)
  }

}
