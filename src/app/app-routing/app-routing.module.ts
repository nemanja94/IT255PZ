import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {RouterModule, Routes} from '@angular/router';

import {HomeComponent} from '../pages/home/home.component';
import {LoginComponent} from '../pages/login/login.component';
import {RegisterComponent} from '../pages/register/register.component';
import {DnevniUnosInsulinaComponent} from '../pages/dnevni-unos-insulina/dnevni-unos-insulina.component';
import {DnevniUnosGlikemijeComponent} from '../pages/dnevni-unos-glikemije/dnevni-unos-glikemije.component';

const routes: Routes = [
  {path: 'home', component: HomeComponent},
  {path: 'login', component: LoginComponent},
  {path: 'register', component: RegisterComponent},
  // { path: 'dnevni_unos', component: DnevniUnosComponent }
  {path: 'dnevni-unos-insulina', component: DnevniUnosInsulinaComponent},
  {path: 'dnevni-unos-glikemije', component: DnevniUnosGlikemijeComponent}
];

@NgModule({
  imports: [CommonModule, RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {
}
