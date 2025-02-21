unit Utils.ErrorLogger;

interface

uses
  System.SysUtils, System.Classes;

type
  TErrorLogger = class
  private
    FLogFilePath: string;
    procedure SetLogFilePath(const Value: string);
  public
    constructor Create(const ALogFilePath: string = '');
    procedure LogError(const AMessage: string); overload;
    procedure LogError(const E: Exception); overload;
    procedure ClearLog;
    property LogFilePath: string read FLogFilePath write SetLogFilePath;
  end;

implementation

{ TErrorLogger }

constructor TErrorLogger.Create(const ALogFilePath: string);
begin
  inherited Create;
  if ALogFilePath = '' then
    FLogFilePath := 'error.log' // Caminho padrão do arquivo de log
  else
    FLogFilePath := ALogFilePath;
end;

procedure TErrorLogger.SetLogFilePath(const Value: string);
begin
  if Value <> '' then
    FLogFilePath := Value
  else
    FLogFilePath := 'error.log';
end;

procedure TErrorLogger.LogError(const AMessage: string);
var
  LogFile: TextFile;
begin
  AssignFile(LogFile, FLogFilePath);
  try
    if FileExists(FLogFilePath) then
      Append(LogFile)
    else
      Rewrite(LogFile);
    Writeln(LogFile, DateTimeToStr(Now) + ' - ' + AMessage);
  finally
    CloseFile(LogFile);
  end;
end;

procedure TErrorLogger.LogError(const E: Exception);
begin
  LogError('Erro: ' + E.ClassName + ' - ' + E.Message);
end;

procedure TErrorLogger.ClearLog;
var
  LogFile: TextFile;
begin
  AssignFile(LogFile, FLogFilePath);
  try
    Rewrite(LogFile); // Sobrescreve o arquivo, limpando o conteúdo
  finally
    CloseFile(LogFile);
  end;
end;

end.
