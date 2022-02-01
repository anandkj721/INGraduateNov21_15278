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
    return this.httpClient.get<any>(this.base_url+"/productpages")
    .pipe(map((res:any)=>{
      return res;
    }))
  }

  productAdd(product:IProductpage):Observable<IProductpage>{
    let httpheader=new HttpHeaders()
    .set('Content-type','application/json');
    let options={
      headers:httpheader
    };
    return this.httpClient.post<IProductpage>(this.base_url+"/productpages/add",product,options);
  }

  getProductIdForm(employeeid:number):Observable<IProductpage >{
    return this.httpClient.get<IProductpage >(this.base_url+"/productpages/"+employeeid);
  }

  productUpdate(product:IProductpage):Observable<number>{
    
    let httpheader=new HttpHeaders()
    .set('Content-type','application/json');
    let options={
      headers:httpheader
    };
    return this.httpClient.put<number>(this.base_url+"/productpages/update/"+product.id,product,options);
  }


  productDeleteById(productId:number):Observable<number>{
    let httpheader=new HttpHeaders()
    .set('Content-type','application/json');
    let options={
      headers:httpheader
    };
    return this.httpClient.delete<number>(this.base_url+"/productpages/delete/"+productId);
  }

}
