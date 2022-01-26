import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders} from '@angular/common/http'
import { Observable } from 'rxjs';
import { IProductpage } from 'src/IProductpage';


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

}
