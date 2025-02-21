unit View.Dados.Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ComCtrls, System.UITypes,
  Controller.ClienteController, Interfaces.ICliente,
  CXConst, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
    LabeledEdit1: TLabeledEdit;
    procedure BBSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBF2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BBGravarClick(Sender: TObject);
  private
    { Private declarations }
    FClienteController: TClienteController;

    procedure TratarDelete;
    procedure pCRUD(pAcao: TAcao);
    procedure pAtualizacao;
    procedure pConsultClientes;
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
end;

destructor TFDadosClientes.Destroy;
begin
  FClienteController.Free;
  inherited;
end;

procedure TFDadosClientes.BBGravarClick(Sender: TObject);
var
  Pedido: IPedido;
begin
  Pedido := FPedidoController.GetPedido;

  // Preenche os dados do pedido
  Pedido.NumeroPedido := StrToIntDef(LENumeroPedido.Text, 0);
  Pedido.DataEmissao := DTPDataEmissao.DateTime;
  Pedido.Cliente := StrToIntDef(LECodigoCliente.Text, 0);
  Pedido.ValorTotal := StrToFloatDef(StringReplace(
                                     LETotalPedido.Text, '.', '',
                                     [rfReplaceAll, rfIgnoreCase]), 0);

  // Salva o pedido
  if FPedidoController.SalvarPedido(Pedido) then
  begin
    // Atualiza o campo NumeroPedido com o ID gerado
    LENumeroPedido.Text := IntToStr(Pedido.NumeroPedido);

    ShowMessage('Sucesso na Gravação do Pedido '+LENumeroPedido.Text+'.');
  end
  else
    ShowMessage('Sem Sucesso na Gravação do Pedido '+LENumeroPedido.Text+'.'+cEOL+
      'Falta informar o Código do Cliente!');
  pAtualizacao;
end;

procedure TFDadosClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F2 then
end;

procedure TFDadosClientes.pAtualizacao;
begin
end;

procedure TFDadosClientes.pCRUD(pAcao: TAcao);
begin
end;

procedure TFDadosClientes.SBF2Click(Sender: TObject);
begin
  pConsultClientes;
end;

procedure TFDadosClientes.pConsultClientes;
begin
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
