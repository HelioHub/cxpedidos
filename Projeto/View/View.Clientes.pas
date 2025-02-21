unit View.Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Mask, System.UITypes,
  Interfaces.ICliente, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus,
  Controller.ClienteController,
  CXConst, Winapi.ShellAPI, Vcl.ComCtrls, Vcl.DBCtrls;

type
  TFViewClientes = class(TForm)
    PHead: TPanel;
    PRodape: TPanel;
    PViewPedidos: TPanel;
    BBIncluir: TBitBtn;
    BBAlterar: TBitBtn;
    BBExcluir: TBitBtn;
    BBSair: TBitBtn;
    LNR: TLabel;
    ENR: TEdit;
    DSViewClientes: TDataSource;
    PFiltrar: TPanel;
    LEFiltroCodigoCliente: TLabeledEdit;
    LEFiltroNomeCliente: TLabeledEdit;
    BBAtualizar: TBitBtn;
    BBRelatorio: TBitBtn;
    SBClearPedido: TSpeedButton;
    SBClearNomeCliente: TSpeedButton;
    PDados: TPanel;
    DBGView: TDBGrid;
    ClientesMemTable: TFDMemTable;
    DBENF: TDBEdit;
    LNomeFant: TLabel;
    LEnd: TLabel;
    DBEEnd: TDBEdit;
    LBairro: TLabel;
    DBEBairro: TDBEdit;
    LLong: TLabel;
    DBELong: TDBEdit;
    LLati: TLabel;
    DBELati: TDBEdit;
    LCIBGE: TLabel;
    DBECIBGE: TDBEdit;
    LNum: TLabel;
    DBENum: TDBEdit;
    LSituacao: TLabel;
    DBESituacao: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBSairClick(Sender: TObject);
    procedure BBIncluirClick(Sender: TObject);
    procedure DBGViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGViewDblClick(Sender: TObject);
    procedure BBExcluirClick(Sender: TObject);
    procedure BBAtualizarClick(Sender: TObject);
    procedure BBAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PMAtualizarItensdoPedidoClick(Sender: TObject);
    procedure SBClearPedidoClick(Sender: TObject);
    procedure SBClearNomeClienteClick(Sender: TObject);
  private
    { Private declarations }
    FClienteController: TClienteController;

    procedure TratarDelete;
    procedure pCRUD(pAcao: TAcao);
    procedure pAtualizacao;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  end;

var
  FViewClientes: TFViewClientes;

implementation

{$R *.dfm}

uses View.Dados.Clientes, Utils.DMUtils;

constructor TFViewClientes.Create(AOwner: TComponent);
begin
  inherited;
  FClienteController := TClienteController.Create;
end;

destructor TFViewClientes.Destroy;
begin
  FClienteController.Free;
  inherited;
end;

procedure TFViewClientes.FormShow(Sender: TObject);
begin
  pAtualizacao;
end;

procedure TFViewClientes.BBIncluirClick(Sender: TObject);
begin
  pCRUD(acIncluir);
end;

procedure TFViewClientes.BBAlterarClick(Sender: TObject);
begin
  pCRUD(acAlterar);
end;

procedure TFViewClientes.DBGViewDblClick(Sender: TObject);
begin
  BBAlterar.Click;
end;

procedure TFViewClientes.BBExcluirClick(Sender: TObject);
begin
  TratarDelete;
end;

procedure TFViewClientes.BBAtualizarClick(Sender: TObject);
begin
  pAtualizacao;
end;

procedure TFViewClientes.DBGViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Verifica se a tecla DELETE foi pressionada
  if Key = VK_DELETE then
  begin
    TratarDelete;
    Key := 0; // Evita que o DBGrid processe o DELETE automaticamente
  end
  else if key = VK_RETURN then
    pCRUD(acAlterar);
end;

procedure TFViewClientes.PMAtualizarItensdoPedidoClick(Sender: TObject);
begin
  pAtualizacao;
end;

procedure TFViewClientes.pCRUD(pAcao: TAcao);
{
var
  FormPedido: TFDadosPedidos;}
begin
  if (DSViewClientes.DataSet.FieldByName('CodigoClientes').IsNull) and
     (pAcao <> acIncluir) then
  begin
    Beep;
    ShowMessage('Selecione um registro v�lido '+cEOL+'para efetuar opera��o desejada!');
    Exit;
  end;

  if (pAcao = acExcluir) then
  begin
  {
    if FClienteController.ExcluirCliente(
       DSViewClientes.DataSet.FieldByName('NumeroPedidos').AsInteger) then
      ShowMessage('Pedido exclu�do com sucesso!')
    else
      ShowMessage('Erro ao excluir pedido.');}
  end
  else
  begin
    {
    FormPedido := TFDadosPedidos.Create(Application);
    if (pAcao = acIncluir) then
    begin
      FormPedido.Caption := FormPedido.Caption + '-' + cAcaoIncluir;
      FormPedido.LENumeroPedido.Clear;
      FormPedido.DTPDataEmissao.DateTime := Now;
    end
    else
    begin
      FormPedido.Caption := FormPedido.Caption + '-' + cAcaoAlterar;
      FormPedido.LENumeroPedido.Text := DSViewPedidos.DataSet.FieldByName('NumeroPedidos').AsString;
      FormPedido.DTPDataEmissao.DateTime := DSViewPedidos.DataSet.FieldByName('DataEmissaoPedidos').AsDateTime;
      FormPedido.LECodigoCliente.Text := DSViewPedidos.DataSet.FieldByName('ClientePedidos').AsString;
      FormPedido.EDescCliente.Text := DSViewPedidos.DataSet.FieldByName('NomeClientes').AsString;
      FormPedido.LETotalPedido.Text := DSViewPedidos.DataSet.FieldByName('ValorTotalPedidos').AsString;
    end;
    FormPedido.ShowModal;
    }
  end;
  pAtualizacao;
end;

procedure TFViewClientes.TratarDelete;
begin
  // Exibe uma mensagem de confirma��o antes de deletar o registro
  if MessageDlg('Deseja realmente Cancelar(Exclu�ndo) este Cliente '+
     DSViewClientes.DataSet.FieldByName('CodigoClientes').AsString+'?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    pCRUD(acExcluir);
end;

procedure TFViewClientes.pAtualizacao;
begin
  FClienteController.CarregarDadosClientes(ClientesMemTable,
    LEFiltroCodigoCliente.Text,
    LEFiltroNomeCliente.Text);
end;

procedure TFViewClientes.SBClearNomeClienteClick(Sender: TObject);
begin
  LEFiltroNomeCliente.Clear;
end;

procedure TFViewClientes.SBClearPedidoClick(Sender: TObject);
begin
  LEFiltroCodigoCliente.Clear;
end;

procedure TFViewClientes.BBSairClick(Sender: TObject);
begin
  DSViewClientes.DataSet.Close;
  Close;
end;

procedure TFViewClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

end.
