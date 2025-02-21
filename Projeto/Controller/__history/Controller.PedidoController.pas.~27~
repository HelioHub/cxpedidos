unit Controller.PedidoController;

interface

uses
  Interfaces.IPedido, Model.Pedido, FireDAC.Comp.Client;

type
  TPedidoController = class
  private
    FPedido: IPedido;
  public
    constructor Create;
    destructor Destroy; override;

    function GetPedido: IPedido;
    function SalvarPedido(APedido: IPedido) : Boolean;
    function ExcluirPedido(const AId: Integer): Boolean;
    procedure CarregarDadosPedidos(const AFDMemTable: TFDMemTable;
      pNumeroPedido, pNomeCliente, pLimite: String;
      pDtIni, pDtFin : TDate);
  end;

implementation

{ TPedidoController }

uses WKConst;

constructor TPedidoController.Create;
begin
  FPedido := TPedido.Create;
end;

destructor TPedidoController.Destroy;
begin
  FPedido := nil;
  inherited;
end;

function TPedidoController.GetPedido: IPedido;
begin
  Result := FPedido;
end;

function TPedidoController.SalvarPedido(APedido: IPedido) : Boolean;
begin
  if APedido.Cliente = cZero then
    result := false
  else
    result := APedido.Salvar;
end;

procedure TPedidoController.CarregarDadosPedidos(
  const AFDMemTable: TFDMemTable;
  pNumeroPedido, pNomeCliente, pLimite: String;
  pDtIni, pDtFin : TDate);
begin
  FPedido.CarregarDados(AFDMemTable, pNumeroPedido, pNomeCliente, pLimite, pDtIni, pDtFin);
end;

function TPedidoController.ExcluirPedido(const AId: Integer): Boolean;
begin
  Result := FPedido.Excluir(AId);
end;

end.
