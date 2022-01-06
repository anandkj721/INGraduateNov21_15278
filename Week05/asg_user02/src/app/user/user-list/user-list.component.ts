import { Component, OnInit } from '@angular/core';
import { IUser } from '../IUser'
import { UserService } from '../service/user.service';

@Component({
  selector: 'app-user-list',
  templateUrl: './user-list.component.html',
  styleUrls: ['./user-list.component.css']
})
export class UserListComponent implements OnInit {

  users:IUser[]=[];
  constructor(private userService:UserService) { }

  ngOnInit(): void {
    this.getUsers();
  }
  getUsers(){
    this.userService.getUsers().subscribe(allusers=>this.users=allusers);
  }

}
