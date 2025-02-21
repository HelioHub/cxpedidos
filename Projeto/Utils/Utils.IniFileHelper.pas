unit Utils.IniFileHelper;

interface

uses
  System.SysUtils, System.IniFiles;

type
  TIniFileHelper = class
  private
    FIniFile: TIniFile;
  public
    constructor Create(const FileName: string);
    destructor Destroy; override;

    function ReadString(const Section, Ident, Default: string): string;
  end;

implementation

{ TIniFileHelper }

constructor TIniFileHelper.Create(const FileName: string);
begin
  FIniFile := TIniFile.Create(FileName);
end;

destructor TIniFileHelper.Destroy;
begin
  FIniFile.Free;
  inherited;
end;

function TIniFileHelper.ReadString(const Section, Ident, Default: string): string;
begin
  Result := FIniFile.ReadString(Section, Ident, Default);
end;

end.
