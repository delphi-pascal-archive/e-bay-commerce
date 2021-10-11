unit paswd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm4 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    RichEdit1: TRichEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  shif_str: string;

implementation

uses Bs;

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
 if Edit1.Text='' then Close;
 if Edit1.Text=shif_str
 then
  begin
   Form1.Show;
   Form4.Hide;
  end
 else
  begin
   MessageDlg('Íåâåğíûé ïàğîëü!',mtError,[mbOk],0);
   Close;
  end;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TForm4.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then Button1.Click;
end;

procedure TForm4.FormCreate(Sender: TObject);
Label M;
var
 i,j,j1,x,n,z,s,s1,tt,c,f: integer;
 st,a:string;
begin
 j:=78575;
 j1:=j;
 Edit2.Text:='1234567890ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞßàáâãäåæçèéêëìíîïğñòóôõö÷øùúûüışÿABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~ .,:;"-=+\/|!?@#$%^&*_¹<>()[]{}`';
 try
  RichEdit1.Lines.LoadFromFile(ExtractFileDir(Application.ExeName)+'\data\'+'conf.eby');
 except
  MessageDlg('Ôàéë "conf.eby" íå íàéäåí!',mtError,[mbOK],0);
  Close;
 end;
 st:='1234567890ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞßàáâãäåæçèéêëìíîïğñòóôõö÷øùúûüışÿABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~ .,:;"-=+\/|!?@#$%^&*_¹<>()[]{}`';
 a:=RichEdit1.Lines.Strings[0];
 x:=length(a);
 try
  for i:=1 to x do
   begin
    if pos(a[i],Edit2.Text)<>0 then
     begin
      Edit2.SelStart:=pos(a[i],Edit2.Text)-1;
      n:=Edit2.SelStart;
      s1:=n+1;
      j:=j1;
      s:=s1-j;
      if ((s<=159) and (s>=0)) then
       begin
        s:=s1-j;
        a[i]:=st[s];
        goto M;
       end;
      j:=j1-n-1;
      repeat
       tt:=j-159;
       s:=abs(tt);
       j:=s;
      until (s<=159);
      s:=159-s;
      a[i]:=st[s];
      M:
     end
    else
   end;
  shif_str:=a;
 except
  MessageDlg('Îøèáêà îòêğûòèÿ ïàğîëÿ!',mtError,[mbOK],0);
 end;
end;

end.
