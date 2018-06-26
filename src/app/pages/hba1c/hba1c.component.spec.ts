import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Hba1cComponent } from './hba1c.component';

describe('Hba1cComponent', () => {
  let component: Hba1cComponent;
  let fixture: ComponentFixture<Hba1cComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Hba1cComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Hba1cComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
