unit Model.Cliente;

interface

uses
  Interfaces.ICliente, FireDAC.Comp.Client, Data.DB, Utils.DatabaseConnection;

type
  TCliente = class(TInterfacedObject, ICliente)
  private
    FCodigoClientes: Integer;
    FCNPJClientes: string;
    FNomeClientes: string;
    FCEPClientes: string;
    FRuaClientes: string;
    FBairroClientes: string;
    FCidadeClientes: string;
    FUFClientes: string;
    FLongitudeClientes: Double;
    FLatitudeClientes: Double;
    FCodIBGEClientes: string;
    FNomeFantasiaClientes: string;
    FSitCadastralClientes: string;
    FNumRuaClientes: Integer;

    FQuery: TFDQuery; // Query para interagir com o banco de dados
    FDatabaseConnection: TDatabaseConnection; // Conexão centralizada

    function GetCodigoClientes: Integer;
    procedure SetCodigoClientes(const Value: Integer);

    function GetCNPJClientes: string;
    procedure SetCNPJClientes(const Value: string);

    function GetNomeClientes: string;
    procedure SetNomeClientes(const Value: string);

    function GetCEPClientes: string;
    procedure SetCEPClientes(const Value: string);

    function GetRuaClientes: string;
    procedure SetRuaClientes(const Value: string);

    function GetBairroClientes: string;
    procedure SetBairroClientes(const Value: string);

    function GetCidadeClientes: string;
    procedure SetCidadeClientes(const Value: string);

    function GetUFClientes: string;
    procedure SetUFClientes(const Value: string);

    function GetLongitudeClientes: Double;
    procedure SetLongitudeClientes(const Value: Double);

    function GetLatitudeClientes: Double;
    procedure SetLatitudeClientes(const Value: Double);

    function GetCodIBGEClientes: string;
    procedure SetCodIBGEClientes(const Value: string);

    function GetNomeFantasiaClientes: string;
    procedure SetNomeFantasiaClientes(const Value: string);

    function GetSitCadastralClientes: string;
    procedure SetSitCadastralClientes(const Value: string);

    function GetNumRuaClientes: Integer;
    procedure SetNumRuaClientes(const Value: Integer);

  public
    constructor Create;
    destructor Destroy; override;

    property CodigoClientes: Integer read GetCodigoClientes write SetCodigoClientes;
    property CNPJClientes: string read GetCNPJClientes write SetCNPJClientes;
    property NomeClientes: string read GetNomeClientes write SetNomeClientes;
    property CEPClientes: string read GetCEPClientes write SetCEPClientes;
    property RuaClientes: string read GetRuaClientes write SetRuaClientes;
    property BairroClientes: string read GetBairroClientes write SetBairroClientes;
    property CidadeClientes: string read GetCidadeClientes write SetCidadeClientes;
    property UFClientes: string read GetUFClientes write SetUFClientes;
    property LongitudeClientes: Double read GetLongitudeClientes write SetLongitudeClientes;
    property LatitudeClientes: Double read GetLatitudeClientes write SetLatitudeClientes;
    property CodIBGEClientes: string read GetCodIBGEClientes write SetCodIBGEClientes;
    property NomeFantasiaClientes: string read GetNomeFantasiaClientes write SetNomeFantasiaClientes;
    property SitCadastralClientes: string read GetSitCadastralClientes write SetSitCadastralClientes;

    procedure CarregarDados(const AFDMemTable: TFDMemTable; pId, pNomeCliente, pLimite: String);
    function CarregarNomePorId(pId: String) : String; // Implementação do método Carregar Nome por Id
    function Excluir(const AId: Integer): Boolean;
    function Salvar: Boolean;

    function GerarRelatorioHTML(const CodigosClientes: TArray<Integer>): string;
  end;

implementation

uses
  FireDAC.DApt, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, System.SysUtils, System.Classes, Vcl.Dialogs, Utils.ErrorLogger,
  CXConst;

{ TCliente }

constructor TCliente.Create;
begin
  // Usa a conexão centralizada com parâmetros do arquivo .INI
  FDatabaseConnection := TDatabaseConnection.Create;
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FDatabaseConnection.Connection;
end;

destructor TCliente.Destroy;
begin
  FQuery.Free;
  FDatabaseConnection.Free;
  inherited;
end;

function TCliente.GetCodigoClientes: Integer;
begin
  Result := FCodigoClientes;
end;

procedure TCliente.SetCodigoClientes(const Value: Integer);
begin
  FCodigoClientes := Value;
end;

function TCliente.GetCNPJClientes: string;
begin
  Result := FCNPJClientes;
end;

procedure TCliente.SetCNPJClientes(const Value: string);
begin
  FCNPJClientes := Value;
end;

function TCliente.GetNomeClientes: string;
begin
  Result := FNomeClientes;
end;

procedure TCliente.SetNomeClientes(const Value: string);
begin
  FNomeClientes := Value;
end;

function TCliente.GetCEPClientes: string;
begin
  Result := FCEPClientes;
end;

procedure TCliente.SetCEPClientes(const Value: string);
begin
  FCEPClientes := Value;
end;

function TCliente.GetRuaClientes: string;
begin
  Result := FRuaClientes;
end;

procedure TCliente.SetRuaClientes(const Value: string);
begin
  FRuaClientes := Value;
end;

function TCliente.GerarRelatorioHTML(
  const CodigosClientes: TArray<Integer>): string;
var
  HTML: TStringList;
  cWhere: String;
  I: Integer;
begin
  cWhere := '';
  for I := 0 to High(CodigosClientes) do
  begin
    if I = 0 then cWhere := ' ( '
    else          cWhere := cWhere + ' OR ';
    cWhere := cWhere + ' CodigoClientes = '+ IntToStr(CodigosClientes[I]);
    if I = High(CodigosClientes) then cWhere := cWhere + ' ) ';
  end;

  FQuery.SQL.Clear;
  FQuery.SQL.Text := 'SELECT * FROM Clientes ';
  if cWhere <> EmptyStr then
    FQuery.SQL.Add('WHERE 1=1 AND ' + cWhere);
  FQuery.SQL.Add(' ORDER BY CodigoClientes ');
  FQuery.Open;

  // Cria o HTML
  HTML := TStringList.Create;
  try
    // Início do HTML
    HTML.Add('<!DOCTYPE html>');
    HTML.Add('<html lang="pt-BR">');
    HTML.Add('<head>');
    HTML.Add('  <meta charset="UTF-8">');
    HTML.Add('  <meta name="viewport" content="width=device-width, initial-scale=1.0">');
    HTML.Add('  <title>Relatorio de Clientes</title>');
    HTML.Add('  <style>');
    HTML.Add('    body { font-family: Arial, sans-serif; margin: 20px; }');
    HTML.Add('    h1 { color: #333; }');
    HTML.Add('    table { width: 100%; border-collapse: collapse; margin-top: 20px; }');
    HTML.Add('    th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }');
    HTML.Add('    th { background-color: #f2f2f2; }');
    HTML.Add('    tr:nth-child(even) { background-color: #f9f9f9; }');
    HTML.Add('    tr:hover { background-color: #f1f1f1; }');
    HTML.Add('  </style>');
    HTML.Add('</head>');
    HTML.Add('<body>');
    HTML.Add('  <h1>Relatorio de Clientes</h1>');
    HTML.Add('  <table>');
    HTML.Add('    <thead>');
    HTML.Add('      <tr>');
    HTML.Add('        <th>Codigo</th>');
    HTML.Add('        <th>Nome</th>');
    HTML.Add('        <th>CNPJ</th>');
    HTML.Add('        <th>CEP</th>');
    HTML.Add('        <th>Rua</th>');
    HTML.Add('        <th>Numero</th>');
    HTML.Add('        <th>Bairro</th>');
    HTML.Add('        <th>Cidade</th>');
    HTML.Add('        <th>UF</th>');
    HTML.Add('        <th>Nome Fantasia</th>');
    HTML.Add('        <th>Situacao Cadastral</th>');
    HTML.Add('      </tr>');
    HTML.Add('    </thead>');
    HTML.Add('    <tbody>');

    while not FQuery.Eof do
    begin
      HTML.Add('      <tr>');
      HTML.Add('        <td>' + FQuery.FieldByName('CodigoClientes').AsString + '</td>');
      HTML.Add('        <td>' + FQuery.FieldByName('NomeClientes').AsString + '</td>');
      HTML.Add('        <td>' + FQuery.FieldByName('CNPJClientes').AsString + '</td>');
      HTML.Add('        <td>' + FQuery.FieldByName('CEPClientes').AsString + '</td>');
      HTML.Add('        <td>' + FQuery.FieldByName('RuaClientes').AsString + '</td>');
      HTML.Add('        <td>' + FQuery.FieldByName('NumeroRuaClientes').AsString + '</td>');
      HTML.Add('        <td>' + FQuery.FieldByName('BairroClientes').AsString + '</td>');
      HTML.Add('        <td>' + FQuery.FieldByName('CidadeClientes').AsString + '</td>');
      HTML.Add('        <td>' + FQuery.FieldByName('UFClientes').AsString + '</td>');
      HTML.Add('        <td>' + FQuery.FieldByName('NomeFantasiaClientes').AsString + '</td>');
      HTML.Add('        <td>' + FQuery.FieldByName('SitCadastralClientes').AsString + '</td>');
      HTML.Add('      </tr>');
      FQuery.Next;
    end;

    // Fecha o HTML
    HTML.Add('    </tbody>');
    HTML.Add('  </table>');
    HTML.Add('</body>');
    HTML.Add('</html>');

    Result := HTML.Text;
  finally
    HTML.Free;
  end;
end;

function TCliente.GetBairroClientes: string;
begin
  Result := FBairroClientes;
end;

procedure TCliente.SetBairroClientes(const Value: string);
begin
  FBairroClientes := Value;
end;

function TCliente.GetCidadeClientes: string;
begin
  Result := FCidadeClientes;
end;

procedure TCliente.SetCidadeClientes(const Value: string);
begin
  FCidadeClientes := Value;
end;

function TCliente.GetUFClientes: string;
begin
  Result := FUFClientes;
end;

procedure TCliente.SetUFClientes(const Value: string);
begin
  FUFClientes := Value;
end;

function TCliente.GetLongitudeClientes: Double;
begin
  Result := FLongitudeClientes;
end;

procedure TCliente.SetLongitudeClientes(const Value: Double);
begin
  FLongitudeClientes := Value;
end;

function TCliente.GetLatitudeClientes: Double;
begin
  Result := FLatitudeClientes;
end;

procedure TCliente.SetLatitudeClientes(const Value: Double);
begin
  FLatitudeClientes := Value;
end;

function TCliente.GetCodIBGEClientes: string;
begin
  Result := FCodIBGEClientes;
end;

procedure TCliente.SetCodIBGEClientes(const Value: string);
begin
  FCodIBGEClientes := Value;
end;

function TCliente.GetNomeFantasiaClientes: string;
begin
  Result := FNomeFantasiaClientes;
end;

function TCliente.GetNumRuaClientes: Integer;
begin
  Result := FNumRuaClientes;
end;

procedure TCliente.SetNomeFantasiaClientes(const Value: string);
begin
  FNomeFantasiaClientes := Value;
end;

procedure TCliente.SetNumRuaClientes(const Value: Integer);
begin
  FNumRuaClientes := Value;
end;

function TCliente.GetSitCadastralClientes: string;
begin
  Result := FSitCadastralClientes;
end;

procedure TCliente.SetSitCadastralClientes(const Value: string);
begin
  FSitCadastralClientes := Value;
end;

procedure TCliente.CarregarDados(const AFDMemTable: TFDMemTable; pId, pNomeCliente, pLimite: String);
begin
  try
    // Prepara a query para selecionar os dados
    FQuery.SQL.Clear;
    FQuery.SQL.Add(' SELECT clientes.CodigoClientes, '+
                   '   clientes.CNPJClientes,'+
                   '   clientes.NomeClientes,'+
                   '   clientes.CEPClientes,'+
                   '   clientes.RuaClientes,'+
                   '   clientes.BairroClientes,'+
                   '   clientes.CidadeClientes,'+
                   '   clientes.UFClientes,'+
                   '   clientes.LongitudeClientes,'+
                   '   clientes.LatitudeClientes,'+
                   '   clientes.CodIBGEClientes,'+
                   '   clientes.NomeFantasiaClientes,'+
                   '   clientes.SitCadastralClientes,'+
                   '   clientes.NumeroRuaClientes');
    FQuery.SQL.Add(' FROM wkpedidos.clientes ');
    FQuery.SQL.Add(' WHERE 1=1 ');
    if pId <> EmptyStr then
      FQuery.SQL.Add(' AND clientes.CodigoClientes = '+pId);
    if pNomeCliente <> EmptyStr then
      FQuery.SQL.Add(' AND clientes.NomeClientes LIKE '+QuotedStr(pNomeCliente+'%'));
    FQuery.SQL.Add(' ORDER BY clientes.NomeClientes');
    if pLimite <> EmptyStr then
      FQuery.SQL.Add('	LIMIT '+pLimite+' OFFSET 0 ');
    FQuery.Open;

    // Copia os dados para o TFDMemTable
    AFDMemTable.Close;
    AFDMemTable.Data := FQuery.Data;
    AFDMemTable.Open;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao carregar dados: ' + cEOL + E.Message);
    end;
  end;
end;

function TCliente.CarregarNomePorId(pId: String) : String;
begin
  Result := '';
  try
    FQuery.SQL.Clear;
    FQuery.SQL.Add(' SELECT NomeClientes ');
    FQuery.SQL.Add(' FROM Clientes');
    if pId <> EmptyStr then
      FQuery.SQL.Add('WHERE CodigoClientes = '+pId);
    FQuery.Open;

    Result := FQuery.FieldByName('NomeClientes').AsString
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao carregar dados: ' + E.Message);
    end;
  end;
end;

function TCliente.Excluir(const AId: Integer): Boolean;
begin
  Result := False;
  try
    // Prepara a query para excluir o pedido
    FQuery.SQL.Clear;
    FQuery.SQL.Add(' DELETE FROM Clientes WHERE CodigoClientes = :CodigoCliente');
    FQuery.ParamByName('CodigoCliente').AsInteger := AId;

    // Executa a query
    FQuery.ExecSQL;

    Result := True; // Indica que o pedido foi excluído com sucesso
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao excluir pedido: ' + E.Message);
    end;
  end;
end;

function TCliente.Salvar: Boolean;
var
  Logger: TErrorLogger;
begin
  Result := False;
  Logger := TErrorLogger.Create; // Usa o caminho padrão 'error.log'
  try

    FDatabaseConnection.Connection.StartTransaction;
    try
      // Prepara a query para inserir ou atualizar o pedido
      FQuery.SQL.Clear;
      if FCodigoClientes = 0 then
      begin
        // Inserir novo pedido
        FQuery.SQL.Text := 'INSERT INTO Clientes (CNPJClientes, NomeClientes, CEPClientes, RuaClientes, ' +
                           'BairroClientes, CidadeClientes, UFClientes, LongitudeClientes, LatitudeClientes, ' +
                           'CodIBGEClientes, NomeFantasiaClientes, SitCadastralClientes, NumeroRuaClientes) ' +

                           'VALUES (:CNPJ, :Nome, :CEP, :Rua, :Bairro, :Cidade, :UF, :Longitude, :Latitude, ' +
                           ':CodIBGE, :NomeFantasia, :SitCadastral, :NumeroRua)';

      end
      else
      begin
        // Atualizar pedido existente
        FQuery.SQL.Text :=
          'UPDATE Clientes SET ' +
          'CNPJClientes = :CNPJ, NomeClientes = :Nome, CEPClientes = :CEP, RuaClientes = :Rua, ' +
          'BairroClientes = :Bairro, CidadeClientes = :Cidade, UFClientes = :UF, ' +
          'LongitudeClientes = :Longitude, LatitudeClientes = :Latitude, ' +
          'CodIBGEClientes = :CodIBGE, NomeFantasiaClientes = :NomeFantasia, ' +
          'SitCadastralClientes = :SitCadastral, ' +
          'NumeroRuaClientes = :NumeroRua ' +

          'WHERE CodigoClientes = :CodigoCliente';

        FQuery.ParamByName('CodigoCliente').AsInteger := FCodigoClientes;
      end;

      // Define os parâmetros da query
      FQuery.ParamByName('CNPJ').AsString := FCNPJClientes;
      FQuery.ParamByName('Nome').AsString := FNomeClientes;
      FQuery.ParamByName('CEP').AsString := FCEPClientes;
      FQuery.ParamByName('Rua').AsString := FRuaClientes;
      FQuery.ParamByName('Bairro').AsString := FBairroClientes;
      FQuery.ParamByName('Cidade').AsString := FCidadeClientes;
      FQuery.ParamByName('UF').AsString := FUFClientes;
      FQuery.ParamByName('Longitude').AsFloat := FLongitudeClientes;
      FQuery.ParamByName('Latitude').AsFloat := FLatitudeClientes;
      FQuery.ParamByName('CodIBGE').AsString := FCodIBGEClientes;
      FQuery.ParamByName('NomeFantasia').AsString := FNomeFantasiaClientes;
      FQuery.ParamByName('SitCadastral').AsString := FSitCadastralClientes;
      FQuery.ParamByName('NumeroRua').AsInteger := FNumRuaClientes;

      // Executa a query
      FQuery.ExecSQL;

      // Se for uma inserção, recupera o ID gerado
      if FCodigoClientes = 0 then
      begin
        FQuery.SQL.Clear;
        FQuery.SQL.Add('SELECT LAST_INSERT_ID() AS LastID');
        FQuery.Open;
        FCodigoClientes := FQuery.FieldByName('LastID').AsInteger;
      end;

      FDatabaseConnection.Connection.Commit;
      Result := True; // Indica que o pedido foi salvo com sucesso
    except
      on E: Exception do
      begin
        FDatabaseConnection.Connection.Rollback;
        Logger.LogError(E);
        raise Exception.Create('Erro ao salvar pedido: ' + E.Message);
      end;
    end;

  finally
    Logger.Free;
  end;
end;

end.
