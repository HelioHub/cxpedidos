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
  Utils.BrasilAPI;

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
    SpeedButton1: TSpeedButton;
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
    procedure BBSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BBGravarClick(Sender: TObject);
    procedure SBF2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    FClienteController: TClienteController;
    FBrasilAPI: TBrasilAPI;

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
  {
  Pedido.ValorTotal := StrToFloatDef(StringReplace(
                                     LETotalPedido.Text, '.', '',
                                     [rfReplaceAll, rfIgnoreCase]), 0);
  }

  // Preenche os dados
  Cliente.CodigoClientes := StrToIntDef(LECodigoCliente.Text, 0);
  Cliente.CNPJClientes := LECNPJ.Text;
  Cliente.NomeClientes := ERazao.Text;
  Cliente.CEPClientes := ECEP.Text;
  Cliente.RuaClientes := EEndereco.Text;
  Cliente.BairroClientes := EBairro.Text;
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
    // Atualiza o campo NumeroPedido com o ID gerado
    LECodigoCliente.Text := IntToStr(Cliente.CodigoClientes);

    ShowMessage('Sucesso na Gravação do Cliente '+LECodigoCliente.Text+'.');
  end
  else
    ShowMessage('Sem Sucesso na Gravação do Cliente '+LECodigoCliente.Text+'.'+cEOL+
      'Falta informar o Código do Cliente!');
end;

procedure TFDadosClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F2 then
  else if key = vk_F3 then
end;

procedure TFDadosClientes.SBF2Click(Sender: TObject);
begin
  MJSonCNPJ.Clear;
end;

procedure TFDadosClientes.SpeedButton1Click(Sender: TObject);
begin
  MJSonCEP.Clear;
  MJSonCEP.Lines.Add(FBrasilAPI.FConsultarCEP(ECEP.Text));
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
