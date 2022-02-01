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
  
  public products : any []= [];
  public grandTotal : number=0;


  //added

  ngOnInit()
   {
    this.cartService.getProductList()
    .subscribe(data=>{
      this.products = data;
      console.log(this.products);
      this.products.forEach(element => {
        console.log(element.products)
        
      });
      this.grandTotal = this.cartService.getTotalPrice();

      //console.log("addcart component:"+this.grandTotal)
    })
   }

   removeItem(item: any){
    this.cartService.removeCartItem(item);
  }
  emptycart(){
    this.cartService.removeAllCart();
  }

  }

