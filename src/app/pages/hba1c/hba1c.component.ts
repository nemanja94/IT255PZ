import {Component, OnInit} from '@angular/core';
import {Headers, Http} from '@angular/http';
import {Router} from '@angular/router';

@Component({
  selector: 'app-hba1c',
  templateUrl: './hba1c.component.html',
  styleUrls: ['./hba1c.component.css']
})
export class Hba1cComponent implements OnInit {
  hba1c: string;

  constructor(private _http: Http, private router: Router) {
  }

  ngOnInit() {
    const headers = new Headers();
    headers.append('Content-Type', 'application/x-www-form-urlencoded');
    headers.append('token', localStorage.getItem('token'));

    this._http.get('http://localhost/projects/getHba1c.php', {headers: headers}).subscribe(
      data => {
        this.hba1c = data.toString();
      },
      error => {
        console.log('Error dnevnik.component.ts: \n' + error.toString());
      }
    );
  }
}
