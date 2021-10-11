program e_Bay_commerce;

uses
  Forms,
  paswd in 'paswd.pas' {Form4},
  Bs in 'Bs.pas' {Form1},
  delzap in 'delzap.pas' {Form2},
  saveas in 'saveas.pas' {Form3},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, StdCtrls, ComCtrls;

{$R *.res}

var
 Sgl: TStringList;
begin
  Application.Initialize;
  Sgl:=TStringList.Create;
  Sgl.LoadFromFile(ExtractFileDir(Application.ExeName)+'\data\'+'conf.eby');
  if Sgl.Strings[1]='LhOL7aSicLbcnjNJZVnnviK11P9JzbynHkFJ5DPNIPlFAkvi1R1fNqsMgoJrsMy7Ua9kpZrTal6fp2wQIaiOTyf3hUz5SEvNadwNrjwCapgTieSwmFULvzwlRZkycnhLFeUjYtaEhvxZ5GfqwCtgIuiio3VqWINnEqY26NJotJx5XA1bMYRGcscdMrj9fdEXNmqLVgOf'
  then
   begin
    Application.CreateForm(TForm4, Form4);
    Application.CreateForm(TForm1, Form1);
    Application.CreateForm(TForm2, Form2);
    Application.CreateForm(TForm3, Form3);
    Application.Run;
   end;
  if Sgl.Strings[1]='LhOL7aSicLbcnjNJZVnnviK11P9JzbynHkFJ5DPNIPlFAkvi1R1fNqsMgoJrsMy7Ua9kpZrTal5fp2wQIaiOTyf3hUz6SEvNadwNrjwCapgTieSwmFULvzwlRZkycnhLFeUjYtaEhvxZ5GfqwCtgIuiio3VqWINnEqY26NJotJx5XA1bMYRGcscdMrj9fdEXNmqLVgOf'
  then
   begin
    Application.CreateForm(TForm4, Form4);
    Application.CreateForm(TForm1, Form1);
    Application.CreateForm(TForm2, Form2);
    Application.CreateForm(TForm3, Form3);
    Form4.Hide;
    Form1.ShowModal;
    Application.Run;
   end;
  Sgl.Free;
end.
