unit View.Dados.Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ComCtrls, System.UITypes,
  Controller.ClienteController, Interfaces.ICliente,
  CXConst, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Utils.uBrasilAPI, System.JSON;

type
  TFDadosClientes = class(TForm)
    PRodape: TPanel;
    PDados: TPanel;
    BBSair: TBitBtn;
    BBGravar: TBitBtn;
    LECodigoCliente: TLabeledEdit;
    SBF2: TSpeedButton;
    LNomeFant: TLabel;
    LEnd: TLabel;
    LNum: TLabel;
    LBairro: TLabel;
    LLong: TLabel;
    LLati: TLabel;
    LCIBGE: TLabel;
    LSituacao: TLabel;
    Label1: TLabel;
    LECNPJ: TLabeledEdit;
    ERazao: TEdit;
    EFantasia: TEdit;
    Label2: TLabel;
    ECEP: TEdit;
    SBF3: TSpeedButton;
    EEndereco: TEdit;
    ENumero: TEdit;
    EBairro: TEdit;
    ESituacao: TEdit;
    ELongitude: TEdit;
    ELatidude: TEdit;
    EIBGE: TEdit;
    ECidade: TEdit;
    LCidade: TLabel;
    EUF: TEdit;
    LUF: TLabel;
    MJSonCNPJ: TMemo;
    MJSonCEP: TMemo;
    LJSON: TLabel;
    SBF4: TSpeedButton;
    SBF5: TSpeedButton;
    procedure BBSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BBGravarClick(Sender: TObject);
    procedure SBF2Click(Sender: TObject);
    procedure SBF3Click(Sender: TObject);
    procedure SBF4Click(Sender: TObject);
    procedure SBF5Click(Sender: TObject);
  private
    { Private declarations }
    FClienteController: TClienteController;
    FBrasilAPI: TBrasilAPI;

    procedure ConsultarAPI_CEP;
    procedure ConsultarAPI_CEP_Localizacao;
    procedure ConsultarAPI_CNPJ;
    procedure ConsultarAPI_IBGE;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FDadosClientes: TFDadosClientes;

implementation

{$R *.dfm}

uses View.Consulta.Clientes, Utils.DMUtils;

constructor TFDadosClientes.Create(AOwner: TComponent);
begin
  inherited;
  FClienteController := TClienteController.Create;
  FBrasilAPI := TBrasilAPI.Create;
end;

destructor TFDadosClientes.Destroy;
begin
  FClienteController.Free;
  FBrasilAPI.Free;
  inherited;
end;

procedure TFDadosClientes.BBGravarClick(Sender: TObject);
var
  Cliente: ICliente;
begin
  Cliente := FClienteController.GetCliente;

  // Preenche os dados
  Cliente.CodigoClientes := StrToIntDef(LECodigoCliente.Text, 0);
  Cliente.CNPJClientes := LECNPJ.Text;
  Cliente.NomeClientes := ERazao.Text;
  Cliente.CEPClientes := ECEP.Text;
  Cliente.RuaClientes := EEndereco.Text;
  Cliente.BairroClientes := EBairro.Text;
  Cliente.CidadeClientes := ECidade.Text;
  Cliente.UFClientes := EUF.Text;
  Cliente.LongitudeClientes := StrToFloatDef(ELongitude.Text,0);
  Cliente.LatitudeClientes := StrToFloatDef(ELatidude.Text,0);
  Cliente.CodIBGEClientes := EIBGE.Text;
  Cliente.NomeFantasiaClientes := EFantasia.Text;
  Cliente.SitCadastralClientes := ESituacao.Text;
  Cliente.NumRuaClientes := StrToIntDef(ENumero.Text,0);

  // Salva
  if FClienteController.SalvarCliente(Cliente) then
  begin
    // Atualiza o campo ID gerado
    LECodigoCliente.Text := IntToStr(Cliente.CodigoClientes);

    ShowMessage('Sucesso na Grava��o do Cliente '+LECodigoCliente.Text+'.');
  end
  else
    ShowMessage('Sem Sucesso na Grava��o do Cliente '+LECodigoCliente.Text+'.'+cEOL+
      'Falta informar o C�digo do Cliente!');
end;

procedure TFDadosClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F2 then
    ConsultarAPI_CNPJ
  else if key = vk_F3 then
    ConsultarAPI_CEP
  else if key = vk_F4 then
    ConsultarAPI_CEP_Localizacao
  else if key = vk_F5 then
    ConsultarAPI_IBGE
end;

procedure TFDadosClientes.SBF2Click(Sender: TObject);
begin
  ConsultarAPI_CNPJ;
end;

procedure TFDadosClientes.SBF3Click(Sender: TObject);
begin
  ConsultarAPI_CEP;
end;

procedure TFDadosClientes.SBF4Click(Sender: TObject);
begin
  ConsultarAPI_CEP_Localizacao;
end;

procedure TFDadosClientes.SBF5Click(Sender: TObject);
begin
  ConsultarAPI_IBGE;
end;

procedure TFDadosClientes.ConsultarAPI_CEP;
var
  JSONResponse: string;
  JSONValue: TJSONObject;
begin
  if ECEP.Text = EmptyStr then
  begin
    Beep;
    ShowMessage('Informe o CEP!');
    exit;
  end;

  JSONResponse := FBrasilAPI.FConsultarCEP(ECEP.Text);

  MJSonCEP.Clear;
  MJSonCEP.Lines.Add(JSONResponse);

  JSONValue := TJSONObject.ParseJSONValue(JSONResponse) as TJSONObject;
  EEndereco.Text := FBrasilAPI.ExtrairValorJSON(JSONValue, 'street');
  EBairro.Text := FBrasilAPI.ExtrairValorJSON(JSONValue, 'neighborhood');
  ECidade.Text := FBrasilAPI.ExtrairValorJSON(JSONValue, 'city');
  EUF.Text := FBrasilAPI.ExtrairValorJSON(JSONValue, 'state');
end;

procedure TFDadosClientes.ConsultarAPI_CEP_Localizacao;
var
  JSONResponse: string;
  JSONValue: TJSONObject;
begin
  if ECEP.Text = EmptyStr then
  begin
    Beep;
    ShowMessage('Informe o CEP!');
    exit;
  end;

  JSONResponse := FBrasilAPI.FConsultarLatLongCEP(ECEP.Text);

  JSONValue := TJSONObject.ParseJSONValue(JSONResponse) as TJSONObject;
  ELongitude.Text := FBrasilAPI.ExtrairValorJSON(JSONValue, 'location.coordinates.longitude');
  ELatidude.Text := FBrasilAPI.ExtrairValorJSON(JSONValue, 'location.coordinates.latitude');
end;

procedure TFDadosClientes.ConsultarAPI_CNPJ;
var
  JSONResponse: string;
  JSONValue: TJSONObject;
begin
  if LECNPJ.Text = EmptyStr then
  begin
    Beep;
    ShowMessage('Informe o CNPJ!');
    exit;
  end;

  JSONResponse := FBrasilAPI.FConsultarCNPJ(LECNPJ.Text);

  MJSonCNPJ.Clear;
  MJSonCNPJ.Lines.Add(JSONResponse);

  JSONValue := TJSONObject.ParseJSONValue(JSONResponse) as TJSONObject;
  ERazao.Text := FBrasilAPI.ExtrairValorJSON(JSONValue, 'razao_social');
  EFantasia.Text := FBrasilAPI.ExtrairValorJSON(JSONValue, 'nome_fantasia');
  ESituacao.Text := FBrasilAPI.ExtrairValorJSON(JSONValue, 'descricao_situacao_cadastral');
end;

procedure TFDadosClientes.ConsultarAPI_IBGE;
var
  JSONResponse: string;
  JSONValue: TJSONObject;
begin
  if EUF.Text = EmptyStr then
  begin
    Beep;
    ShowMessage('Informe o UF!');
    exit;
  end;

  EIBGE.Text := FBrasilAPI.FConsultarCodigoIBGE(EUF.Text, UpperCase(ECidade.Text));
end;

procedure TFDadosClientes.BBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFDadosClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

end.
