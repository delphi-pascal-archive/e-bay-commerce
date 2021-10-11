unit delzap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Bs;

{$R *.dfm}

function GetProgramPath : String;
begin
 GetProgramPath:=ExtractFilePath(ParamStr(0));
end;

procedure TForm2.Button1Click(Sender: TObject);
var
 i,j: integer;
begin
 j:=-1;
 if MessageDlg('Вы действительно хотите удалить текущую запись?', mtConfirmation,
    [mbYes, mbNo],0)=mrNo
 then
 else
  begin
   for i:=0 to ListBox1.Items.Count-1 do
    begin
     if ListBox1.Selected[i]=true
     then
      begin
       j:=i;
       Break;
      end;
    end;
   if j<>-1
   then
    begin
     Form1.Table1.Open;
     Form1.Table1.First;
     //
     while not (Form1.Table1.Eof) do
      begin
       if Form1.Table1.Fields[0].AsString=ListBox1.Items.Strings[j]
       then
        begin
         Form1.Table1.Delete;
         Form1.Table1.Close;
         Form1.Table1.Open;
         ShowMessage('Запись успешно удалена!');
         Button2.Click;
         Close;
         Exit;
        end;
       Form1.Table1.Next;
      end;
    end
   else ShowMessage('Запись для удаления не выбрана!');
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
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
     Form1.ComboBox1.Items.Add(Form1.Table1.Fields[0].AsString);
     Form1.Table1.Next;
    end;
   ListBox1.Items.EndUpdate;
   Form1.ComboBox1.Items.EndUpdate;   
  end;
 Form1.Table1.Close;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
 Button2.Click;
 try
  ListBox1.Selected[0]:=true;
 except

 end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 SendMessage(ListBox1.Handle,LB_SetHorizontalExtent,1000,0);
end;

procedure TForm2.ListBox1DblClick(Sender: TObject);
begin
 Button1.Click;
end;

end.
