import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders} from '@angular/common/http'
import { Observable } from 'rxjs';
import { IProductpage } from 'src/IProductpage';
import {map} from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class ProductpageService {

  private base_url="http://localhost:3000/app";
  httpOptions={
    headers:new HttpHeaders({'Content-Type':'application/json'})
  }
  constructor(private httpClient:HttpClient) { }

  getProductPage():Observable<IProductpage []>{
    return this.httpClient.get<IProductpage []>(this.base_url+"/productpages");
    
  }

  getProduct(){
    return this.httpClient.get<IProductpage []>(this.base_url+"/productpages")
    .pipe(map((res:any)=>{
      return res;
    }))
  }

  productAdd(IProduct:IProductpage):Observable<IProductpage>{
    let httpheader=new HttpHeaders()
    .set('Content-type','Appplication/json');
    let options={
      headers:httpheader
    };
    return this.httpClient.post<IProductpage>(this.base_url+"/productpages/add",IProduct,options);

  }


}
