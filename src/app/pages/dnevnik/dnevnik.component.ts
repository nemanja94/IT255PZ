import {Component, OnInit} from '@angular/core';
import {Headers, Http} from '@angular/http';
import {Router} from '@angular/router';

@Component({
  selector: 'app-dnevnik',
  templateUrl: './dnevnik.component.html',
  styleUrls: ['./dnevnik.component.css']
})
export class DnevnikComponent implements OnInit {

  dnevnik: any = [];

  constructor(private _http: Http, private router: Router) {
  }

  ngOnInit() {
    const headers = new Headers();
    headers.append('Content-Type', 'application/x-www-form-urlencoded');
    headers.append('token', localStorage.getItem('token'));

    this._http.get('http://localhost/projects/getDnevnik.php', {headers: headers}).subscribe(
      data => {
        this.dnevnik = JSON.parse(data['_body']).zapisi;
      },
      error => {
        console.log('Error dnevnik.component.ts: \n' + error.toString());
      }
    );
  }

  public obirsi_unos(id: number) {
    const headers = new Headers();
    headers.append('Content-Type', 'application/x-www-form-urlencoded');
    headers.append('token', localStorage.getItem('token'));

    const data = 'id=' + id;

    this._http.post('http://localhost/projects/obrisi_unos.php', data, {headers: headers}).subscribe(
      response => {
        console.log(response.toString());
        location.reload();
      },
      error => {
        console.log(error.toString());
      }
    );
  }

}
