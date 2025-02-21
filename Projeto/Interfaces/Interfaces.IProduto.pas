unit Interfaces.IProduto;

interface

uses
  System.SysUtils, FireDAC.Comp.Client;

type
  IProduto = interface
    ['{4F628195-07EE-4CC8-8952-6AE0B4190C30}']
    function GetCodigoProdutos: Integer;
    function GetDescricaoProdutos: string;
    function GetPrecoVendaProdutos: Double;
    procedure SetCodigoProdutos(const Value: Integer);
    procedure SetDescricaoProdutos(const Value: string);
    procedure SetPrecoVendaProdutos(const Value: Double);

    property CodigoProdutos: Integer read GetCodigoProdutos write SetCodigoProdutos;
    property DescricaoProdutos: string read GetDescricaoProdutos write SetDescricaoProdutos;
    property PrecoVendaProdutos: Double read GetPrecoVendaProdutos write SetPrecoVendaProdutos;

    procedure CarregarDados(const AFDMemTable: TFDMemTable; pDescricaoProduto: String); // Método para carregar dados
    function CarregarNomePorId(pId: String): String;
    function CarregarPricePorId(pId: String): Double;
  end;

implementation

end.
