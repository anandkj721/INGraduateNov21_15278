import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AddProductComponent } from './components/product/add-product/add-product.component';
import { NavComponent} from 'src/app/components/nav/nav.component';
import { AddcartComponent } from './components/cart/addcart/addcart.component';
import { ProductpageComponent } from './components/productpage/productpage.component';
import { CheckoutComponent } from './components/checkout/checkout.component';

const routes: Routes = [
  {path:'', redirectTo:'productPage',pathMatch:'full'},
  {path:'productPage',component:ProductpageComponent},
  // {path:'navbar',component:NavComponent},
   {path:'addProduct',component:AddProductComponent},
  {path:'cart',component:AddcartComponent},
  {path:'checkout',component:CheckoutComponent}
 
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
