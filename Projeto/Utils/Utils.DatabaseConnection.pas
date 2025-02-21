unit Utils.DatabaseConnection;

interface

uses
  FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, System.SysUtils,
  Utils.IniFileHelper;

type
  TDatabaseConnection = class
  private
    FConnection: TFDConnection;
    FIniFileHelper: TIniFileHelper;

    function GetConnection: TFDConnection;
  public
    constructor Create;
    destructor Destroy; override;

    property Connection: TFDConnection read GetConnection;
  end;

implementation

{ TDatabaseConnection }

uses CXConst;

constructor TDatabaseConnection.Create;
var
  IniFileName : String;
begin
  IniFileName := cPATH_INI;
  // Carrega os parâmetros do arquivo .INI
  FIniFileHelper := TIniFileHelper.Create(IniFileName);

  // Configura a conexão com o banco de dados
  FConnection := TFDConnection.Create(nil);
  FConnection.DriverName := FIniFileHelper.ReadString('Database', 'DriverName', 'MySQL');
  FConnection.Params.Database := FIniFileHelper.ReadString('Database', 'Database', 'WKPedidos');
  FConnection.Params.UserName := FIniFileHelper.ReadString('Database', 'UserName', 'root');
  FConnection.Params.Password := FIniFileHelper.ReadString('Database', 'Password', 'wk@123');
  FConnection.Params.Add('Server=' + FIniFileHelper.ReadString('Database', 'Server', 'localhost'));
  FConnection.Params.Add('Port=' + FIniFileHelper.ReadString('Database', 'Port', '3306'));

  // Configura o caminho da DLL do MySQL
  FConnection.Params.Add('VendorLib=' + FIniFileHelper.ReadString('Database', 'DLLPath', ''));

  FConnection.Connected := True;
end;

destructor TDatabaseConnection.Destroy;
begin
  FConnection.Connected := False;
  FConnection.Free;
  FIniFileHelper.Free;
  inherited;
end;

function TDatabaseConnection.GetConnection: TFDConnection;
begin
  Result := FConnection;
end;

end.
