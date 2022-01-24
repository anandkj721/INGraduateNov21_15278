import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
import { AddUserComponent } from './add-user/add-user.component';
import { ShowAllUserComponent } from './show-all-user/show-all-user.component';
import { UpdateUserComponent } from './update-user/update-user.component';
import { FindUserComponent } from './find-user/find-user.component';
import { FormsModule } from '@angular/forms'
import { HttpClientModule} from '@angular/common/http'
import {  EmployeeService} from './service/employee.service';
import { IEmployeeData}  from './IEmployeeData';
//import {InMemoryWebApiModule } from 'angular-in-memory-web-api';


@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    FooterComponent,
    AddUserComponent,
    ShowAllUserComponent,
    UpdateUserComponent,
    FindUserComponent,
  
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    //InMemoryWebApiModule.forRoot(IEmployeeData)

  ],
  providers: [EmployeeService],
  bootstrap: [AppComponent]
})
export class AppModule { }
