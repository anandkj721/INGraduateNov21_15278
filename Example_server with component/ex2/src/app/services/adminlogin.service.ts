import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { IAdmin } from '../Iadmin';

@Injectable({
  providedIn: 'root'
})
export class AdminloginService {
  private admin_urls = "http://localhost:3000/app/admin";
  private admin_find = "http://localhost:3000/app/admin";
  private admin_add = "http://localhost:3000/app/admin/add";
  private admin_update = "http://localhost:3000/app/admins/update/";
   private admin_delete = "http://localhost:3000/app/admins/delete/";
 
  httpOptions = {
   headers: new HttpHeaders({ 'Content-Type': 'application/json' })
 };
 
   constructor(private httpclient:HttpClient) { }
 
 
 getAdmins():Observable<IAdmin[]>{
   return this.httpclient.get<IAdmin[]>(this.admin_urls);
 };
 
 find(id:number): Observable<IAdmin> {
  return this.httpclient.get<IAdmin>(this.admin_find+"/"+id);
 }
 
 
 create(admins: any): Observable<IAdmin> {
  return this.httpclient.post<IAdmin>(this.admin_add, JSON.stringify(admins), this.httpOptions);
 }
 
 
 update(id:number, admins: any): Observable<IAdmin> {
  return this.httpclient.put<IAdmin>(this.admin_update + id, JSON.stringify(admins), this.httpOptions)
 }
 
 delete(id:number){
  return this.httpclient.delete<IAdmin>(this.admin_delete + id, this.httpOptions)
 }
 
 
 }