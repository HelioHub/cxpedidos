unit Interfaces.ICliente;

interface

uses
  System.SysUtils, FireDAC.Comp.Client;

type
  ICliente = interface
    ['{F7ADFF64-2DA5-4276-9D15-851AC7214388}']
    function GetCodigoClientes: Integer;
    procedure SetCodigoClientes(const Value: Integer);

    function GetCNPJClientes: string;
    procedure SetCNPJClientes(const Value: string);

    function GetNomeClientes: string;
    procedure SetNomeClientes(const Value: string);

    function GetCEPClientes: string;
    procedure SetCEPClientes(const Value: string);

    function GetRuaClientes: string;
    procedure SetRuaClientes(const Value: string);

    function GetBairroClientes: string;
    procedure SetBairroClientes(const Value: string);

    function GetCidadeClientes: string;
    procedure SetCidadeClientes(const Value: string);

    function GetUFClientes: string;
    procedure SetUFClientes(const Value: string);

    function GetLongitudeClientes: Double;
    procedure SetLongitudeClientes(const Value: Double);

    function GetLatitudeClientes: Double;
    procedure SetLatitudeClientes(const Value: Double);

    function GetCodIBGEClientes: string;
    procedure SetCodIBGEClientes(const Value: string);

    function GetNomeFantasiaClientes: string;
    procedure SetNomeFantasiaClientes(const Value: string);

    function GetSitCadastralClientes: string;
    procedure SetSitCadastralClientes(const Value: string);

    function GetNumRuaClientes: Integer;
    procedure SetNumRuaClientes(const Value: Integer);

    property CodigoClientes: Integer read GetCodigoClientes write SetCodigoClientes;
    property CNPJClientes: string read GetCNPJClientes write SetCNPJClientes;
    property NomeClientes: string read GetNomeClientes write SetNomeClientes;
    property CEPClientes: string read GetCEPClientes write SetCEPClientes;
    property RuaClientes: string read GetRuaClientes write SetRuaClientes;
    property BairroClientes: string read GetBairroClientes write SetBairroClientes;
    property CidadeClientes: string read GetCidadeClientes write SetCidadeClientes;
    property UFClientes: string read GetUFClientes write SetUFClientes;
    property LongitudeClientes: Double read GetLongitudeClientes write SetLongitudeClientes;
    property LatitudeClientes: Double read GetLatitudeClientes write SetLatitudeClientes;
    property CodIBGEClientes: string read GetCodIBGEClientes write SetCodIBGEClientes;
    property NomeFantasiaClientes: string read GetNomeFantasiaClientes write SetNomeFantasiaClientes;
    property SitCadastralClientes: string read GetSitCadastralClientes write SetSitCadastralClientes;
    property NumRuaClientes: Integer read GetNumRuaClientes write SetNumRuaClientes;

    procedure CarregarDados(const AFDMemTable: TFDMemTable; pId, pNomeCliente, pLimite: String); // Método para carregar dados
    function CarregarNomePorId(pId: String) : String; // Implementação do método Carregar Nome por Id
    function Salvar: Boolean; // Método para salvar o pedido
    function Excluir(const AId: Integer): Boolean; // Método para excluir um pedido

    function GerarRelatorioHTML(const CodigosClientes: String): string;
  end;

implementation

end.
