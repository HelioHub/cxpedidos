unit UDadosItensPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Controller.ItemPedidoController, Interfaces.IItemPedido,
  Controller.ProdutoController;

type
  TFDadosItensPedido = class(TForm)
    PRodape: TPanel;
    PDados: TPanel;
    BBSair: TBitBtn;
    BBGravar: TBitBtn;
    LECodigoProduto: TLabeledEdit;
    LEDescricao: TLabeledEdit;
    SBF2: TSpeedButton;
    LEQtd: TLabeledEdit;
    LEPreco: TLabeledEdit;
    LEValor: TLabeledEdit;
    LEIdItemProduto: TLabeledEdit;
    procedure BBSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBF2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LEQtdKeyPress(Sender: TObject; var Key: Char);
    procedure LEQtdExit(Sender: TObject);
    procedure BBGravarClick(Sender: TObject);
    procedure LEPrecoChange(Sender: TObject);
    procedure LECodigoProdutoExit(Sender: TObject);
  private
    { Private declarations }
    FItemPedidoController: TItemPedidoController;
    FProdutoController: TProdutoController;

    procedure OnlyNumber(var Key: char; ETextEdit: String);
    procedure MaskEdit(var LEAmount, LEPrice, LEValue: TLabeledEdit);
    procedure TakePoint(var LEdit: TLabeledEdit);
    procedure ConsultProduct;
  public
    { Public declarations }
     pNumeroPedido : Integer;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
   end;

var
  FDadosItensPedido: TFDadosItensPedido;

implementation

{$R *.dfm}

uses UConsultaProdutos, WKConst;

constructor TFDadosItensPedido.Create(AOwner: TComponent);
begin
  inherited;
  FItemPedidoController := TItemPedidoController.Create;
  FProdutoController    := TProdutoController.Create;
end;

destructor TFDadosItensPedido.Destroy;
begin
  FItemPedidoController.Free;
  FProdutoController.Free;
  inherited;
end;

procedure TFDadosItensPedido.ConsultProduct;
var
  pPrice : Double;
begin
  pPrice := 0;
  FConsultaProdutos := TFConsultaProdutos.Create(Application);
  if FConsultaProdutos.ShowModal = mrOK then
  begin
    LECodigoProduto.Text := FConsultaProdutos.DSConslutaProduto.DataSet.FieldByName('CodigoProdutos').AsString;
    LEDescricao.Text := FConsultaProdutos.DSConslutaProduto.DataSet.FieldByName('DescricaoProdutos').AsString;
    pPrice := FConsultaProdutos.DSConslutaProduto.DataSet.FieldByName('PrecoVendaProdutos').AsFloat;
  end;
  FConsultaProdutos.Free;
  LEPreco.Text := FormatFloat('###,##0.00',pPrice);
end;

procedure TFDadosItensPedido.BBGravarClick(Sender: TObject);
var
  ItensPedido: IItemPedido;
begin
  ItensPedido := FItemPedidoController.GetItemPedido;
  MaskEdit(LEQtd, LEPreco, LEValor);
  TakePoint(LEQtd);
  TakePoint(LEPreco);
  TakePoint(LEValor);

  // Preenche os dados do Item do Pedido
  ItensPedido.IdItemPedido := StrToIntDef(LEIdItemProduto.Text, 0);;
  ItensPedido.Pedido := pNumeroPedido;
  ItensPedido.Produto := StrToIntDef(LECodigoProduto.Text, 0);
  ItensPedido.Quantidade := StrToFloatDef(LEQtd.Text, 0);
  ItensPedido.ValorUnitario := StrToFloatDef(LEPreco.Text, 0);
  ItensPedido.ValorTotal := StrToFloatDef(LEValor.Text, 0);

  // Salva o pedido
  if FItemPedidoController.SalvarItemPedido(ItensPedido) then
    // Atualiza o campo NumeroPedido com o ID gerado
    ShowMessage('Sucesso na Gravação do Item '+LECodigoProduto.Text+'.')
  else
    ShowMessage('Sem Sucesso na Gravação do Item '+LECodigoProduto.Text+'.'+cEOL+
      'Falta informar o Código do Produto');
end;

procedure TFDadosItensPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F2 then
    ConsultProduct;
end;

procedure TFDadosItensPedido.SBF2Click(Sender: TObject);
begin
  ConsultProduct;
end;

procedure TFDadosItensPedido.LEQtdExit(Sender: TObject);
begin
  MaskEdit(LEQtd, LEPreco, LEValor);
end;

procedure TFDadosItensPedido.LECodigoProdutoExit(Sender: TObject);
begin
  if LECodigoProduto.Text <> EmptyStr then
  begin
    LEDescricao.Text := FProdutoController.CarregarNomePorId(LECodigoProduto.Text);
    LEPreco.Text := FormatFloat('###,##0.00',FProdutoController.CarregarPricePorId((LECodigoProduto.Text)));
  end;
end;

procedure TFDadosItensPedido.LEPrecoChange(Sender: TObject);
begin
  MaskEdit(LEQtd, LEPreco, LEValor);
end;

procedure TFDadosItensPedido.LEQtdKeyPress(Sender: TObject; var Key: Char);
var
  edText : String;
begin
  edText := (Sender as TLabeledEdit).Text;
  OnlyNumber(Key, edText);
end;

procedure TFDadosItensPedido.MaskEdit(var LEAmount, LEPrice, LEValue: TLabeledEdit);
var
  dAmount, dPrice : Double;
begin
  TakePoint(LEAmount);
  TakePoint(LEPreco);

  dAmount := StrToFloatDef(LEAmount.Text,0);
  dPrice := StrToFloatDef(LEPreco.Text,0);
  LEAmount.Text := FormatFloat('###,##0.00',dAmount);
  LEPrice.Text := FormatFloat('###,##0.00',dPrice);
  LEValue.Text := FormatFloat('###,##0.00',dAmount*dPrice);
end;

procedure TFDadosItensPedido.OnlyNumber(var Key: char; ETextEdit: String);
begin
  // Permite apenas números (0-9), decimal (,) e teclas de controle (Backspace, Delete, etc.)
  if not CharInSet(Key, ['0'..'9', ',', #8, #46]) then
  begin
    Key := #0;
    Exit;
  end;

  // Verifica se já existe um decimal no texto
  if (Key = ',') and (Pos(',', ETextEdit) > 0) then
  begin
    Key := #0;
    Exit;
  end;
end;

procedure TFDadosItensPedido.TakePoint(var LEdit: TLabeledEdit);
begin
  LEdit.Text := StringReplace(LEdit.Text, '.', '', [rfReplaceAll, rfIgnoreCase]);
end;

procedure TFDadosItensPedido.BBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFDadosItensPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

end.
