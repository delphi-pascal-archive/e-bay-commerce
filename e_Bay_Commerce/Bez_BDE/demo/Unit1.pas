unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, BDE32, Db, DBTables;

type
  TForm1 = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    BDE321: TBDE32;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{
BDE32 Demo:
This exe requires "demo.db" in the same directory
and a subdir called BDE containing the following files:
- idapi32.cfg;
- idapi32.dll;
- bantam.dll;
- idr20009.dll;
- idpdx32.dll.

These files are for a paradox installation, diferent table
types require different DLLs, trial and error will reveal
which ones!
}

procedure TForm1.FormCreate(Sender: TObject);
var
 AppDir: string;
begin
 AppDir:=ExtractFilePath(Application.ExeName);
 Table1.DatabaseName:=AppDir;
 Table1.Open;  // DO NOT HAVE ANY TABLES OPEN AT DESIGN TIME, THEY WILL TRY TO BE OPENED BEFORE BDE32 IS CREATED
end;

end.
