import { Component, OnInit } from '@angular/core';
import { CartService } from 'src/app/services/shared/cart.service';
import { ProductpageService } from 'src/app/services/productpage.service';
import { IProductpage } from 'src/IProductpage'; 

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  public totalItem : number = 0;
  constructor(private cartService:CartService,private productpageService:ProductpageService ) { }

  //added
  productPage:IProductpage[]=[];

  ngOnInit(): void {
    this.cartService.getProducts()
    .subscribe(res=>{
      this.totalItem = res.length;
    })
  }

  //added 
  getProductPage(){
    this.productpageService.getProductPage().subscribe(productPage=>this.productPage=productPage)
  }

}
