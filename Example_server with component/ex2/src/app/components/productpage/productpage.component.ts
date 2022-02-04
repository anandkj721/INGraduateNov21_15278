import { Component, Input, OnInit } from '@angular/core';
import { ProductpageService } from 'src/app/services/productpage.service';
import { IProductpage } from 'src/IProductpage'; 
import { CartService} from 'src/app/services/shared/cart.service';
import { Router } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { filter } from 'rxjs';
import {FillterPipe } from 'src/app/shared/fillter.pipe'

@Component({
  selector: 'app-productpage',
  templateUrl: './productpage.component.html',
  styleUrls: ['./productpage.component.css']
})
export class ProductpageComponent implements OnInit {
  public productList : any ;
  
  public filterCategory : any
  searchKey:string ="";
  
  addCartData:any;
  pQuantity:any
  productPage:IProductpage[]=[];
  adduserdata: any;
 
  constructor(private productpageService:ProductpageService,private cartService : CartService,private router:Router  ) { }

  ngOnInit(): void {
  
    
    this.productpageService.getProduct()
    .subscribe(res=>{
      this.productList=res; 
      this.productList.forEach((a:any) => {
        Object.assign(a,{quantity:1,total:a.price});
      });
    })

    this.getProductPage();

    this.cartService.search.subscribe((val:any)=>{
      this.searchKey = val;
    })
  }

  addtocart(item: any,pQuantity:number){
    if (pQuantity >=1){
      this.cartService.addtoCart(item,pQuantity);
    console.log("addtocart()........... productpage "+item +" quantity :" +pQuantity)
    }
    else{
      alert(item.productName +" "+"Please Select Quantity Of Product !!!")
    }
    // this.cartService.addtoCart(item,pQuantity);
    // console.log("addtocart()........... productpage "+item +" quantity :" +pQuantity)
  }
  
  getProductPage(){
    this.productpageService.getProductPage().subscribe(productPage=>this.productPage=productPage)
  }

 }
