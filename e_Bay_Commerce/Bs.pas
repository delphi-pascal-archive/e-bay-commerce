unit Bs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ExtCtrls, Word2000, OleServer, DB, DBTables,
  Mask, ComCtrls, Gauges, ActnMan, ActnColorMaps, WordXP, ShellApi, BDE32;

type
  TForm1 = class(TForm)
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Memo1: TMemo;
    Label7: TLabel;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    Edit6: TEdit;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    DataSource1: TDataSource;
    Table1: TTable;
    SaveDialog1: TSaveDialog;
    WordApplication1: TWordApplication;
    WordDocument1: TWordDocument;
    Label11: TLabel;
    Edit7: TEdit;
    N8: TMenuItem;
    Label19: TLabel;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Label10: TLabel;
    Label20: TLabel;
    Edit15: TEdit;
    Edit16: TEdit;
    Button2: TButton;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    Button3: TButton;
    Alphabet: TEdit;
    Timer1: TTimer;
    Label21: TLabel;
    Bevel1: TBevel;
    Edit20: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    Memo2: TMemo;
    N9: TMenuItem;
    MicrosoftWord1: TMenuItem;
    Label28: TLabel;
    Edit21: TEdit;
    BDE321: TBDE32;
    N3: TMenuItem;
    N6: TMenuItem;
    Edit13: TEdit;
    Memo3: TMemo;
    N10: TMenuItem;
    N11: TMenuItem;
    PopupMenu1: TPopupMenu;
    ljkj1: TMenuItem;
    UpDown1: TUpDown;
    N12: TMenuItem;
    procedure N7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Select(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Label23Click(Sender: TObject);
    procedure GroupBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label10MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label10Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure N8Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure N6Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure ljkj1Click(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);

    procedure MyProc(var AMsg: TWMSysCommand); message WM_SYSCommand;
    procedure Memo1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Memo2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure N12Click(Sender: TObject);
    procedure MicrosoftWord1Click(Sender: TObject);

  private
    { Private declarations }
  public
    procedure ClearAllFields(Sender: TObject);
    procedure LoadDocument(const Name: string);
    procedure SaveDocumentAs(Name: string);
    procedure SaveDocument;
    procedure LoadNames(Sender: TObject);
    { Public declarations }
  end;

var
  Form1: TForm1;
  DocName: string;
  SaveTo: string;

implementation

uses delzap, saveas;

{$R *.dfm}

function GetProgramPath : String;
begin
 GetProgramPath:=ExtractFilePath(ParamStr(0));
end;

function GetPath:String;
begin
 GetPath:=GetProgramPath+'shablon.doc';
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 ClearAllFields(Sender); // очистка всех полей ввода
end;

procedure TForm1.MyProc(var AMsg: TWMSysCommand);
begin
 if AMsg.CmdType=SC_MINIMIZE
 then Application.Minimize
 else inherited;
end;

procedure TForm1.ClearAllFields(Sender: TObject);
begin
 // Очистка компонентов
 Memo1.Lines.Clear;
 ComboBox1.Items.Insert(0,'');
 ComboBox1.Text:='';
 Edit2.Text:='';
 Edit3.Text:='';
 Edit4.Text:='';
 Edit6.Text:='';
 Edit7.Text:='';
 Edit15.Text:='';
 Edit16.Text:='';
 Edit20.Text:='';
 Edit21.Text:='';
 SaveTo:='';
 if Trim(ComboBox1.Text)='' then Exit;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
 AppDir: string;
 Sgl: TStringList;
begin
{
BDE32 Demo - this exe requires demo.db in the same directory and
a subdir called BDE containing the following files:
idapi32.cfg, idapi32.dll, bantam.dll, idr20009.dll and idpdx32.dll

NB These files are for a paradox installation, diferent
table types require different DLLs, trial and error will reveal
which ones!
}
 // AppDir:=ExtractFilePath(GetProgramPath+'data');
 // Table1.DatabaseName:=AppDir;
 // Table1.Open;
 // DO NOT HAVE ANY TABLES OPEN AT DESIGN TIME,
 // THEY WILL TRY TO BE OPENED BEFORE BDE32 IS CREATED
 Application.Title:='e-Bay Commerce';
 //
 Label1.PopupMenu:=PopupMenu1;
 //
 Edit13.Text:='1234567890АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюяABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~ .,:;"-=+\/|!?@#$%^&*_№<>()[]{}`';
 Sgl:=TStringList.Create;
 Sgl.LoadFromFile(ExtractFileDir(Application.ExeName)+'\data\'+'conf.eby');
 if Sgl.Strings[1]='LhOL7aSicLbcnjNJZVnnviK11P9JzbynHkFJ5DPNIPlFAkvi1R1fNqsMgoJrsMy7Ua9kpZrTal6fp2wQIaiOTyf3hUz5SEvNadwNrjwCapgTieSwmFULvzwlRZkycnhLFeUjYtaEhvxZ5GfqwCtgIuiio3VqWINnEqY26NJotJx5XA1bMYRGcscdMrj9fdEXNmqLVgOf'
 then
  begin
   N10.Enabled:=false;
   N11.Enabled:=true;
  end
 else
  begin
   N10.Enabled:=true;
   N11.Enabled:=false;
  end;
 Sgl.Free;
 //
 if not (DirectoryExists(GetProgramPath+'data')) then
  begin                      // если директория не существует, то
   ForceDirectories(GetProgramPath+'\data'); // создать директорию
  end;
 //
 Alphabet.Text:='1234567890АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюяABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~ .,:;"-=+\/|!?@#$%^&*_№<>()[]{}`';
 Button2.Click;
 // загрузка списка записей в ComboBox1
 DocName:='';
 Table1.Active:=False;
 Table1.TableName:=GetProgramPath+'data\'+'AllReq.db';
 Table1.Open;
 if Table1.Exists then
  begin
   ComboBox1.Items.Clear;
   ComboBox1.Items.BeginUpdate;
   Table1.First;
   while not(Table1.Eof) do
    begin
     ComboBox1.Items.Add(Table1.Fields[0].AsString);
     Table1.Next;
    end;
   ComboBox1.Items.EndUpdate;
  end;
 Table1.Close;
 try
  LoadDocument(ComboBox1.Items[0]);
  Form1.Caption:='e-Bay Commerce - '+ComboBox1.Items[0];
  UpDown1.Hint:=IntToStr(UpDown1.Position+1)+' запись из '+IntToStr(ComboBox1.Items.Count);
 except

 end; 
end;

procedure TForm1.ComboBox1Select(Sender: TObject);
begin
 // Очистка компонентов
 Memo1.Lines.Clear;
 Edit2.Text:='';
 Edit3.Text:='';
 Edit4.Text:='';
 Edit6.Text:='';
 Edit7.Text:='';
 Edit15.Text:='';
 Edit16.Text:='';
 Edit20.Text:='';
 Edit21.Text:='';
 SaveTo:='';
 //
 try
  LoadDocument(ComboBox1.Items[ComboBox1.ItemIndex]);
  Form1.Caption:='e-Bay Commerce - '+ComboBox1.Items[ComboBox1.ItemIndex];
 except

 end;
 ComboBox1.Text:='ooooooooooooooooooo';
end;

procedure TForm1.N4Click(Sender: TObject);
begin
 if DocName=''
 then DocName:='Новая запись';
 if DocName='Новая запись'
 then DocName:='';
 Form3.ShowModal;
 //
 if DocName=''
 then DocName:='Новая запись';
 if DocName='Новая запись'
 then DocName:='';
 // Обновление списка записей
 Table1.Close;
 Table1.Open;
 if Table1.Exists then
  begin
   ComboBox1.Items.Clear;
   ComboBox1.Items.BeginUpdate;
   Table1.First;
   while not(Table1.Eof) do
    begin
     ComboBox1.Items.Add(Table1.Fields[0].AsString);
     Table1.Next;
    end;
   ComboBox1.Items.EndUpdate;
  end;
 Table1.Close;
end;

procedure TForm1.SaveDocumentAs(Name: string);
 function FieldExists(name: string):Boolean;
 var
  i: integer;
 begin
  FieldExists:=false;
  for i:=0 to ComboBox1.Items.Count-1 do
   begin
    if Name=UpperCase(ComboBox1.Items[i]) then
     begin
      FieldExists:=true;
      Exit;
     end;
   end;
 end;
//
var
 st: string;
begin
 Table1.Active:=false;
 Table1.TableName:=GetProgramPath+'data\'+'AllReq.db';
 if not (FileExists(GetProgramPath+'data\'+'AllReq.db'))
 then
 begin // создание новой базы
  Table1.Active:=false;
  Table1.TableName:=GetProgramPath+'data\'+'AllReq.db';
  if not Table1.Exists then
   begin
    with Table1.FieldDefs do
     begin
      Clear;
      with AddFieldDef do
       begin
        Name:='DocName';
        DataType:=ftString;
        Size:=240;
       end;
      //
      with AddFieldDef do
       begin
        Name:='Edit1';
        DataType:=ftString;
        Size:=200;
        end;
      with AddFieldDef do
       begin
        Name:='Edit2';
        DataType:=ftString;
        Size:=200;
        end;
      with AddFieldDef do
       begin
        Name:='Edit3';
        DataType:=ftString;
        Size:=200;
        end;
      with AddFieldDef do
       begin
        Name:='Edit4';
        DataType:=ftString;
        Size:=200;
        end;
      with AddFieldDef do
       begin
        Name:='Edit5';
        DataType:=ftString;
        Size:=200;
        end;
      with AddFieldDef do
       begin
        Name:='Edit6';
        DataType:=ftString;
        Size:=200;
        end;
      with AddFieldDef do
       begin
        Name:='Edit7';
        DataType:=ftString;
        Size:=200;
        end;
      with AddFieldDef do
       begin
        Name:='Edit15';
        DataType:=ftString;
        Size:=200;
        end;
      with AddFieldDef do
       begin
        Name:='Edit16';
        DataType:=ftString;
        Size:=200;
        end;
      with AddFieldDef do
       begin
        Name:='Edit20';
        DataType:=ftString;
        Size:=200;
        end;
      with AddFieldDef do
       begin
        Name:='Edit21';
        DataType:=ftString;
        Size:=200;
        end;
       //
       with AddFieldDef do
        begin
         Name:='Memo1';
         DataType:=ftMemo;
         Size:=240;
        end;
      //
      Table1.CreateTable;
     end;
    Table1.Open;
  end;
 end;
 //
 Table1.Active:=true;
 Table1.Open;
 Table1.First;
 ComboBox1.Items.BeginUpdate;
 ComboBox1.Items.Clear;
  while not (Table1.Eof) do
   begin
    ComboBox1.Items.Add(Table1.Fields[0].AsString);
    Table1.Next;
   end;
 ComboBox1.Items.EndUpdate;
 st:=Name;
 DocName:=Form3.Edit1.Text;
 SaveDocument;
end;

procedure TForm1.SaveDocument;
Label 2;
var
 NameExists: Boolean;
begin
 if DocName='' then
  begin
   ShowMessage('Ошибка при записи документа '+''''''+DocName+'''''');
   Exit;
  end;
 NameExists:=false;
 Table1.Open;
 Table1.First;
 while not(Table1.Eof) do
  begin
   if (UpperCase(DocName)=UpperCase(Table1.Fields[0].AsString)) then
    begin
     NameExists:=True;
     goto 2;
    end;
   Table1.Next;
  end;
 2:
  if NameExists then Table1.Edit else Table1.Append;
  Table1.FieldValues['DocName']:=DocName;
  //
  Table1.FieldValues['Naimenov']:=ComboBox1.Text;
  //
  Table1.FieldValues['MyMaxPrice']:=    Edit2.Text;
  Table1.FieldValues['Datetime']:=   Edit3.Text;
  Table1.FieldValues['EndPrice']:=     Edit4.Text;
  Table1.FieldValues['LinkToCustomer']:=Edit20.Text;
  Table1.FieldValues['LinkToLot']:=      Edit21.Text;
  //
  Table1.FieldValues['PriceOurMagaz']:= Edit6.Text;
  Table1.FieldValues['DateMakeLot']:=   Edit7.Text;
  Table1.FieldValues['IDCustomer']:=    Edit15.Text;
  Table1.FieldValues['EmailCustomer']:= Edit16.Text;
  //
  Table1.FieldValues['Primechania']:=Memo1.Text;
  //
 Table1.Post;
 ShowMessage('Запись успешно сохранена!');
 // + 3 поля свободны (OurPrice, SWIFTCustomer, Price Dostav)
end;

procedure TForm1.LoadNames(Sender: TObject);
begin
 Table1.Active:=False;
 Table1.TableName:=GetProgramPath+'data\'+'AllReq.db';
 Table1.Open;
 if Table1.Exists then
  begin
   ComboBox1.Items.Clear;
   ComboBox1.Items.BeginUpdate;
   Table1.First;
   while not(Table1.Eof) do
    begin
     ComboBox1.Items.Add(Table1.Fields[0].AsString);
     Table1.Next;
    end;
   ComboBox1.Items.EndUpdate;
  end;
 Table1.Close;
end;

procedure TForm1.LoadDocument(const name: string);
begin
 Table1.Open;
 Table1.First;
 while not (Table1.Eof) do
  begin
   if UpperCase(name)=UpperCase(Table1.Fields[0].AsString) then
    begin
     ComboBox1.Text:=Table1.Fieldbyname('Naimenov').AsString;
     //
     Edit2.Text:=Table1.Fieldbyname('MyMaxPrice').AsString; // дата получения товара на руки
     Edit3.Text:=Table1.Fieldbyname('Datetime').AsString; // дата окончания действия лота
     Edit4.Text:=Table1.Fieldbyname('EndPrice').AsString; // цена доставки
     Edit20.Text:=Table1.Fieldbyname('LinkToCustomer').AsString; // цена в наших магазинах
     Edit21.Text:=Table1.Fieldbyname('LinkToLot').AsString; // моя цена
     //
     Edit6.Text:=Table1.Fieldbyname('PriceOurMagaz').AsString; // ID продавца
     Edit7.Text:=Table1.Fieldbyname('DateMakeLot').AsString; // e-mail продавца
     Edit15.Text:=Table1.Fieldbyname('IDCustomer').AsString; // ссылка на продавца
     Edit16.Text:=Table1.Fieldbyname('EmailCustomer').AsString; // ссылка на товар
     //
     Memo1.Text:=Table1.Fieldbyname('Primechania').AsString;
     DocName:=Name;
     Table1.Close;
     Exit;
    end;
   Table1.Next;
  end;
 ShowMessage('Неверное имя документа или база данных пуста!');
 if Table1.Active then Table1.Close;
 // + 3 поля свободны (OurPrice, SWIFTCustomer, Price Dostav) 
end;

procedure TForm1.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in [#0..#31,'0'..'9']) then Key:=#0;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Button3.Click;
 Application.Terminate;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
 Close;
end;

procedure TForm1.Button2Click(Sender: TObject);
Label M;
Label M1;
var
 i,j,j1,x,n,z,s,s1,tt,c,f,re2: integer;
 st,a:string;
begin
 RichEdit1.Lines.LoadFromFile(GetProgramPath+'data\'+'card.eby');
 //
 f:=0;
 c:=RichEdit1.Lines.Count;
 j:=6789;
 RichEdit1.Update;
 RichEdit1.Enabled:=false;
 RichEdit1.Lines.BeginUpdate;
 RichEdit2.Lines.BeginUpdate;
 j1:=j;
 RichEdit2.Lines.Assign(RichEdit1.Lines);
 RichEdit1.Lines.Clear;
 re2:=RichEdit2.Lines.Count-1;
 st:='1234567890АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюяABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~ .,:;"-=+\/|!?@#$%^&*_№<>()[]{}`';
 for z:=0 to re2 do
  begin
   a:=RichEdit2.Lines.Strings[z];
   x:=length(a);
   for i:=1 to x do
    begin
     if pos(a[i],Alphabet.Text)<>0 then
      begin
       Alphabet.SelStart:=pos(a[i],Alphabet.Text)-1;
       n:=Alphabet.SelStart;
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
  RichEdit1.Lines.Add(a);
  Application.ProcessMessages;
 end;
 RichEdit1.Enabled:=true;
 RichEdit1.Lines.EndUpdate;
 RichEdit2.Lines.EndUpdate;
 Edit8.Text:=RichEdit1.Lines.Strings[0];
 Edit9.Text:=RichEdit1.Lines.Strings[1];
 Edit10.Text:=RichEdit1.Lines.Strings[2];
 Label10.Hint:=RichEdit1.Lines.Strings[3];
 ///////////////////////////////////////////////////////////
 RichEdit1.Lines.LoadFromFile(GetProgramPath+'data\'+'primech.eby');
 //
 f:=0;
 c:=RichEdit1.Lines.Count;
 j:=6789;
 RichEdit1.Update;
 RichEdit1.Enabled:=false;
 RichEdit1.Lines.BeginUpdate;
 RichEdit2.Lines.BeginUpdate;
 j1:=j;
 RichEdit2.Lines.Assign(RichEdit1.Lines);
 RichEdit1.Lines.Clear;
 re2:=RichEdit2.Lines.Count-1;
 st:='1234567890АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюяABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~ .,:;"-=+\/|!?@#$%^&*_№<>()[]{}`';
 for z:=0 to re2 do
  begin
   a:=RichEdit2.Lines.Strings[z];
   x:=length(a);
   for i:=1 to x do
    begin
     if pos(a[i],Alphabet.Text)<>0 then
      begin
       Alphabet.SelStart:=pos(a[i],Alphabet.Text)-1;
       n:=Alphabet.SelStart;
       s1:=n+1;
       j:=j1;
       s:=s1-j;
       if ((s<=159) and (s>=0)) then
        begin
         s:=s1-j;
         a[i]:=st[s];
         goto M1;
        end;
       j:=j1-n-1;
       repeat
        tt:=j-159;
        s:=abs(tt);
        j:=s;
       until (s<=159);
       s:=159-s;
       a[i]:=st[s];
       M1:
      end
     else
    end;
  RichEdit1.Lines.Add(a);
  Application.ProcessMessages;
 end;
 RichEdit1.Enabled:=true;
 RichEdit1.Lines.EndUpdate;
 RichEdit2.Lines.EndUpdate;
 Memo2.Lines.Assign(RichEdit1.Lines);
end;

procedure TForm1.Button3Click(Sender: TObject);
Label M;
Label M1;
var
 i,z,x,j,j1,n,s,s1,tt,c,f,re2:integer;
 st,a:string;
begin
 RichEdit1.Lines.Clear;
 RichEdit1.Lines.Insert(0,Edit8.Text);
 RichEdit1.Lines.Insert(1,Edit9.Text);
 RichEdit1.Lines.Insert(2,Edit10.Text);
 RichEdit1.Lines.Insert(3,Label10.Hint);
 //
 f:=0;
 c:=RichEdit1.Lines.Count;
 j:=6789;
 RichEdit1.Update;
 RichEdit1.Enabled:=false;
 RichEdit1.Lines.BeginUpdate;
 RichEdit2.Lines.BeginUpdate;
 j1:=j;
 RichEdit2.Lines.Assign(RichEdit1.Lines);
 RichEdit1.Lines.Clear;
 re2:=RichEdit2.Lines.Count-1;
 st:='1234567890АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюяABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~ .,:;"-=+\/|!?@#$%^&*_№<>()[]{}`';
 for z:=0 to re2 do
  begin
   a:=RichEdit2.Lines.Strings[z];
   x:=length(a);
   for i:=1 to x do
    begin
     if pos(a[i],Alphabet.Text)<>0 then
      begin
       Alphabet.SelStart:=pos(a[i],Alphabet.Text)-1;
       n:=Alphabet.SelStart;
       s1:=n+1;
       j:=j1;
       s:=s1+j;
       if (s<=159) then
        begin
         s:=s1+j;
         a[i]:=st[s];
         goto M;
        end;
       s:=159-(n+1);
       j:=j1-s;
       repeat
        tt:=j-159;
        s:=abs(tt);
        j:=s;
       until (s<=159);
       a[i]:=st[s];
       M:
      end
     else
    end;
   RichEdit1.Lines.Add(a);
   Application.ProcessMessages;
  end;
 RichEdit1.Enabled:=true;
 RichEdit1.Lines.EndUpdate;
 RichEdit2.Lines.EndUpdate;
 //
 RichEdit1.Lines.SaveToFile(GetProgramPath+'data\'+'card.eby');
 //////////////////////////////////////////////////////////////
 RichEdit1.Lines.Clear;
 RichEdit1.Lines.Assign(Memo2.Lines);
 //
 f:=0;
 c:=RichEdit1.Lines.Count;
 j:=6789;
 RichEdit1.Update;
 RichEdit1.Enabled:=false;
 RichEdit1.Lines.BeginUpdate;
 RichEdit2.Lines.BeginUpdate;
 j1:=j;
 RichEdit2.Lines.Assign(RichEdit1.Lines);
 RichEdit1.Lines.Clear;
 re2:=RichEdit2.Lines.Count-1;
 st:='1234567890АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюяABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~ .,:;"-=+\/|!?@#$%^&*_№<>()[]{}`';
 for z:=0 to re2 do
  begin
   a:=RichEdit2.Lines.Strings[z];
   x:=length(a);
   for i:=1 to x do
    begin
     if pos(a[i],Alphabet.Text)<>0 then
      begin
       Alphabet.SelStart:=pos(a[i],Alphabet.Text)-1;
       n:=Alphabet.SelStart;
       s1:=n+1;
       j:=j1;
       s:=s1+j;
       if (s<=159) then
        begin
         s:=s1+j;
         a[i]:=st[s];
         goto M1;
        end;
       s:=159-(n+1);
       j:=j1-s;
       repeat
        tt:=j-159;
        s:=abs(tt);
        j:=s;
       until (s<=159);
       a[i]:=st[s];
       M1:
      end
     else
    end;
   RichEdit1.Lines.Add(a);
   Application.ProcessMessages;
  end;
 RichEdit1.Enabled:=true;
 RichEdit1.Lines.EndUpdate;
 RichEdit2.Lines.EndUpdate;
 //
 RichEdit1.Lines.SaveToFile(GetProgramPath+'data\'+'primech.eby');
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
 Label21.Caption:=DateToStr(Date)+' - '+TimeToStr(Time);
end;

procedure TForm1.Label23Click(Sender: TObject);
begin
 ShellExecute(0,'open','http://www.pregrad.net','','',SW_SHOW);
end;

procedure TForm1.GroupBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Label10.Font.Color:=clBlack;
end;

procedure TForm1.Label10MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Label10.Font.Color:=clRed;
end;

procedure TForm1.Label10Click(Sender: TObject);
begin
 ShellExecute(0,'open',PChar(Label10.Hint),'','',SW_SHOW);
end;

procedure TForm1.Label7Click(Sender: TObject);
begin
 ShellExecute(0,'open',PChar(Edit16.Text),'','',SW_SHOW);
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Label6.Font.Color:=clBlack;
 Label6.Font.Style:=[];
 Label7.Font.Color:=clBlack;
 Label7.Font.Style:=[];
 //
 Memo1.Height:=60;
end;

procedure TForm1.Label7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Label7.Font.Color:=clYellow;
 Label7.Hint:=Edit16.Text;
 Label7.Font.Style:=[fsBold];
end;

procedure TForm1.N8Click(Sender: TObject);
begin
 Form2.ShowModal;
end;

procedure TForm1.Label6Click(Sender: TObject);
begin
 ShellExecute(0,'open',PChar(Edit15.Text),'','',SW_SHOW);
end;

procedure TForm1.Label6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Label6.Font.Color:=clYellow;
 Label6.Hint:=Edit15.Text;
 Label6.Font.Style:=[fsBold];
end;

procedure TForm1.N6Click(Sender: TObject);
Label M;
var
 newp,st,a: string;
 i,x,j,j1,n,s,s1,tt: integer;
begin
 // смещение 78575
 newp:=InputBox('Введите новый пароль','Новый пароль:','');
 if newp='' then
  begin
   MessageDlg('Пароль на вход в программу не изменен!',mtError,[mbOK],0);
   Exit;
  end;
 ///////////////////////////////////////////////////
 j:=78575;
 j1:=j;
 st:='1234567890АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюяABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~ .,:;"-=+\/|!?@#$%^&*_№<>()[]{}`';
 a:=newp;
 x:=length(a);
 try
  for i:=1 to x do
   begin
    if pos(a[i],Edit13.Text)<>0 then
     begin
      Edit13.SelStart:=pos(a[i],Edit13.Text)-1;
      n:=Edit13.SelStart;
      s1:=n+1;
      j:=j1;
      s:=s1+j;
      if (s<=159) then
       begin
        s:=s1+j;
        a[i]:=st[s];
        goto M;
       end;
      s:=159-(n+1);
      j:=j1-s;
      repeat
       tt:=j-159;
       s:=abs(tt);
       j:=s;
      until (s<=159);
      a[i]:=st[s];
      M:
     end
    else
   end;
  Memo3.Lines.LoadFromFile(ExtractFileDir(Application.ExeName)+'\data\'+'conf.eby');
  Memo3.Lines.Strings[0]:=a;
  Memo3.Lines.SaveToFile(ExtractFileDir(Application.ExeName)+'\data\'+'conf.eby');
  MessageDlg('Пароль на вход в программу успешно изменен!',mtInformation,[mbOK],0);
 except
  MessageDlg('Ошибка сохранения пароля!'+#10#13+'Пароль не изменен',mtError,[mbOK],0);
 end;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
 Memo3.Lines.LoadFromFile(ExtractFileDir(Application.ExeName)+'\data\'+'conf.eby');
 if N10.Enabled=true
 then
  begin
   Memo3.Lines.Strings[1]:='LhOL7aSicLbcnjNJZVnnviK11P9JzbynHkFJ5DPNIPlFAkvi1R1fNqsMgoJrsMy7Ua9kpZrTal6fp2wQIaiOTyf3hUz5SEvNadwNrjwCapgTieSwmFULvzwlRZkycnhLFeUjYtaEhvxZ5GfqwCtgIuiio3VqWINnEqY26NJotJx5XA1bMYRGcscdMrj9fdEXNmqLVgOf';
   Memo3.Lines.SaveToFile(ExtractFileDir(Application.ExeName)+'\data\'+'conf.eby');
   N10.Enabled:=false;
   N11.Enabled:=true;
  end
 else
  begin
   Memo3.Lines.Strings[1]:='LhOL7aSicLbcnjNJZVnnviK11P9JzbynHkFJ5DPNIPlFAkvi1R1fNqsMgoJrsMy7Ua9kpZrTal5fp2wQIaiOTyf3hUz6SEvNadwNrjwCapgTieSwmFULvzwlRZkycnhLFeUjYtaEhvxZ5GfqwCtgIuiio3VqWINnEqY26NJotJx5XA1bMYRGcscdMrj9fdEXNmqLVgOf';
   Memo3.Lines.SaveToFile(ExtractFileDir(Application.ExeName)+'\data\'+'conf.eby');
   N10.Enabled:=true;
   N11.Enabled:=false;
  end;
end;

procedure TForm1.N11Click(Sender: TObject);
begin
 Memo3.Lines.LoadFromFile(ExtractFileDir(Application.ExeName)+'\data\'+'conf.eby');
 if N11.Enabled=false
 then
  begin
   Memo3.Lines.Strings[1]:='LhOL7aSicLbcnjNJZVnnviK11P9JzbynHkFJ5DPNIPlFAkvi1R1fNqsMgoJrsMy7Ua9kpZrTal6fp2wQIaiOTyf3hUz5SEvNadwNrjwCapgTieSwmFULvzwlRZkycnhLFeUjYtaEhvxZ5GfqwCtgIuiio3VqWINnEqY26NJotJx5XA1bMYRGcscdMrj9fdEXNmqLVgOf';
   Memo3.Lines.SaveToFile(ExtractFileDir(Application.ExeName)+'\data\'+'conf.eby');
   N10.Enabled:=false;
   N11.Enabled:=true;
  end
 else
  begin
   Memo3.Lines.Strings[1]:='LhOL7aSicLbcnjNJZVnnviK11P9JzbynHkFJ5DPNIPlFAkvi1R1fNqsMgoJrsMy7Ua9kpZrTal5fp2wQIaiOTyf3hUz6SEvNadwNrjwCapgTieSwmFULvzwlRZkycnhLFeUjYtaEhvxZ5GfqwCtgIuiio3VqWINnEqY26NJotJx5XA1bMYRGcscdMrj9fdEXNmqLVgOf';
   Memo3.Lines.SaveToFile(ExtractFileDir(Application.ExeName)+'\data\'+'conf.eby');
   N10.Enabled:=true;
   N11.Enabled:=false;
  end;
end;

procedure TForm1.ljkj1Click(Sender: TObject);
var
 s: string;
begin
 s:=InputBox('Моя новая страница','Введите ссылку:','');
 if s<>''
 then
  begin
   RichEdit1.Lines.Strings[3]:=s;
   Label10.Hint:=s;
  end;
end;

procedure TForm1.UpDown1Click(Sender: TObject; Button: TUDBtnType);
var
 i: integer;
begin
 i:=ComboBox1.Items.Count-1;
 if UpDown1.Position<=i
 then
  begin
   LoadDocument(ComboBox1.Items[UpDown1.Position]);
   Form1.Caption:='e-Bay Commerce - '+ComboBox1.Items[UpDown1.Position];
  end
 else
  begin
   UpDown1.Position:=0;
   LoadDocument(ComboBox1.Items[UpDown1.Position]);
   Form1.Caption:='e-Bay Commerce - '+ComboBox1.Items[UpDown1.Position];
  end;
 UpDown1.Hint:=IntToStr(UpDown1.Position+1)+' запись из '+IntToStr(ComboBox1.Items.Count);
end;


procedure TForm1.Memo1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Memo1.Height:=330;
end;

procedure TForm1.Memo2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Memo1.Height:=60;
end;

procedure TForm1.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
var
 s: string;
begin
 s:=Form1.Caption;
 Delete(s,1,17);
 Table1.Open;
 Table1.First;
 while not (Table1.Eof) do
  begin
   if UpperCase(s)=UpperCase(Table1.Fields[0].AsString) then
    begin
     ComboBox1.Text:=Table1.Fieldbyname('Naimenov').AsString;
     //
     Edit2.Text:=Table1.Fieldbyname('MyMaxPrice').AsString; // дата получения товара на руки
     Edit3.Text:=Table1.Fieldbyname('Datetime').AsString; // дата окончания действия лота
     Edit4.Text:=Table1.Fieldbyname('EndPrice').AsString; // цена доставки
     Edit20.Text:=Table1.Fieldbyname('LinkToCustomer').AsString; // цена в наших магазинах
     Edit21.Text:=Table1.Fieldbyname('LinkToLot').AsString; // моя цена
     //
     Edit6.Text:=Table1.Fieldbyname('PriceOurMagaz').AsString; // ID продавца
     Edit7.Text:=Table1.Fieldbyname('DateMakeLot').AsString; // e-mail продавца
     Edit15.Text:=Table1.Fieldbyname('IDCustomer').AsString; // ссылка на продавца
     Edit16.Text:=Table1.Fieldbyname('EmailCustomer').AsString; // ссылка на товар
     //
     Memo1.Text:=Table1.Fieldbyname('Primechania').AsString;
     //
 if AnsiCompareText(ParName,'NameRecd')=0
     then ParValue:=s;
     //
     if AnsiCompareText(ParName,'Cell1')=0
     then ParValue:=Table1.Fieldbyname('Naimenov').AsString
     else
      if AnsiCompareText(ParName,'Cell2')=0
      then ParValue:=Table1.Fieldbyname('MyMaxPrice').AsString
      else
       if AnsiCompareText(ParName,'Cell3')=0
       then ParValue:=Table1.Fieldbyname('Datetime').AsString
       else
        if AnsiCompareText(ParName,'Cell4')=0
        then ParValue:=Table1.Fieldbyname('EndPrice').AsString
       else
        if AnsiCompareText(ParName,'Cell5')=0
        then ParValue:=Table1.Fieldbyname('LinkToCustomer').AsString
       else
        if AnsiCompareText(ParName,'Cell6')=0
        then ParValue:=Table1.Fieldbyname('LinkToLot').AsString
       else
        if AnsiCompareText(ParName,'Cell7')=0
        then ParValue:=Table1.Fieldbyname('PriceOurMagaz').AsString
       else
        if AnsiCompareText(ParName,'Cell8')=0
        then ParValue:=Table1.Fieldbyname('DateMakeLot').AsString
       else
        if AnsiCompareText(ParName,'Cell9')=0
        then ParValue:=Table1.Fieldbyname('IDCustomer').AsString
       else
        if AnsiCompareText(ParName,'Cell10')=0
        then ParValue:=Table1.Fieldbyname('EmailCustomer').AsString
       else
        if AnsiCompareText(ParName,'Cell11')=0
        then ParValue:=Table1.Fieldbyname('Primechania').AsString;
     Table1.Close;
     Exit;
    end;
   Table1.Next;
  end;
 ShowMessage('Неверное имя документа или база данных пуста!');
 if Table1.Active then Table1.Close;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
 ShowMessage('-----------------------  e-Bay Commerce  ---------------------'+#10#13+
             'Программа предназначена для ведения статистики'+#10#13+
             'покупок товаров на известном Интернет-аукционе'+#10#13+
             'E-Bay (http://www.ebay.com).'+#10#13+
             '---------------------------------------------------------------------'+#10#13+
             'Вопросы, пожелания и замечания по работе'+#10#13+
             'программы присылайте на адрес:'+#10#13+
             'E-mail: admin_ds@delphisources.ru'+#10#13+
             'Web-site: www.delphisources.ru');
 ShellExecute(0,'open','http://www.delphisources.ru','','',SW_SHOW);
end;

procedure TForm1.MicrosoftWord1Click(Sender: TObject);
begin
 //
end;

end.
