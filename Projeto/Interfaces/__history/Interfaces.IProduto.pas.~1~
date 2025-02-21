unit Interfaces.IProduto;

interface

uses
  System.SysUtils, FireDAC.Comp.Client;

type
  IProduto = interface
    ['{988AC819-E11B-45C4-AC61-6D1C95F3B2F9}']
    function GetCodigoProdutos: Integer;
    function GetDescricaoProdutos: string;
    function GetPrecoVendaProdutos: Double;
    procedure SetCodigoProdutos(const Value: Integer);
    procedure SetDescricaoProdutos(const Value: string);
    procedure SetPrecoVendaProdutos(const Value: Double);

    property CodigoProdutos: Integer read GetCodigoProdutos write SetCodigoProdutos;
    property DescricaoProdutos: string read GetDescricaoProdutos write SetDescricaoProdutos;
    property PrecoVendaProdutos: Double read GetPrecoVendaProdutos write SetPrecoVendaProdutos;

    procedure CarregarDados(const AFDMemTable: TFDMemTable); // Método para carregar dados
  end;

implementation

end.
