unit saveas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm3 = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Bs;

{$R *.dfm}

function GetProgramPath : String;
begin
 GetProgramPath:=ExtractFilePath(ParamStr(0));
end;

procedure TForm3.FormShow(Sender: TObject);
begin
 Button2.Click;
 try
  ListBox1.Selected[0]:=true;
 except

 end; 
end;

procedure TForm3.Button2Click(Sender: TObject);
var
 s: string;
begin
 s:=Form1.ComboBox1.Text;
 Form1.Table1.Active:=False;
 Form1.Table1.TableName:=GetProgramPath+'data\'+'AllReq.db';
 Form1.Table1.Open;
 if Form1.Table1.Exists then
  begin
   ListBox1.Items.Clear;
   Form1.ComboBox1.Clear;
   Form1.ComboBox1.Text:=s;
   ListBox1.Items.BeginUpdate;
   Form1.ComboBox1.Items.BeginUpdate;
   Form1.Table1.First;
   while not(Form1.Table1.Eof) do
    begin
     ListBox1.Items.Add(Form1.Table1.Fields[0].AsString);
     Form1.Table1.Next;
    end;
   ListBox1.Items.EndUpdate;
   Form1.ComboBox1.Items.EndUpdate;      
  end;
 Form1.Table1.Close;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
 SendMessage(ListBox1.Handle,LB_SetHorizontalExtent,1000,0);
end;

procedure TForm3.Button1Click(Sender: TObject);
var
 s: string;
 i,j: integer;
begin
 j:=-1;
 s:=Trim(Edit2.Text);
 if s<>''
 then
  begin
   Edit1.Text:=s;
   for i:=0 to ListBox1.Items.Count-1 do
    if ListBox1.Items.Strings[i]=s
    then
     begin
      j:=i;
      Break;
     end;
   if j<>-1
   then
    if MessageDlg('Запись с таким именем "'+s+'" уже существует! Перезписать?',mtInformation,
       [mbOK,mbNo],0)=mrNo
    then Exit
    else Form1.SaveDocumentAs(s)
   else Form1.SaveDocumentAs(s);
  end
 else ShowMessage('Запись для удаления не выбрана!'); 
 Button2.Click;
 Close;
end;

procedure TForm3.ListBox1Click(Sender: TObject);
var
 i: integer;
begin
 for i:=0 to Listbox1.Items.Count-1 do
  if Listbox1.Selected[i]
  then Edit2.Text:=Listbox1.Items.Strings[i];
end;

procedure TForm3.ListBox1DblClick(Sender: TObject);
begin
 Button1.Click;
end;

end.
