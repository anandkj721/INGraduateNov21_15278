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

  constructor() { }

  addProductForm!:FormGroup;
  addProduct!:IProductpage[];
  ngOnInit(): void {
  }
  onFormSubmit(){

  }

}
