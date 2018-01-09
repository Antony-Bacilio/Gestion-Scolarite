unit u_select_etudiant;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls;

type

  { Tf_select_etudiant }

  Tf_select_etudiant = class(TForm)
    btn_rechercher: TButton;
    edt_codefil: TEdit;
    edt_libfil: TEdit;
    edt_numetud: TEdit;
    edt_nometud: TEdit;
    lbl_codefil: TLabel;
    lbl_libfil: TLabel;
    lbl_numetud: TLabel;
    lbl_nometud: TLabel;
    pnl_fil_edit: TPanel;
    pnl_fil_btn: TPanel;
    pnl_etud_edit: TPanel;
    pnl_etud_btn: TPanel;
    pnl_tous_edit: TPanel;
    pnl_tous_btn: TPanel;
    pnl_rechercher: TPanel;
    pnl_fil: TPanel;
    pnl_etud: TPanel;
    pnl_tous: TPanel;
    pnl_choix: TPanel;
    pnl_titre: TPanel;

    procedure btn_rechercherClick(Sender: TObject);
    procedure edt_numetudChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Init;
    procedure lbl_nometudClick(Sender: TObject);
    procedure NonSelectionPanel (pnl:TPanel);
    procedure AucuneSelection;
    procedure pnl_choixClick(Sender: TObject);
    procedure pnl_choix_btnClick (Sender:TObject);
    procedure pnl_filClick(Sender: TObject);
    procedure pnl_fil_editClick(Sender: TObject);
    procedure pnl_etudClick(Sender: TObject);
    procedure pnl_etud_editClick(Sender: TObject);
    procedure pnl_numClick(Sender: TObject);
    procedure pnl_num_btnClick(Sender: TObject);
    procedure pnl_num_editClick(Sender: TObject);
    procedure pnl_titreClick(Sender: TObject);
    procedure pnl_tous_editClick(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_select_etudiant: Tf_select_etudiant;

implementation

{$R *.lfm}

  uses u_feuille_style, u_list_etudiant, u_modele;

  var
    pnl_actif : TPanel;

  { Tf_select_etudiant }

  procedure Tf_select_etudiant.Init;
  begin
      style.panel_defaut (pnl_choix);
      style.panel_selection (pnl_titre);
      style.panel_defaut(pnl_rechercher);
      pnl_choix_btnClick (pnl_tous_btn);
  end;

procedure Tf_select_etudiant.lbl_nometudClick(Sender: TObject);
begin

end;

procedure Tf_select_etudiant.btn_rechercherClick(Sender: TObject);
begin
  btn_rechercher.visible := false;
  pnl_actif.enabled := false;
  if  pnl_tous_edit.Visible  then
    f_list_etudiant.affi_data(modele.etudiant_liste_tous)
else if  pnl_etud_edit.visible  then
     f_list_etudiant.affi_data(modele.etudiant_liste_etud(edt_numetud.text,edt_nometud.text))
else if pnl_fil_edit.visible  then
     f_list_etudiant.affi_data(modele.etudiant_liste_fil(edt_codefil.text,edt_libfil.text));
end;

procedure Tf_select_etudiant.edt_numetudChange(Sender: TObject);
begin
end;

procedure Tf_select_etudiant.FormCreate(Sender: TObject);
begin
end;

procedure   Tf_select_etudiant.AucuneSelection;
begin
    	NonSelectionPanel (pnl_tous);
  	NonSelectionPanel (pnl_etud);
  	NonSelectionPanel (pnl_fil);
end;

procedure Tf_select_etudiant.pnl_choixClick(Sender: TObject);
begin

end;
procedure   Tf_select_etudiant.pnl_choix_btnClick (Sender : TObject);
var
   pnl :TPanel;
begin
	AucuneSelection;
    pnl := TPanel(Sender);
	style.panel_selection (pnl);
	pnl	:= TPanel(pnl.Parent);	style.panel_selection (pnl);
	Pnl	:= TPanel(f_select_etudiant.FindComponent(pnl.name +'_edit'));
	style.panel_selection (pnl);
	pnl.show;
        pnl_actif := pnl;     pnl_actif.enabled := true;
	btn_rechercher.visible := true;
end;

procedure Tf_select_etudiant.pnl_filClick(Sender: TObject);
begin

end;

procedure Tf_select_etudiant.pnl_fil_editClick(Sender: TObject);
begin

end;

procedure Tf_select_etudiant.pnl_etudClick(Sender: TObject);
begin

end;

procedure Tf_select_etudiant.pnl_etud_editClick(Sender: TObject);
begin

end;

procedure Tf_select_etudiant.pnl_numClick(Sender: TObject);
begin

end;


procedure Tf_select_etudiant.pnl_num_btnClick(Sender: TObject);
begin

end;

procedure Tf_select_etudiant.pnl_num_editClick(Sender: TObject);
begin

end;

procedure Tf_select_etudiant.pnl_titreClick(Sender: TObject);
begin

end;

procedure Tf_select_etudiant.pnl_tous_editClick(Sender: TObject);
begin

end;

procedure  Tf_select_etudiant.NonSelectionPanel (pnl : TPanel);
var
	pnl_enfant : TPanel;
begin
	style.panel_defaut(pnl);
	pnl_enfant	:= TPanel(f_select_etudiant.FindComponent(pnl.name +'_btn'));
	style.panel_bouton(pnl_enfant);
	pnl_enfant	:= TPanel(f_select_etudiant.FindComponent(pnl.name +'_edit'));
	pnl_enfant.Hide;
end;

end.

