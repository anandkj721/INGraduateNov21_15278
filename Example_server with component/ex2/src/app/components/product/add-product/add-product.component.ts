import { Component, OnInit } from '@angular/core';
import { Observable, observable} from 'rxjs';
import { ProductpageService } from 'src/app/services/productpage.service';
import { IProductpage } from 'src/IProductpage';

import { FormGroup,FormControl,FormBuilder,NgForm,Validator, Validators } from '@angular/forms';

@Component({
  selector: 'app-add-product',
  templateUrl: './add-product.component.html',
  styleUrls: ['./add-product.component.css']
})
export class AddProductComponent implements OnInit {

  constructor(private formBuilder:FormBuilder,private ProductpageService:ProductpageService ) { }

  addProductForm!:FormGroup;
  addProduct!:IProductpage[];
  allProduct!:Observable<IProductpage []>;
  datasave=false;
  ngOnInit(): void {
    
    this.addProductForm=this.formBuilder.group({
      productName:['',[Validators.required]],
      productImage:['',[Validators.required]],
      productPrice:['',[Validators.required]],
      productDescription:['',[Validators.required]],
    });
  }
  onFormSubmit(){
    debugger;
    this.datasave=false;

    let product=this.addProductForm.value;
    this.productAdd(product);
    this.addProductForm.reset();
    //console.log("add product component!!!");
  }
  productAdd(Iproduct:IProductpage){
    debugger;
    this.ProductpageService.productAdd(Iproduct).subscribe(
      product=>{
        this.datasave=true;
        this.getProduct();
      }
    )
  }
  getProduct(){
    this.allProduct=this.ProductpageService.getProduct();
  }

}
