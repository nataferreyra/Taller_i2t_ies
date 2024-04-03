import { Component } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { LoginService } from 'src/app/service/login.service';
import * as $ from 'jquery';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  form: FormGroup = new FormGroup({});
  loading = false;

  constructor(
      private formBuilder: FormBuilder,
      private _snackBar: MatSnackBar,
      private router: Router,
      private _login: LoginService
  ) {}

  ngOnInit(): void {
      this.form = this.formBuilder.group({
          usuario: ['', Validators.required],
          contrasenia: ['', Validators.required]
      });

      this.addFocusClass();
      this.keyUpObserve();
      this.clickLink();
  }

  ingresar() {
      const usuario = this.form.value.usuario;
      const contrasenia = this.form.value.contrasenia;

      if (this.verificarCredenciales(usuario, contrasenia)) {
          this.router.navigate(['/home']);
      } else {
          console.log('Credenciales incorrectas');
      }
  }

  verificarCredenciales(usuario: string, contrasenia: string): boolean {
      return usuario === 'usuario' && contrasenia === 'contraseña';
  }

  addFocusClass(): void {
      $(".form-control").on("focus", function () {
          $(this).prev().addClass("on-focus");
      }).on("focusout", function () {
          $(".form-label").removeClass("on-focus");
      });
  }

  keyUpObserve(): void {
      $(".form-control").on("keyup", function () {
          // Convertimos el valor a string antes de verificar su longitud
          if (String($(this).val()).length > 0) {
              $(this).prev().addClass("filled");
          } else {
              $(this).prev().removeClass("filled");
          }
      });
  }

  clickLink(): void {
      $(".link").on("click", function () {
          var open = $(this).data("open");
          var close = $(this).data("close");

          $("#" + close).animate({
              'opacity': 0,
              'top': +100
          }, 500 , function () {
              $(this).removeClass("open").addClass("close").removeAttr("style");
              $("#" + open).removeClass("close").addClass("open");
          });
      });
  }

  fakeloading() {
    this.loading = true;
    setTimeout(() => {
        this._snackBar?.open('Usuario y/o contraseña incorrecta', '',{
            duration:5000,
            horizontalPosition:'center',
            verticalPosition:'bottom'
        })
    }, 1500);
}  
}

