import { Component, OnInit,Input } from '@angular/core';
import { ProductpageService } from 'src/app/services/productpage.service';
import { IProductpage } from 'src/IProductpage'; 
import { ICart } from 'server/app/Interface/ICart';
import { ActivatedRoute } from '@angular/router';
import { CartService } from 'src/app/services/shared/cart.service';
@Component({
  selector: 'app-addcart',
  templateUrl: './addcart.component.html',
  styleUrls: ['./addcart.component.css']
})
export class AddcartComponent implements OnInit {

  constructor(private productpageService:ProductpageService,private activatedRoute: ActivatedRoute,
    private cartService :CartService) { }
  
  public products : any = [];
  public grandTotal : any;

  public addCart:any=[];
  //added

  ngOnInit()
   {
    this.cartService.getProducts()
    .subscribe(res=>{
      this.products = res;
      console.log(this.products);
      this.grandTotal = this.cartService.getTotalPrice();
    })
    this.grandTotal=this.cartService.getTotalPrice();

    //added value from addCartData
    //this.addCart=this.activatedRoute.snapshot.queryParams['addCartData']
    //console.log(this.addCart);
   }

   removeItem(item: any){
    this.cartService.removeCartItem(item);
  }
  emptycart(){
    this.cartService.removeAllCart();
  }

  }

