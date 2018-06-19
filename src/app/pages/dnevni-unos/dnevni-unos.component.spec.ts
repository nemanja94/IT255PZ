import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DnevniUnosComponent } from './dnevni-unos.component';

describe('DnevniUnosComponent', () => {
  let component: DnevniUnosComponent;
  let fixture: ComponentFixture<DnevniUnosComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DnevniUnosComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DnevniUnosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
