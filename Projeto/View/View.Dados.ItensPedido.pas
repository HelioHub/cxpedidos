unit View.Dados.ItensPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Controller.ItemPedidoController, Interfaces.IItemPedido,
  Controller.ProdutoController, Interfaces.Visitor, Vcl.Imaging.pngimage;

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
    lblTipoVenda: TLabel;
    cbTipoVenda: TComboBox;
    Label1: TLabel;
    cbFormaPgto: TComboBox;
    ITipoCliente: TImage;
    LEPrecoSugerido: TLabeledEdit;
    procedure BBSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBF2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LEQtdKeyPress(Sender: TObject; var Key: Char);
    procedure LEQtdExit(Sender: TObject);
    procedure BBGravarClick(Sender: TObject);
    procedure LEPrecoChange(Sender: TObject);
    procedure LECodigoProdutoExit(Sender: TObject);
    procedure cbTipoVendaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FItemPedidoController: TItemPedidoController;
    FProdutoController: TProdutoController;
    FItemPrecoVenda : iItem;

    procedure OnlyNumber(var Key: char; ETextEdit: String);
    procedure MaskEdit(var LEAmount, LEPrice, LEValue, LEValueSug: TLabeledEdit);
    procedure TakePoint(var LEdit: TLabeledEdit);
    procedure ConsultProduct;
    procedure DefinePriceFinal;

    function PrecoTipoVenda : iVisitor;
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

uses View.Consulta.Produtos, CXConst,
     Model.Item, Model.Item.RegraAtacado, Model.Item.RegraVarejo;

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
  try
    if FConsultaProdutos.ShowModal = mrOK then
    begin
      LECodigoProduto.Text := FConsultaProdutos.DSConslutaProduto.DataSet.FieldByName('CodigoProdutos').AsString;
      LEDescricao.Text := FConsultaProdutos.DSConslutaProduto.DataSet.FieldByName('DescricaoProdutos').AsString;
      pPrice := FConsultaProdutos.DSConslutaProduto.DataSet.FieldByName('PrecoVendaProdutos').AsFloat;
    end;
  finally
    FConsultaProdutos.Free;
    LEPreco.Text := FormatFloat('###,##0.00',pPrice);
    LEQtd.SetFocus;
  end;
end;

procedure TFDadosItensPedido.BBGravarClick(Sender: TObject);
var
  ItensPedido: IItemPedido;
begin
  TakePoint(LEQtd);
  if StrToFloatDef(LEQtd.Text, 0) = cZero then
  begin
    beep;
    ShowMessage('Aten��o!!'+ cEOL +
                'Falta informar a Quantidade.');
  end
  else
  begin
    ItensPedido := FItemPedidoController.GetItemPedido;
    MaskEdit(LEQtd, LEPreco, LEValor, LEPrecoSugerido);
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
      ShowMessage('Sucesso na Grava��o do Item '+LECodigoProduto.Text+'.')
    else
      ShowMessage('Sem Sucesso na Grava��o do Item '+LECodigoProduto.Text+'.'+cEOL+
        'Falta informar o C�digo do Produto');
  end;
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
  MaskEdit(LEQtd, LEPreco, LEValor, LEPrecoSugerido);
end;

procedure TFDadosItensPedido.LECodigoProdutoExit(Sender: TObject);
var
  dPriceVenda : Double;
begin
  if LECodigoProduto.Text <> EmptyStr then
  begin
    LEDescricao.Text := FProdutoController.CarregarNomePorId(LECodigoProduto.Text);
    dPriceVenda := FProdutoController.
                    CarregarPricePorId(LECodigoProduto.Text);
    LEPreco.Text := FormatFloat('###,##0.00', dPriceVenda);
    LEPrecoSugerido.Text := FormatFloat('###,##0.00', dPriceVenda);
    MaskEdit(LEQtd, LEPreco, LEValor, LEPrecoSugerido);
  end;
end;

procedure TFDadosItensPedido.LEPrecoChange(Sender: TObject);
begin
  MaskEdit(LEQtd, LEPreco, LEValor, LEPrecoSugerido);
end;

procedure TFDadosItensPedido.LEQtdKeyPress(Sender: TObject; var Key: Char);
var
  edText : String;
begin
  edText := (Sender as TLabeledEdit).Text;
  OnlyNumber(Key, edText);
end;

procedure TFDadosItensPedido.MaskEdit(var LEAmount, LEPrice, LEValue, LEValueSug: TLabeledEdit);
var
  dAmount, dPrice, dPriceSug : Double;
begin
  DefinePriceFinal;

  TakePoint(LEAmount);
  TakePoint(LEPrice);
  TakePoint(LEValueSug);

  dAmount := StrToFloatDef(LEAmount.Text,0);
  dPrice := StrToFloatDef(LEPreco.Text,0);
  dPriceSug := StrToFloatDef(LEPrecoSugerido.Text,0);
  LEAmount.Text := FormatFloat('###,##0.00',dAmount);
  LEPrice.Text := FormatFloat('###,##0.00',dPrice);
  LEValue.Text := FormatFloat('###,##0.00',dAmount*dPrice);
  LEValueSug.Text := FormatFloat('###,##0.00',dPriceSug);
end;

procedure TFDadosItensPedido.OnlyNumber(var Key: char; ETextEdit: String);
begin
  // Permite apenas n�meros (0-9), decimal (,) e teclas de controle (Backspace, Delete, etc.)
  if not CharInSet(Key, ['0'..'9', ',', #8, #46]) then
  begin
    Key := #0;
    Exit;
  end;

  // Verifica se j� existe um decimal no texto
  if (Key = ',') and (Pos(',', ETextEdit) > 0) then
  begin
    Key := #0;
    Exit;
  end;
end;

function TFDadosItensPedido.PrecoTipoVenda: iVisitor;
begin
  case cbTipoVenda.ItemIndex of
    0: Result := TModelItemRegraVarejo.New.Visitor;
    1: Result := TModelItemRegraAtacado.New.Visitor;
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

procedure TFDadosItensPedido.cbTipoVendaExit(Sender: TObject);
begin
  MaskEdit(LEQtd, LEPreco, LEValor, LEPrecoSugerido);
end;

procedure TFDadosItensPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Close;
end;

procedure TFDadosItensPedido.FormCreate(Sender: TObject);
begin
  FItemPrecoVenda := TModelItem.New;
end;

procedure TFDadosItensPedido.DefinePriceFinal;
begin
  case cbFormaPgto.ItemIndex of
    0: begin
      LEPreco.Text := FormatFloat(
                        '#,##0.00',
                        FItemPrecoVenda
                          .SetPrecoUnitario(FProdutoController.
                                              CarregarPricePorId(LECodigoProduto.Text))
                          .Regras
                          .Accept(PrecoTipoVenda)
                          .PrecoAVista
                      );
    end;
    1: begin
      LEPreco.Text := FormatFloat(
                        '#,##0.00',
                        FItemPrecoVenda
                          .SetPrecoUnitario(FProdutoController.
                                              CarregarPricePorId(LECodigoProduto.Text))
                          .Regras
                          .Accept(PrecoTipoVenda)
                          .PrecoAPrazo
                      );
    end;
  end;
end;

end.
