import { Component, OnInit,Input } from '@angular/core';
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
  product!:IProductpage[];
  allProduct!:Observable<IProductpage []>;
  productIdUpdate:any;
  
  datasave=false;

 
  ngOnInit(): void {
    
    this.addProductForm=this.formBuilder.group({
      productName:['',[Validators.required]],
      productImage:['',[Validators.required]],
      productPrice:['',[Validators.required]],
      productDescription:['',[Validators.required]],
    });
    this.getProduct();
    this.resetProductForm();
  }
  onFormSubmit(){
   
     this.datasave=false;
     const product:IProductpage=this.addProductForm.value;
     this.createProduct(product);
    
  }
  getProduct(){
    this.allProduct=this.ProductpageService.getProduct();
  }

 
  loadProduct(productId:number){
      const product:IProductpage=this.addProductForm.value;
      this.ProductpageService.getProductIdForm(productId).subscribe(product=>{ 
        
        this.productIdUpdate=product.id;     
        this.addProductForm.controls['productName'].setValue(product.productName);
        this.addProductForm.controls['productImage'].setValue(product.productImage);
        this.addProductForm.controls['productDescription'].setValue(product.productDescription);
        this.addProductForm.controls['productPrice'].setValue(product.productPrice);  
        this.getProduct();
        })
    }

    productDelete(productId:number){
      this.ProductpageService.productDeleteById(productId)
      .subscribe(data=>{
        this.getProductDelete();
        
      })
      this.getProduct();
    }
    getProductDelete(){
      this.allProduct=this.ProductpageService.getProduct();
    }


    createProduct(product:IProductpage){
     debugger;
      if(this.productIdUpdate==null){
        this.ProductpageService.productAdd(product).subscribe(
          ()=>{
            this.datasave=true;
            this.getProduct();
            this.resetProductForm();
          });
      
      }
      else{
        product.id=this.productIdUpdate;
        this.ProductpageService.productUpdate(product).subscribe(
          ()=>{
            this.datasave=true;
            this.getProduct();
            
          });
          this.resetProductForm();
      }
    }

    resetProductForm(){
      this.addProductForm.reset();
    }
  }
