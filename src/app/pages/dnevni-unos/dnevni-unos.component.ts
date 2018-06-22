import {Component, OnInit} from '@angular/core';
import {FormControl, FormGroup} from '@angular/forms';
import {Headers, Http} from '@angular/http';
import {Router} from '@angular/router';

@Component({
  selector: 'app-dnevni-unos',
  templateUrl: './dnevni-unos.component.html',
  styleUrls: ['./dnevni-unos.component.css']
})
export class DnevniUnosComponent implements OnInit {

  odg = '';

  public dnevniUnosForm = new FormGroup({
    insulin: new FormControl(),
    datumDu: new FormControl(),
    kolicinaJedinica: new FormControl()
  });

  constructor(private _http: Http, private _router: Router) {
  }

  ngOnInit() {
  }

  public dnevni_unos() {
    // tslint:disable-next-line:max-line-length
    const data =
      'insulin=' +
      this.dnevniUnosForm.value.insulin +
      '&datumDu=' +
      this.dnevniUnosForm.value.datumDu +
      '&kolicinaJedinica=' +
      this.dnevniUnosForm.value.kolicinaJedinica;

    // console.log(data);
    // console.log(localStorage.getItem('token'));

    const headers = new Headers();
    headers.append('Content-Type', 'application/x-www-form-urlencoded');
    headers.append('token', localStorage.getItem('token'));

    this._http.post('http://localhost/projects/dnevni_unos.php', data, {headers: headers}).subscribe((result) => {
      // this._router.navigateByUrl('allrooms');
      this.odg = result.toString();
      console.log('Result odgovor: \n' + this.odg);
    }, (error) => {
      // this._router.navigateByUrl('home');
      this.odg = error.toString();
      console.log('Error odgovor: \n' + this.odg);
    });
  }
}
