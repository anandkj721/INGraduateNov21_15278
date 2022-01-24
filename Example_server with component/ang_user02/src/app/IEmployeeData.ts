import {InMemoryDbService, RequestInfo } from 'angular-in-memory-web-api';
import { Observable } from 'rxjs';

export class IEmployeeData implements InMemoryDbService{
    createDb() {
        let employeeDetails=[
            {id:1,firstName:'Anandkumar' ,lastName:'Jaiswar',email:'akj721@gmail.com'},
            {id:1,firstName:'katrina' ,lastName:'kaif',email:'kat123@gmail.com'},
            {id:1,firstName:'Alexendra' ,lastName:'Daddrio',email:'Alexa111@gmail.com'},
        ];
        return { employeeDeatils:employeeDetails}
    }
}   