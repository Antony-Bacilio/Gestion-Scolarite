program tp_projet;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, datetimectrls, zcomponent, u_gabarit, u_feuille_style,
  u_select_etudiant, u_list_etudiant, u_detail_etudiant, u_modele,
  u_etudiant_ajout, u_releve, u_bienvenue
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(Tf_gabarit, f_gabarit);
  Application.CreateForm(Tf_select_etudiant, f_select_etudiant);
  Application.CreateForm(Tf_list_etudiant, f_list_etudiant);
  Application.CreateForm(Tf_detail_etudiant, f_detail_etudiant);
  Application.CreateForm(Tf_etudiant_ajout, f_etudiant_ajout);
  Application.CreateForm(Tf_releve, f_releve);
  Application.CreateForm(Tf_bienvenue, f_bienvenue);
 // Application.CreateForm(Tf_releve_list, f_releve_list);
  Application.Run;
end.

