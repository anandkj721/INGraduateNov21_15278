import { Component, Input, OnInit } from '@angular/core';
import { ProductpageService } from 'src/app/services/productpage.service';
import { IProductpage } from 'src/IProductpage'; 
import { CartService} from 'src/app/services/shared/cart.service';
import { Router } from '@angular/router';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-productpage',
  templateUrl: './productpage.component.html',
  styleUrls: ['./productpage.component.css']
})
export class ProductpageComponent implements OnInit {
  public productList : any ;
  public filterCategory : any;
  addCartData:any;
  pQuantity:any
  productPage:IProductpage[]=[];
  adduserdata: any;
  constructor(private productpageService:ProductpageService,private cartService : CartService,private router:Router  ) { }

  ngOnInit(): void {
  
    
    this.productpageService.getProduct(). 
    subscribe(res=>{
      this.productList=res; 
      this.productList.forEach((a:any) => {
        Object.assign(a,{quantity:1,total:a.price});
      });
    })
    //
    this.getProductPage();
  }

  addtocart(item: any,pQuantity:any){
    //debugger;
    console.log("add cart ......")
    this.cartService.addtoCart(item,this.pQuantity);
    console.log("addcart value is :"+pQuantity)
    //added
    this.productpageService.getProductPage().subscribe(productPage=>this.productPage=productPage)
   // this.router.navigate(['/cart'], {queryParams: {productPage : this.adduserdata}});
    console.log(this.adduserdata);

  }
  

  //
  getProductPage(){
    this.productpageService.getProductPage().subscribe(productPage=>this.productPage=productPage)
  }


 
}
