unit u_list_etudiant;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, Grids, Spin, u_liste;

type

  { Tf_list_etudiant }

  Tf_list_etudiant = class(TF_liste)
    spedt_nb_insc: TSpinEdit;
    procedure btn_line_addClick(Sender: TObject);
    procedure btn_line_deleteClick(Sender: TObject);
    procedure btn_line_detailClick(Sender: TObject);
    procedure btn_line_editClick(Sender: TObject);
    procedure Init;
    procedure pnl_titreClick(Sender: TObject);
    procedure spedt_nb_inscChange(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_list_etudiant: Tf_list_etudiant;

implementation

{$R *.lfm}

{ Tf_list_etudiant }

uses    u_feuille_style, u_detail_etudiant;

procedure Tf_list_etudiant.btn_line_addClick(Sender: TObject);
begin
  f_detail_etudiant.add;
end;

procedure Tf_list_etudiant.btn_line_deleteClick(Sender: TObject);
begin
  f_detail_etudiant.delete (sg_liste.cells[0,sg_liste.row]);
end;

procedure Tf_list_etudiant.btn_line_detailClick(Sender: TObject);
begin
  f_detail_etudiant.detail (sg_liste.cells[0,sg_liste.row]);
end;

procedure Tf_list_etudiant.btn_line_editClick(Sender: TObject);
begin
  f_detail_etudiant.edit (sg_liste.cells[0,sg_liste.row]);
end;

procedure Tf_list_etudiant.Init;
begin
      style.panel_travail(pnl_titre);
      style.panel_travail(pnl_btn);
      style.panel_travail(pnl_affi);
      style.grille (sg_liste);
end;

procedure Tf_list_etudiant.pnl_titreClick(Sender: TObject);
begin
end;

procedure Tf_list_etudiant.spedt_nb_inscChange(Sender: TObject);
begin

end;

end.

