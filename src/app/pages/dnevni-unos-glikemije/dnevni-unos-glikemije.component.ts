import {Component, OnInit} from '@angular/core';
import {FormControl, FormGroup} from '@angular/forms';
import {Headers, Http} from '@angular/http';
import {Router} from '@angular/router';

@Component({
  selector: 'app-dnevni-unos-glikemije',
  templateUrl: './dnevni-unos-glikemije.component.html',
  styleUrls: ['./dnevni-unos-glikemije.component.css']
})
export class DnevniUnosGlikemijeComponent implements OnInit {

  public dnevniUnosGlikemijeForm = new FormGroup({
    datumUnosa: new FormControl(),
    vremeUnosa: new FormControl(),
    vrednostGlikemije: new FormControl()
  });

  constructor(private _http: Http, private reouter: Router) {
  }

  ngOnInit() {
  }

  public dnevni_unos_glikemije() {
    const data =
      'vrednostGlikemije=' + this.dnevniUnosGlikemijeForm.value.vrednostGlikemije +
      '&datumUnosa=' + this.dnevniUnosGlikemijeForm.value.datumUnosa +
      '&vremeUnosa=' + this.dnevniUnosGlikemijeForm.value.vremeUnosa;

    const headers = new Headers();
    headers.append('Content-Type', 'application/x-www-form-urlencoded');
    headers.append('token', localStorage.getItem('token'));

    this._http.post('http://localhost/projects/dnevni_unos_glikemije.php', data, {headers: headers}).subscribe(
      (result) => {
        console.log(result.toString());
        location.reload();
      },
      (error) => {
        console.log(error.toString());
      }
    );
  }
}
