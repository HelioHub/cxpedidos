unit Interfaces.IPedido;

interface

uses
  System.SysUtils;

type
  IPedido = interface
    ['{AFAD63DE-268C-498F-94C6-AF6CFBD5A400}']
    function GetNumeroPedido: Integer;
    function GetDataEmissao: TDateTime;
    function GetCliente: Integer;
    function GetValorTotal: Double;

    procedure SetNumeroPedido(const Value: Integer);
    procedure SetDataEmissao(const Value: TDateTime);
    procedure SetCliente(const Value: Integer);
    procedure SetValorTotal(const Value: Double);

    property NumeroPedido: Integer read GetNumeroPedido write SetNumeroPedido;
    property DataEmissao: TDateTime read GetDataEmissao write SetDataEmissao;
    property Cliente: Integer read GetCliente write SetCliente;
    property ValorTotal: Double read GetValorTotal write SetValorTotal;

    function Salvar: Boolean; // Método para salvar o pedido
  end;

implementation

end.
