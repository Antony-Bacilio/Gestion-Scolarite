unit u_modele;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_loaddataset;

type
Tmodele = class(TMySQL)
   private
   { private declarations }
   public
   { public declarations }
   procedure open;
   function  etudiant_liste_tous : TLoadDataSet;
   function  etudiant_liste_etud (num, nom: string) : TLoadDataSet;
   function  etudiant_liste_fil (code, libelle : string) : TLoadDataSet;
   function  etudiant_num (num: string):TLoadDataSet;
   function filiere_proprio (num: string) : string ;

   function moy_etud(num: string):string ;
   function moy_filiere(num: string):string ;
   function rechercher_filiere(code: string):string;

   function  etudiant_liste_notes (num: string) : TLoadDataSet;

   procedure etudiant_update(id,sexe,nom,prenom,adresse,code,ville,portable,telephone,mel,filiere: string);
   procedure etudiant_insert(id,sexe,nom,prenom,adresse,code,ville,portable,telephone,mel,filiere: string);

   procedure etudiant_delete(id_etud: string);
   procedure etudiant_notation_delete(id_etud: string);
   procedure close;
end;

var
     modele: Tmodele;
implementation

procedure Tmodele.open;
begin
      Bd_open ('infodb.iut.univ-metz.fr ', 3306, 'bacilios1u_bdscolarite', 'bacilios1u_appli','phpmyadmin', 'mysqld-5', 'libmysql64.dll');
              //infodb2.iut.univ-metz.fr
end;

procedure Tmodele.close;
begin
      Bd_close;
end;

// toutes les ETUDIANTS
function Tmodele.etudiant_liste_tous : TLoadDataSet;
begin
     result := load('sp_etudiant_liste_tous',[]);
end;

// recherche du num-nom etud
function Tmodele.etudiant_liste_etud (num,nom: string) : TLoadDataSet;
begin
     result := load('sp_etudiant_liste_etud',[num,nom]);
end;

// recherche par filiere
function Tmodele.etudiant_liste_fil (code, libelle : string) : TLoadDataSet;
begin
     result := load('sp_etudiant_liste_filiere',[code, libelle]);
end;
function Tmodele.filiere_proprio (num: String) : string;
begin
    load('sp_etudiant_filiere',[num],result);
end;
function Tmodele.moy_etud(num: String) : string;
begin
    load('sp_moy_inscrit',[num],result);
end;
function Tmodele.moy_filiere(num: String) : string;
begin
    load('sp_moy_filiere',[num],result);
end;
function Tmodele.rechercher_filiere(code: String) : string;
begin
    load('sp_rechercher_num_fil',[code],result);
end;
function Tmodele.etudiant_num (num: string):TLoadDataSet;
begin
    result :=  load('sp_etudiant_num',[num]);
end;
function Tmodele.etudiant_liste_notes (num: string) : TLoadDataSet;
begin
     result := load('sp_etudiant_liste_notes',[num]);
end;

procedure Tmodele.etudiant_delete (id_etud : string);
begin
     exec('sp_etudiant_delete',[id_etud]);
end;
procedure Tmodele.etudiant_notation_delete (id_etud : string);
begin
     exec('sp_etudiant_notation_delete',[id_etud]);
end;
procedure Tmodele.etudiant_update(id,sexe,nom,prenom,adresse,code,ville,portable,telephone,mel,filiere: string);
begin
     exec('sp_etudiant_update',[id],[sexe,nom,prenom,adresse,code,ville,portable,telephone,mel,filiere]);
end;
procedure Tmodele.etudiant_insert(id,sexe,nom,prenom,adresse,code,ville,portable,telephone,mel,filiere: string);
begin
     exec('sp_etudiant_insert',[id,sexe,nom,prenom,adresse,code,ville,portable,telephone,mel,filiere]);
end;
begin
     modele := TModele.Create;
end.
end.

