unit BDE32;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Registry;

type
  TBDE32 = class(TComponent)
  private
    FLocalShare: Boolean;
    FPdxNetDir: String;
    FMaxBufSize, FMaxFileHandles, FMemSize, FSharedMemSize: integer;
    function GetRegistryDir(RegKey, DefaultDir: string): String ;
    procedure TestBDEDir(TestDir: string; var CF: string; var DLLP: string);
    function GetPaths(var CF: string; var DLLP: string): boolean;
    procedure writeToCFG(Item: string;  Val: string);
    function ReadFromCFG(Item: string;  DefStr: string): string;
  protected
    { Protected declarations }
  public
    constructor Create(AOwner:TComponent); override;
  published
    property LocalShare: boolean read FLocalShare write FLocalShare;
    property PdxNetDir: String read FPdxNetDir write FPdxNetDir;
    property MaxBufSize: integer read FMaxBufSize write FMaxBufSize;
    property MaxFileHandles: integer read FMaxFileHandles write FMaxFileHandles;
    property MemSize: integer read FMemSize write FMemSize;
    property SharedMemSize: integer read FSharedMemSize write FSharedMemSize;
    procedure WriteSettings;
    procedure ReadSettings;
  end;

function FilePos(FileName, What: string; startFrom: integer):integer;

procedure Register;

implementation
                    
{thanks to Andrea Sessa (asessa@nest.it) for the leading '\' on all registry paths...
 and to Remy Vincent (remyvincent@hotmail.com) for the GetCommonFilesDir function and for providing key dirs to look for BDE files...
 anyone else who improves BDE32 will get a mention - email paul@kestrelsoftware.co.uk with your improvements}




{########################### Check for BDE installation ###########################}
constructor TBDE32.Create(AOwner:TComponent);
var
   ConfigFile, DLLPath: string;
begin
     {Create: 1. Discover if BDE is installed by checing registry
              2. If not then look for BDE files and write loctations to Registry
              3. If unable to find BDE files then ask for them
              4. Finally read key settings from CFG file (if available)}
     inherited Create(AOwner);
     with TRegistry.create do begin
        Rootkey := HKEY_LOCAL_MACHINE;
        if not (OpenKey('\SOFTWARE\BORLAND\DATABASE ENGINE', false) and FileExists(ReadString('DLLPATH') + '\idapi32.dll')) then begin
           if GetPaths(ConfigFile, DLLPath) then begin
             Rootkey := HKEY_LOCAL_MACHINE;
             OpenKey('\SOFTWARE\BORLAND\DATABASE ENGINE', True);
             WriteString('CONFIGFILE01', ConfigFile);
             WriteString('DLLPATH', DLLPath);
             WriteString('RESOURCE', '0009');
             WriteString('SAVECONFIG', 'WIN31');
             WriteString('UseCount', '1');
           end
           else begin
             ShowMessage('Please put BDE files in ' + ExtractFilePath(application.ExeName) + 'BDE');
             halt;
           end;
        end;
        Free;
     end;
     ReadSettings;
end;









{########################### Read/Write to CFG file ###########################}
procedure TBDE32.ReadSettings;
begin
     FPdxNetDir := ReadFromCFG('NET DIR', 'F:\');
     FLocalShare := ReadFromCFG('LOCAL SHARE', 'FALSE') = 'TRUE';
     FMaxBufSize := StrToInt(ReadFromCFG('MAXBUFSIZE', '2048'));
     FMaxFileHandles := StrToInt(ReadFromCFG('MAXFILEHANDLES', '48'));
     FMemSize := StrToInt(ReadFromCFG('MEMSIZE', '16'));
     FSharedMemSize := StrToInt(ReadFromCFG('SHAREDMEMSIZE', '2048'));
end;

procedure TBDE32.WriteSettings;
begin
     if FLocalShare then writeToCFG('LOCAL SHARE', 'TRUE')
     else writeToCFG('LOCAL SHARE', 'FALSE');
     writeToCFG('NET DIR', FPdxNetDir);
     writeToCFG('MAXBUFSIZE', IntToStr(FMaxBufSize));
     writeToCFG('MAXFILEHANDLES', IntToStr(FMaxFileHandles));
     writeToCFG('MEMSIZE', IntToStr(FMemSize));
     writeToCFG('SHAREDMEMSIZE', IntToStr(FSharedMemSize));
end;





procedure TBDE32.writeToCFG(Item: string;  Val: string);
Var
   CFGFile, TempFile: string;
   CFGStream, TempStream: TFileStream;
   FoundPos1, FoundPos2: integer;
   myBuf: array[0..255] of char;
begin
     with TRegistry.create do begin
        Rootkey := HKEY_LOCAL_MACHINE;
        OpenKey('\SOFTWARE\BORLAND\DATABASE ENGINE', false);
        CFGFile := ReadString('CONFIGFILE01');
        Free;
     end;
     TempFile := CFGFile + '2';
     FoundPos1 := FilePos(CFGFile, Item, 0);
     if FoundPos1 > 0 then begin
        FoundPos2 := FilePos(CFGFile, #0, FoundPos1  + Length(Item) + 3);
        CFGStream := TFileStream.Create(CFGFile, fmOpenRead);
        TempStream := TFileStream.Create(TempFile, fmOpenWrite or fmCreate);
        TempStream.CopyFrom(CFGStream, FoundPos1 + Length(Item) + 2);
        StrPCopy(MyBuf, Val);
        TempStream.Write(MyBuf, length(Val));
        CFGStream.Seek(FoundPos2 - 1, soFromBeginning);
        TempStream.CopyFrom(CFGStream, CFGStream.Size - FoundPos2 + 1);
        TempStream.Free;
        CFGStream.Free;
     end;
     DeleteFile(CFGFile);
     RenameFile(TempFile, CFGFile);
end;

function TBDE32.ReadFromCFG(Item: string;  DefStr: string): string;
Var
   CFGFile: string;
   FoundPos1, FoundPos2: integer;
   MyFile: TextFile;
   MyStr: string;
begin
     with TRegistry.create do begin
        Rootkey := HKEY_LOCAL_MACHINE;
        OpenKey('\SOFTWARE\BORLAND\DATABASE ENGINE', false);
        CFGFile := ReadString('CONFIGFILE01');
        Free;
     end;
     if FileExists(CFGFile) then begin
       AssignFile(MyFile, CFGFile);
       Reset(MyFile);
       ReadLn(MyFile, MyStr);
       CloseFile(MyFile);
       FoundPos1 := Pos(Item, MyStr);
       if FoundPos1 > 0 then begin
         Delete(MyStr, 1, FoundPos1 + Length(Item) + 2);
         foundPos2 := Pos(#0, MyStr);
         Result := Copy(MyStr, 0, FoundPos2 + 1);
       end   
       else result := DefStr;
     end
     else result := DefStr;
end;

function FilePos(FileName, What: string; startFrom: integer): integer;
var
   MyStr: string;
   MyFile: TextFile;
begin
     if FileExists(FileName) then begin
       AssignFile(MyFile, FileName);
       Reset(MyFile);
       ReadLn(MyFile, MyStr);
       Delete(MyStr, 1, StartFrom);
       Result := StartFrom + Pos(What, MyStr);
       CloseFile(MyFile);
     end
     else result := 0;
end;









{########################### Find a previous BDE ###########################}
function TBDE32.GetPaths(var CF: string; var DLLP: string): boolean;
var
   AppDir, CommonDir, ProgDir: string;

begin
     {GetPaths: looks for the BDE, assumed to be found if a ConfigFile (CF) and
                DLL Path (DLLP) are found.  You can add your own search paths to
                these ones, remember that they are checked in order, so
                if 2 BDE's are found then the second one will be used}
     AppDir := ExtractFilePath(Application.ExeName);
     AppDir := Copy(AppDir, 1, length(AppDir) - 1);  {get rid of the last '\'}
     CommonDir := GetRegistryDir('CommonFilesDir', 'C:\Program Files\Common Files');
     ProgDir := GetRegistryDir('ProgramFilesDir', 'C:\Program Files');

     TestBDEDir(AppDir, CF, DLLP);
     TestBDEDir(AppDir + '\BDE', CF, DLLP);
     TestBDEDir(ProgDir + '\borland\common files\BDE', CF, DLLP);
     TestBDEDir(CommonDir + '\BDE', CF, DLLP);
     TestBDEDir(CommonDir + '\Borland\BDE', CF, DLLP);
     TestBDEDir(CommonDir + '\Borland Shared\BDE', CF, DLLP);

     Result := FileExists(CF) and FileExists(DLLP + '\idapi32.dll');
end;

procedure TBDE32.TestBDEDir(TestDir: string; var CF: string; var DLLP: string);
begin
     if FileExists(TestDir + '\idapi.cfg') then CF := TestDir + '\idapi.cfg';
     if FileExists(TestDir + '\idapi32.cfg') then CF := TestDir + '\idapi32.cfg';
     if FileExists(TestDir + '\idapi32.dll') then DLLP := TestDir;
end;

function TBDE32.GetRegistryDir(RegKey, DefaultDir: string): String;
begin
   with TRegistry.create do begin
      Rootkey := HKEY_LOCAL_MACHINE;
      OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion', false);
      Result := ReadString(RegKey);
      Free;
   end;
   if Result = '' then Result := DefaultDir;
end;




{########################### Register Component ###########################}
procedure Register;
begin
  RegisterComponents('Data Access', [TBDE32]);
end;

end.
