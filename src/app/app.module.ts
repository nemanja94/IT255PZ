import {BrowserModule} from '@angular/platform-browser';
import {NgModule} from '@angular/core';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {HttpModule} from '@angular/http';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';

import {AppComponent} from './app.component';
import {HomeComponent} from './pages/home/home.component';
import {LoginComponent} from './pages/login/login.component';
import {RegisterComponent} from './pages/register/register.component';
import {AppRoutingModule} from './app-routing/app-routing.module';
import {DnevniUnosGlikemijeComponent} from './pages/dnevni-unos-glikemije/dnevni-unos-glikemije.component';
import {DnevniUnosInsulinaComponent} from './pages/dnevni-unos-insulina/dnevni-unos-insulina.component';
import {DnevnikComponent} from './pages/dnevnik/dnevnik.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    LoginComponent,
    RegisterComponent,
    DnevniUnosGlikemijeComponent,
    DnevniUnosInsulinaComponent,
    DnevnikComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    HttpModule,
    NgbModule.forRoot()
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {
}
