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
  public search = new BehaviorSubject<string>("");
  

 
  getProductList(){
    return this.productList.asObservable();
  }

  getProducts(){
    return this.productList.asObservable();
  }
  setProduct(product : any){
    this.cartItemList.push(...product);
    this.productList.next(product);
  }
  addtoCart(product:any,pQuantity:number){
    const _product={product:product,quantity:pQuantity};
    //console.log("addtocart : " +JSON.stringify(_product));
    this.cartItemList.push(_product);
    this.productList.next(this.cartItemList);
    //console.log("cartlist............"+JSON.stringify(this.cartItemList));
    //this.getTotalPrice();
  }

  getTotalPrice(product:any,quantity:any):number {
    let grandTotal=0;
    this.cartItemList.map((a:any)=>{
      console.log(":::::::::::::"+JSON.stringify(this.cartItemList));
      const q:number=parseInt(a.quantity);
      console.log(">>>>>>>"+q);
      grandTotal+=a.product.productPrice*q;
      console.log(grandTotal);
      //grandTotal+=a.total;
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

}
