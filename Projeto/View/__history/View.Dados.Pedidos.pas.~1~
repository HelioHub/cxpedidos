unit View.Dados.Pedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ComCtrls, System.UITypes,
  Controller.PedidoController, Interfaces.IPedido,
  Controller.ItemPedidoController,
  Controller.ClienteController,
  WKConst, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFDadosPedidos = class(TForm)
    PRodape: TPanel;
    PDados: TPanel;
    BBSair: TBitBtn;
    BBGravar: TBitBtn;
    PItensPedido: TPanel;
    POpcoes: TPanel;
    PView: TPanel;
    DBGView: TDBGrid;
    LENumeroPedido: TLabeledEdit;
    DTPDataEmissao: TDateTimePicker;
    LDT: TLabel;
    LECodigoCliente: TLabeledEdit;
    EDescCliente: TEdit;
    LT: TLabel;
    SBF2: TSpeedButton;
    BBInc: TBitBtn;
    BBAlt: TBitBtn;
    BBExc: TBitBtn;
    LETotalPedido: TLabeledEdit;
    DSDadosItensPedido: TDataSource;
    ItensPedidoMemTable: TFDMemTable;
    ItensPedidoMemTableidItensPedido: TIntegerField;
    ItensPedidoMemTablePedidoItensPedido: TIntegerField;
    ItensPedidoMemTableProdutoItensPedido: TIntegerField;
    ItensPedidoMemTableQuantidadeItensPedido: TBCDField;
    ItensPedidoMemTableVlrUnitarioItensPedido: TBCDField;
    ItensPedidoMemTableVlrTotalItensPedido: TBCDField;
    ItensPedidoMemTableDescricaoProdutos: TStringField;
    procedure BBSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBF2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BBIncClick(Sender: TObject);
    procedure DBGViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGViewDblClick(Sender: TObject);
    procedure BBExcClick(Sender: TObject);
    procedure BBGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBAltClick(Sender: TObject);
    procedure LECodigoClienteExit(Sender: TObject);
  private
    { Private declarations }
    FPedidoController: TPedidoController;
    FItemPedidoController: TItemPedidoController;
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
  FDadosPedidos: TFDadosPedidos;

implementation

{$R *.dfm}

uses View.Consulta.Clientes, View.Dados.ItensPedido;

constructor TFDadosPedidos.Create(AOwner: TComponent);
begin
  inherited;
  FPedidoController := TPedidoController.Create;
  FItemPedidoController := TItemPedidoController.Create;
  FClienteController := TClienteController.Create;
end;

destructor TFDadosPedidos.Destroy;
begin
  FPedidoController.Free;
  FItemPedidoController.Free;
  FClienteController.Free;
  inherited;
end;

procedure TFDadosPedidos.FormShow(Sender: TObject);
begin
  pAtualizacao;
end;

procedure TFDadosPedidos.LECodigoClienteExit(Sender: TObject);
begin
  if LECodigoCliente.Text <> EmptyStr  then
    EDescCliente.Text := FClienteController.CarregarNomePorId(LECodigoCliente.Text);
end;

procedure TFDadosPedidos.BBIncClick(Sender: TObject);
begin
  pCRUD(acIncluir);
end;

procedure TFDadosPedidos.BBAltClick(Sender: TObject);
begin
  pCRUD(acAlterar);
end;

procedure TFDadosPedidos.DBGViewDblClick(Sender: TObject);
begin
  pCRUD(acAlterar);
end;

procedure TFDadosPedidos.BBExcClick(Sender: TObject);
begin
  TratarDelete;
end;

procedure TFDadosPedidos.DBGViewKeyDown(Sender: TObject; var Key: Word;
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

procedure TFDadosPedidos.BBGravarClick(Sender: TObject);
var
  Pedido: IPedido;
begin
  Pedido := FPedidoController.GetPedido;

  // Preenche os dados do pedido
  Pedido.NumeroPedido := StrToIntDef(LENumeroPedido.Text, 0);
  Pedido.DataEmissao := DTPDataEmissao.DateTime;
  Pedido.Cliente := StrToIntDef(LECodigoCliente.Text, 0);
  Pedido.ValorTotal := StrToFloatDef(LETotalPedido.Text, 0);

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

procedure TFDadosPedidos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F2 then
    SBF2.Click;
end;

procedure TFDadosPedidos.pAtualizacao;
begin
  if LENumeroPedido.Text = EmptyStr then
  begin
    BBInc.Enabled := False;
    BBAlt.Enabled := False;
    BBExc.Enabled := False;
  end
  else
  begin
    FItemPedidoController.CarregarDadosItensPedido(ItensPedidoMemTable,
      LENumeroPedido.Text);
    BBInc.Enabled := True;
    BBAlt.Enabled := True;
    BBExc.Enabled := True;
  end;
  LETotalPedido.Text := FormatFloat('###,##0.00',
    FItemPedidoController.CalcularTotalItens(StrToIntDef(LENumeroPedido.Text, 0)));
end;

procedure TFDadosPedidos.pCRUD(pAcao: TAcao);
var
  FormItensPedido: TFDadosItensPedido;
begin
  if (DSDadosItensPedido.DataSet.FieldByName('ProdutoItensPedido').IsNull) and
     (pAcao <> acIncluir) then
  begin
    Beep;
    ShowMessage('Selecione um registro válido '+cEOL+'para efetuar operação desejada!');
    Exit;
  end;

  if (pAcao = acExcluir) then
  begin
    if FItemPedidoController.ExcluirItemPedido(
       DSDadosItensPedido.DataSet.FieldByName('idItensPedido').AsInteger) then
      ShowMessage('Item do Pedido excluído com sucesso!')
    else
      ShowMessage('Erro ao excluir Item do Pedido.');
  end
  else
  begin
    FormItensPedido := TFDadosItensPedido.Create(Application);
    FormItensPedido.pNumeroPedido := StrToIntDef(LENumeroPedido.Text, 0);
    if (pAcao = acIncluir) then
    begin
      FormItensPedido.Caption := FormItensPedido.Caption + '-' + cAcaoIncluir;
      FormItensPedido.LEIdItemProduto.Clear;
    end
    else
    begin
      FormItensPedido.Caption := FormItensPedido.Caption + '-' + cAcaoAlterar;
      FormItensPedido.LEIdItemProduto.Text := DSDadosItensPedido.DataSet.FieldByName('IdItensPedido').AsString;
      FormItensPedido.LECodigoProduto.Text := DSDadosItensPedido.DataSet.FieldByName('ProdutoItensPedido').AsString;
      FormItensPedido.LEDescricao.Text := DSDadosItensPedido.DataSet.FieldByName('DescricaoProdutos').AsString;
      FormItensPedido.LEQtd.Text := DSDadosItensPedido.DataSet.FieldByName('QuantidadeItensPedido').AsString;
      FormItensPedido.LEPreco.Text := DSDadosItensPedido.DataSet.FieldByName('VlrUnitarioItensPedido').AsString;
      FormItensPedido.LEValor.Text := DSDadosItensPedido.DataSet.FieldByName('VlrTotalItensPedido').AsString;
    end;
    FormItensPedido.ShowModal;
  end;
  pAtualizacao;
end;

procedure TFDadosPedidos.SBF2Click(Sender: TObject);
begin
  FConsultaClientes := TFConsultaClientes.Create(Application);
  if FConsultaClientes.ShowModal = mrOK then
  begin
    LECodigoCliente.Text := FConsultaClientes.
      DSConslutaCliente.
        DataSet.FieldByName('CodigoClientes').AsString;
    EDescCliente.Text := FConsultaClientes.
      DSConslutaCliente.
        DataSet.FieldByName('NomeClientes').AsString;
  end;
  FConsultaClientes.Free;
end;

procedure TFDadosPedidos.TratarDelete;
begin
  // Exibe uma mensagem de confirmação antes de deletar o registro

  if MessageDlg('Deseja realmente excluir este Item: '+
    DSDadosItensPedido.DataSet.FieldByName('ProdutoItensPedido').AsString+' '+
     'Id '+DSDadosItensPedido.DataSet.FieldByName('IdItensPedido').AsString+'?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    pCRUD(acExcluir);
end;

procedure TFDadosPedidos.BBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFDadosPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

end.
