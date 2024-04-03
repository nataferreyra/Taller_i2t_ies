import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './components/login/login.component';
import { AltaCompetenciaComponent } from './components/alta-competencia/alta-competencia.component';

const routes: Routes = [
  {path:'login', component: LoginComponent},
  {path:'', redirectTo:'login', pathMatch:'full'},
  {path:'**', redirectTo:'login', pathMatch:'full'},
  {path:'alta-competencia', component: AltaCompetenciaComponent}

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
