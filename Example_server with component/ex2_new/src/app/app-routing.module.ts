import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AddProductComponent } from './components/product/add-product/add-product.component';
import { NavComponent} from 'src/app/components/nav/nav.component';

const routes: Routes = [
  {path:'navbar',component:NavComponent,pathMatch:'full'},
  {path:'addProduct',component:AddProductComponent,pathMatch:'full'},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
