unit UConsultaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Controller.ProdutoController,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf;

type
  TFConsultaProdutos = class(TForm)
    PRodape: TPanel;
    PDados: TPanel;
    BBSair: TBitBtn;
    BBSelecionar: TBitBtn;
    PHead: TPanel;
    LEFiltroDescricaoItem: TLabeledEdit;
    BBFiltrar: TBitBtn;
    DBGView: TDBGrid;
    DSConslutaProduto: TDataSource;
    FDMemTableProduto: TFDMemTable;
    FDMemTableProdutoCodigoProdutos: TIntegerField;
    FDMemTableProdutoDescricaoProdutos: TStringField;
    FDMemTableProdutoPrecoVendaProdutos: TBCDField;
    procedure BBSairClick(Sender: TObject);
    procedure DBGViewDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FProdutoController: TProdutoController;

    procedure pAtualizacao;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FConsultaProdutos: TFConsultaProdutos;

implementation

{$R *.dfm}

constructor TFConsultaProdutos.Create(AOwner: TComponent);
begin
  inherited;
  FProdutoController := TProdutoController.Create;
end;

destructor TFConsultaProdutos.Destroy;
begin
  FProdutoController.Free;
  inherited;
end;

procedure TFConsultaProdutos.DBGViewDblClick(Sender: TObject);
begin
  BBSelecionar.Click;
end;

procedure TFConsultaProdutos.BBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFConsultaProdutos.FormShow(Sender: TObject);
begin
  pAtualizacao;
end;

procedure TFConsultaProdutos.pAtualizacao;
begin
 // Carrega os dados no TFDMemTable
 FProdutoController.CarregarDadosProdutos(
  FDMemTableProduto,
  LEFiltroDescricaoItem.Text
  );
end;

end.
