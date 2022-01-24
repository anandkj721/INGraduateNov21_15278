import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AddUserComponent } from './add-user/add-user.component';
import { FindUserComponent } from './find-user/find-user.component';
import { HeaderComponent } from './header/header.component';
import { ShowAllUserComponent } from './show-all-user/show-all-user.component';
import { UpdateUserComponent } from './update-user/update-user.component';

const routes: Routes = [
  
  {path:'addUser',component:AddUserComponent,pathMatch:'full'},
  {path:'findUser',component:FindUserComponent,pathMatch:'full'},
  {path:'updateUser',component:UpdateUserComponent,pathMatch:'full'},
  {path:'showAllUser',component:ShowAllUserComponent,pathMatch:'full'}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
