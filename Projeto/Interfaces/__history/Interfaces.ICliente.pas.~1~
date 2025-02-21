unit Interfaces.ICliente;

interface

uses
  System.SysUtils, FireDAC.Comp.Client;

type
  ICliente = interface
    ['{F7ADFF64-2DA5-4276-9D15-851AC7214388}']
    function GetCodigoClientes: Integer;
    function GetNomeClientes: string;
    function GetCidadeClientes: string;
    function GetUFClientes: string;
    procedure SetCodigoClientes(const Value: Integer);
    procedure SetNomeClientes(const Value: string);
    procedure SetCidadeClientes(const Value: string);
    procedure SetUFClientes(const Value: string);

    property CodigoClientes: Integer read GetCodigoClientes write SetCodigoClientes;
    property NomeClientes: string read GetNomeClientes write SetNomeClientes;
    property CidadeClientes: string read GetCidadeClientes write SetCidadeClientes;
    property UFClientes: string read GetUFClientes write SetUFClientes;

    procedure CarregarDados(const AFDMemTable: TFDMemTable); // Método para carregar dados
  end;

implementation

end.
