unit u_etudiant_ajout;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { Tf_etudiant_ajout }

  Tf_etudiant_ajout = class(TForm)
    cbo_delit_num: TComboBox;
    cbo_delit_nature: TComboBox;
    lbl_delit_nature: TLabel;
    lbl_delit_num: TLabel;
    pnl_detail: TPanel;
    pnl_titre: TPanel;

    procedure cbo_delit_natureChange(Sender: TObject);
    procedure cbo_delit_natureCloseUp(Sender: TObject);
    procedure cbo_delit_numChange(Sender: TObject);
    procedure cbo_delit_numCloseUp(Sender: TObject);
    procedure Init;
    procedure add;
    procedure delete;
    procedure add_delit_to_amende (cle : string; cbo : TComboBox);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_etudiant_ajout: Tf_etudiant_ajout;

implementation

{$R *.lfm}

{ Tf_etudiant_ajout }

uses u_feuille_style, u_releve_list, u_modele, u_loaddataset;
var
  flux_delit:TLoadDataSet;
procedure Tf_etudiant_ajout.Init;
begin
style.panel_selection (pnl_titre);
style.panel_travail (pnl_detail);
style.combo (cbo_delit_num);
style.combo (cbo_delit_nature);
cbo_delit_num.Clear;
cbo_delit_nature.clear;
//flux_delit:=modele.infraction_delit_tous;
end;

procedure Tf_etudiant_ajout.cbo_delit_numCloseUp(Sender: TObject);
begin
  add_delit_to_amende ('num',cbo_delit_num);
end;

procedure Tf_etudiant_ajout.cbo_delit_natureCloseUp(Sender: TObject);
begin
  add_delit_to_amende ('nature',cbo_delit_nature);
end;
procedure Tf_etudiant_ajout.cbo_delit_natureChange(Sender: TObject);
begin

end;

procedure Tf_etudiant_ajout.cbo_delit_numChange(Sender: TObject);
begin

end;

procedure Tf_etudiant_ajout.delete;
begin
end;

procedure Tf_etudiant_ajout.add;
var
i : integer;
begin
end;
procedure Tf_etudiant_ajout.add_delit_to_amende (cle : string; cbo : TComboBox);
begin
end;
end.



end.

