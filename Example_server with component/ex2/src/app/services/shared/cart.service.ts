import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders} from '@angular/common/http'
import { Observable } from 'rxjs';
import { IProductpage } from 'src/IProductpage';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CartService {


  private base_url="http://localhost:3000/app";
  httpOptions={
    headers:new HttpHeaders({'Content-Type':'application/json'})
  }
  constructor(private httpClient:HttpClient) { }

  getProductPage():Observable<IProductpage []>{
    return this.httpClient.get<IProductpage []>(this.base_url+"/productpages");
    
  }

  public cartItemList : any =[]
  public productList = new BehaviorSubject<any>([]);
  //public search = new BehaviorSubject<string>("");

 
  getProducts(){
    return this.productList.asObservable();
  }

  setProduct(product : any){
    this.cartItemList.push(...product);
    this.productList.next(product);
  }
  addtoCart(product:any,pQuantity:number){
    // this.cartItemList.push(product);
    // this.productList.next(this.cartItemList);
    // this.getTotalPrice();
    // console.log(this.cartItemList)

    const _product={product:product,quantity:pQuantity};
    this.cartItemList.push(_product);
    
    this.productList.next(this.cartItemList);
    this.getTotalPrice();
    //console.log(this.cartItemList);



  }
  getTotalPrice() : number{
    let grandTotal=0;
    this.cartItemList.map((a:any)=>{
      const q:number=parseInt(a.quantity);
      console.log(q);
      grandTotal+=a.product.total*q;
      console.log("total grand"+grandTotal);
    });
    return grandTotal;
  }
  removeCartItem(product: any){
    this.cartItemList.map((a:any, index:any)=>{
      if(product.id=== a.id){
        this.cartItemList.splice(index,1);
      }
    })
    this.productList.next(this.cartItemList);
  }
  removeAllCart(){
    this.cartItemList = []
    this.productList.next(this.cartItemList);
  }

//added new 
 

  


}
