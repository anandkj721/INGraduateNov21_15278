import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { IUser } from '../IUser';
import {map} from 'rxjs/operators';
import { LoginComponent } from '../components/login/login.component';
import { FormGroup } from '@angular/forms';
@Injectable({
  providedIn: 'root'
})
export class UserService {
  form!:FormGroup;

  private base_url ="http://localhost:3000/app";
  httpOptions={
    headers:new HttpHeaders({'Content-Type':'application/json'})
  };
  constructor(private httpClient:HttpClient) { }
  addUser(user: any):Observable<IUser> {
    let httpheader=new HttpHeaders()
    .set('Content-type','application/json');
    let options={
      headers:httpheader
    };
    return this.httpClient.post<IUser>(this.base_url+"/users/add",JSON.stringify(user), this.httpOptions);
  }

  userLogin():Observable<IUser[]> {
    return this.httpClient.get<IUser[]>(this.base_url+"/users");
  }

  find(id:number): Observable<IUser> {
    return this.httpClient.get<IUser>(this.base_url+"/users"+id);
   }

}






