unit Controller.ItemPedidoController;

interface

uses
  Interfaces.IItemPedido, Model.ItemPedido, FireDAC.Comp.Client;

type
  TItemPedidoController = class
  private
    FItemPedido: IItemPedido;
  public
    constructor Create;
    destructor Destroy; override;

    function GetItemPedido: IItemPedido;
    function SalvarItemPedido(AItemPedido: IItemPedido): Boolean;
    function ExcluirItemPedido(const AId: Integer): Boolean;
    function CalcularTotalItens(const AIdPedido: Integer): Double;
    function GerarRelatorioHTML(const pDtIni, pDtFin: TDate): string;
    function GerarGraficoHTML(const FileName: string): String;
    function GerarGraficoPizzaHTML(const FileName: string): String;

    procedure CarregarDadosItensPedido(const AFDMemTable: TFDMemTable; pPedido: String);
    procedure MaisVendido(const AFDMemTable: TFDMemTable); // M�todo Mais Vendido dos Pedidos.
 end;

implementation

{ TItemPedidoController }

uses CXConst;

constructor TItemPedidoController.Create;
begin
  FItemPedido := TItemPedido.Create;
end;

destructor TItemPedidoController.Destroy;
begin
  FItemPedido := nil;
  inherited;
end;

function TItemPedidoController.GerarGraficoHTML(const FileName: string): String;
begin
  result := FItemPedido.GerarGraficoHTML('');
end;

function TItemPedidoController.GerarGraficoPizzaHTML(
  const FileName: string): String;
begin
  result := FItemPedido.GerarGraficoPizzaHTML('');
end;

function TItemPedidoController.GerarRelatorioHTML(const pDtIni, pDtFin: TDate): string;
begin
  result := FItemPedido.GerarRelatorioHTML(pDtIni, pDtFin);
end;

function TItemPedidoController.GetItemPedido: IItemPedido;
begin
  Result := FItemPedido;
end;

procedure TItemPedidoController.MaisVendido(const AFDMemTable: TFDMemTable);
begin
  FItemPedido.MaisVendido(AFDMemTable);
end;

function TItemPedidoController.CalcularTotalItens(const AIdPedido: Integer): Double;
begin
  Result := FItemPedido.CalcularTotalItens(AIdPedido);
end;

function TItemPedidoController.SalvarItemPedido(AItemPedido: IItemPedido): Boolean;
begin
  if AItemPedido.Produto = cZero then
    Result := false
  else
    Result := AItemPedido.Salvar;
end;

procedure TItemPedidoController.CarregarDadosItensPedido(const AFDMemTable: TFDMemTable; pPedido: String);
begin
  FItemPedido.CarregarDados(AFDMemTable, pPedido);
end;

function TItemPedidoController.ExcluirItemPedido(const AId: Integer): Boolean;
begin
  Result := FItemPedido.Excluir(AId);
end;

end.

