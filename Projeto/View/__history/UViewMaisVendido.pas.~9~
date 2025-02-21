unit UViewMaisVendido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Controller.ItemPedidoController, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls;

type
  TFViewMaisVendido = class(TForm)
    DBGView: TDBGrid;
    DSItensPedido: TDataSource;
    ItensMemTable: TFDMemTable;
    ItensMemTableCodigoProdutos: TIntegerField;
    ItensMemTableDescricaoProdutos: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ItensMemTableTotalVendido: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FItemPedidoController: TItemPedidoController;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FViewMaisVendido: TFViewMaisVendido;

implementation

{$R *.dfm}

constructor TFViewMaisVendido.Create(AOwner: TComponent);
begin
  inherited;
  FItemPedidoController := TItemPedidoController.Create;
end;

destructor TFViewMaisVendido.Destroy;
begin
  FItemPedidoController.Free;
  inherited;
end;

procedure TFViewMaisVendido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFViewMaisVendido.FormShow(Sender: TObject);
begin
  FItemPedidoController.MaisVendido(ItensMemTable);
end;

end.
