unit u_gabarit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Menus, StdCtrls, u_bienvenue;

type

  { Tf_gabarit }

  Tf_gabarit = class(TForm)
    item_liste_ii: TMenuItem;
    item_archive: TMenuItem;
    item_archiven1: TMenuItem;
    item_archiven2: TMenuItem;
    Label1: TLabel;
    lbl_bienvenue2: TLabel;
    lbl_bienvenue: TLabel;
    item_statistiques: TMenuItem;
    mnu_main: TMainMenu;
    item_accueil: TMenuItem;
    item_inscrit: TMenuItem;
    item_filiere: TMenuItem;
    item_quitter: TMenuItem;
    item_liste_i: TMenuItem;
    pnl_ariane: TPanel;
    pnl_selection: TPanel;
    pnl_travail: TPanel;
    pnl_info: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure item_quitterClick(Sender: TObject);
    procedure mnu_item_Click(Sender:TObject);
    procedure choix_item_liste;
    procedure choix_item_accueil;
    procedure pnl_selectionClick(Sender: TObject);
    procedure pnl_travailClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_gabarit: Tf_gabarit;

implementation

{$R *.lfm}

{ Tf_gabarit }

uses u_feuille_style, u_list_etudiant, u_select_etudiant, u_detail_etudiant, u_modele;

procedure Tf_gabarit.FormCreate(Sender: TObject);
begin

end;

procedure Tf_gabarit.FormShow(Sender: TObject);
begin
     style.panel_selection (pnl_ariane);
     style.panel_defaut     (pnl_selection);
     style.panel_travail     (pnl_travail);
     style.panel_defaut     (pnl_info);
     f_gabarit.width := 1200;
     f_gabarit.height :=  800;
     modele.open;
end;

procedure Tf_gabarit.item_quitterClick(Sender: TObject);
begin
     modele.close;
   close;
end;

procedure Tf_gabarit.mnu_item_Click(Sender: TObject);
var
   item : TMenuItem;
begin
   pnl_selection.show;

   pnl_ariane.Caption := '';
   item := TmenuItem(Sender);
   repeat
         pnl_ariane.caption := ' >' + item.caption +pnl_ariane.Caption;
         item := item.parent;
   until item.parent = nil;
   item := TmenuItem(Sender);

   if item=item_accueil then choix_item_accueil
   else if item=item_accueil then ;

   if item=item_liste_i then choix_item_liste
   else if item=item_accueil then ;
end;
procedure Tf_gabarit.choix_item_liste;
begin
f_list_etudiant.borderstyle	:= bsNone;
f_list_etudiant.parent		:= pnl_travail;
f_list_etudiant.align		:= alClient;
f_list_etudiant.init;
f_list_etudiant.show ;

f_select_etudiant.borderstyle := bsNone;
f_select_etudiant.parent := pnl_selection;
f_select_etudiant.align := alClient;
f_select_etudiant.init;
f_select_etudiant.show;

f_detail_etudiant.borderstyle := bsNone;
f_detail_etudiant.parent := pnl_travail;
f_detail_etudiant.align := alClient;
end;

procedure Tf_gabarit.choix_item_accueil;
begin
 f_bienvenue.borderstyle	:= bsNone;
 f_bienvenue.parent		:= pnl_travail;
 f_bienvenue.align		:= alClient;
 f_bienvenue.show ;
 f_select_etudiant.Visible:=false;

end;

procedure Tf_gabarit.pnl_selectionClick(Sender: TObject);
begin

end;

procedure Tf_gabarit.pnl_travailClick(Sender: TObject);
begin

end;

end.

