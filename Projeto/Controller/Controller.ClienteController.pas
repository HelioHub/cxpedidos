unit Controller.ClienteController;

interface

uses
  Interfaces.ICliente, Model.Cliente, FireDAC.Comp.Client;

type
  TClienteController = class
  private
    FCliente: ICliente;
  public
    constructor Create;
    destructor Destroy; override;

    function GetCliente: ICliente;
    function SalvarCliente(ACliente: ICliente) : Boolean;
    function ExcluirCliente(const AId: Integer): Boolean;
    function CarregarNomePorId(pId: String) : String; // Implementação do método Carregar Nome por Id
    function GerarRelatorioHTML(const CodigosClientes: String): string;

    procedure CarregarDadosClientes(const AFDMemTable: TFDMemTable; pId, pNomeCliente, pLimite: String);
  end;

implementation

{ TClienteController }

uses CXConst;

function TClienteController.CarregarNomePorId(pId: String): String;
begin
  Result := FCliente.CarregarNomePorId(pId);
end;

constructor TClienteController.Create;
begin
  FCliente := TCliente.Create;
end;

destructor TClienteController.Destroy;
begin
  FCliente := nil;
  inherited;
end;

function TClienteController.GerarRelatorioHTML(
  const CodigosClientes: String): string;
begin
  result := FCliente.GerarRelatorioHTML(CodigosClientes);
end;

function TClienteController.GetCliente: ICliente;
begin
  Result := FCliente;
end;

function TClienteController.ExcluirCliente(const AId: Integer): Boolean;
begin
  Result := FCliente.Excluir(AId);
end;

function TClienteController.SalvarCliente(ACliente: ICliente): Boolean;
begin
  result := ACliente.Salvar;
end;

procedure TClienteController.CarregarDadosClientes(const AFDMemTable: TFDMemTable; pId, pNomeCliente, pLimite: String);
begin
  FCliente.CarregarDados(AFDMemTable, pId, pNomeCliente, pLimite);
end;

end.
