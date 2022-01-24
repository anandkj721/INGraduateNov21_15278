import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders} from '@angular/common/http'
import { Observable } from 'rxjs';
import { IEmployee} from '../IEmployee'

@Injectable({
  providedIn: 'root'
})
export class EmployeeService {

  private base_url="http://localhost:3000";
  httpOptions={
    headers:new HttpHeaders({'Content-Type':'application/json'})
  }

  constructor(private httpClient:HttpClient) { }
  getEmployee():Observable<IEmployee []>{
    return this.httpClient.get<IEmployee []>(this.base_url+"/employeeapi");
  }
  //for post
  
  postEmployee(iEmployee: IEmployee):Observable<IEmployee >{
    let httpHeaders=new HttpHeaders().set('Content-Type','application/json');
    let Options={
      headers:httpHeaders
    };
    return this.httpClient.post<IEmployee>(this.base_url+"/employeeapi/add",iEmployee,Options);
  }
  //for showing data ---11/01/22
  // getEmployeeDetails():Observable<IEmployee []>{
  //   return this.httpClient.get<IEmployee[]>(this.base_url+'/employeeDeatils')
  // }


}
