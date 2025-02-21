unit Utils.uBrasilAPI;

interface

uses
  System.SysUtils, System.Classes, System.JSON, IdHTTP, IdSSLOpenSSL;

type
  TBrasilAPI = class
  private
    FIdHTTP: TIdHTTP;
    function FazerRequisicaoGET(const URL: string): TJSONObject;
    function FazerRequisicaoGETArray(const URL: string): TJSONArray;

    function ConsultarCEP(const CEP: string): TJSONObject;
    function ConsultarCNPJ(const CNPJ: string): TJSONObject;
    function ConsultarCodigoIBGE(const CodigoIBGE: string): TJSONArray;
    function ConsultarLatLongCEP(const CEP: string): TJSONObject;
    function PesquisarCodigoIBGE(const JSONArray: TJSONArray;
      const NomeCidade: string): string;
  public
    constructor Create;
    destructor Destroy; override;

    function FConsultarCEP(const CEP: string): String;
    function FConsultarLatLongCEP(const CEP: string): String;
    function FConsultarCNPJ(const CNPJ: string): String;
    function FConsultarCodigoIBGE(const UF, Cidade: string): String;
    function ExtrairValorJSON(JSON: TJSONObject; const Caminho: string): string;
  end;

implementation

constructor TBrasilAPI.Create;
begin
  FIdHTTP := TIdHTTP.Create(nil);
  FIdHTTP.IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(FIdHTTP);
  FIdHTTP.Request.ContentType := 'application/json';
  FIdHTTP.Request.UserAgent := 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36 OPR/77.0.4054.203';
  FIdHTTP.ConnectTimeout := 10000; // 10 segundos para conectar
  FIdHTTP.ReadTimeout := 10000;    // 10 segundos para ler a resposta
end;

destructor TBrasilAPI.Destroy;
begin
  FIdHTTP.Free;
  inherited;
end;

function TBrasilAPI.FazerRequisicaoGET(const URL: string): TJSONObject;
var
  Response: string;
begin
  try
    Response := FIdHTTP.Get(URL);
    Result := TJSONObject.ParseJSONValue(Response) as TJSONObject;
  except
    on E: EIdHTTPProtocolException do
    begin
      if E.ErrorCode = 403 then
        raise Exception.Create('Acesso proibido (403). Verifique o User-Agent ou limite de requisi��es.')
      else if E.ErrorCode = 504 then
        raise Exception.Create('Erro 504: Gateway Time-out. Verifique a conex�o ou tente novamente mais tarde.')
      else
        raise Exception.Create('Erro na requisi��o: ' + E.Message);
    end;
    on E: Exception do
    begin
      raise Exception.Create('Erro na requisi��o: ' + E.Message);
    end;
  end;
end;

function TBrasilAPI.FazerRequisicaoGETArray(const URL: string): TJSONArray;
var
  Response: string;
begin
  try
    Response := FIdHTTP.Get(URL);
    Result := TJSONObject.ParseJSONValue(Response) as TJSONArray;
  except
    on E: EIdHTTPProtocolException do
    begin
      if E.ErrorCode = 403 then
        raise Exception.Create('Acesso proibido (403). Verifique o User-Agent ou limite de requisi��es.')
      else if E.ErrorCode = 504 then
        raise Exception.Create('Erro 504: Gateway Time-out. Verifique a conex�o ou tente novamente mais tarde.')
      else
        raise Exception.Create('Erro na requisi��o: ' + E.Message);
    end;
    on E: Exception do
    begin
      raise Exception.Create('Erro na requisi��o: ' + E.Message);
    end;
  end;
end;

function TBrasilAPI.ConsultarCEP(const CEP: string): TJSONObject;
begin
  Result := FazerRequisicaoGET('https://brasilapi.com.br/api/cep/v1/' + CEP);
end;

function TBrasilAPI.ConsultarCNPJ(const CNPJ: string): TJSONObject;
begin
  Result := FazerRequisicaoGET('https://brasilapi.com.br/api/cnpj/v1/' + CNPJ);
end;

function TBrasilAPI.ConsultarCodigoIBGE(const CodigoIBGE: string): TJSONArray;
begin
  Result := FazerRequisicaoGETArray('https://brasilapi.com.br/api/ibge/municipios/v1/' + CodigoIBGE);
end;

function TBrasilAPI.ConsultarLatLongCEP(const CEP: string): TJSONObject;
begin
  Result := FazerRequisicaoGET('https://brasilapi.com.br/api/cep/v2/' + CEP);
end;

function TBrasilAPI.ExtrairValorJSON(JSON: TJSONObject; const Caminho: string): string;
var
  Partes: TArray<string>;
  Valor: TJSONValue;
  I: Integer;
begin
  Partes := Caminho.Split(['.']);
  Valor := JSON;

  for I := 0 to High(Partes) do
  begin
    if Valor is TJSONObject then
      Valor := TJSONObject(Valor).GetValue(Partes[I])
    else
      raise Exception.Create('Caminho inv�lido no JSON.');
  end;

  Result := Valor.Value;
end;

function TBrasilAPI.FConsultarCEP(const CEP: string) : String;
var
  JSON: TJSONObject;
begin
  try
    JSON := ConsultarCEP(CEP);
    Result := JSON.Format(2);
  except
    on E: Exception do
    Begin
      Result := 'Erro: ' + E.Message;
      raise Exception.Create(Result);
    End;
  end;
end;

function TBrasilAPI.FConsultarCNPJ(const CNPJ: string): String;
var
  JSON: TJSONObject;
begin
  try
    JSON := ConsultarCNPJ(CNPJ);
    Result := JSON.Format(2);
  except
    on E: Exception do
    Begin
      Result := 'Erro: ' + E.Message;
      raise Exception.Create(Result);
    End;
  end;
end;

function TBrasilAPI.FConsultarCodigoIBGE(const UF, Cidade: string): String;
var
  JSONArray: TJSONArray;
begin
  try
    JSONArray := ConsultarCodigoIBGE(UF);
    Result := PesquisarCodigoIBGE(JSONArray, Cidade);
  except
    on E: Exception do
    Begin
      Result := 'Erro: ' + E.Message;
      raise Exception.Create(Result);
    End;
  end;
end;

function TBrasilAPI.FConsultarLatLongCEP(const CEP: string): String;
var
  JSON: TJSONObject;
begin
  try
    JSON := ConsultarLatLongCEP(CEP);
    Result := JSON.Format(2);
  except
    on E: Exception do
    Begin
      Result := 'Erro: ' + E.Message;
      raise Exception.Create(Result);
    End;
  end;
end;

function TBrasilAPI.PesquisarCodigoIBGE(const JSONArray: TJSONArray; const NomeCidade: string): string;
var
  I: Integer;
  Item: TJSONObject;
  Nome, CodigoIBGE: string;
begin
  Result := '';

  // Percorre o array JSON
  for I := 0 to JSONArray.Count - 1 do
  begin
    Item := JSONArray.Items[I] as TJSONObject;

    Nome := Item.GetValue<string>('nome');
    CodigoIBGE := Item.GetValue<string>('codigo_ibge');

    if Nome = NomeCidade then
    begin
      Result := CodigoIBGE; // Retorna o c�digo IBGE correspondente
      Exit;
    end;
  end;
end;

end.
