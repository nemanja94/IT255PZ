import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  public isAuth: boolean; // Promenljiva koja pokaziuje da li je korisnik ulogovan

  constructor(private _router: Router) {}

  /**
   * ngOnInit() funkcija je ugradjena u sam Angular i pri pokretanju servera, ona se prvo izvrsava,
   * kako joj ime i govori.
   * Kada se pokrene, proveri da li je na localStorage(takodje ugradjeno u Angular) postavljena vrednost tokena koji se nalazi u bazi.
   * Svaki korisnik dobija svoj token
   * Ukoliko je postavljen token, isAuth dobija vrednost true i opcije u navbaru bivaju prikazane korisniku
   * Ukoliko nije postavljen token, korisniku se prikazuju samo Home, Login i Register komponente, odnosno linkovi u navbaru
   */
  public ngOnInit() {
    if (localStorage.getItem('token')) {
      this.isAuth = true;
    } else {
      this.isAuth = false;
    }
  }

  /**
   * Ova funkcija, kada korisnik klikne na logout:
   * uklanja token iz localStorage
   * postavlja isAuth na false
   * ponovo ucitava app
   */
  public logOut() {
    localStorage.removeItem('token');
    this.isAuth = false;
    location.reload();
  }
}
