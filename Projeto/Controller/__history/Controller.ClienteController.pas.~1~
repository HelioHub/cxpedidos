unit Controller.ClienteController;

interface

uses
  Interfaces.ICliente, Model.Cliente, FireDAC.Comp.Client;

type
  TClienteController = class
  private
    FCliente: ICliente;
  public
    constructor Create(const IniFileName: string);
    destructor Destroy; override;

    function GetCliente: ICliente;
    procedure CarregarDadosClientes(const AFDMemTable: TFDMemTable);
  end;

implementation

{ TClienteController }

constructor TClienteController.Create(const IniFileName: string);
begin
  FCliente := TCliente.Create(IniFileName);
end;

destructor TClienteController.Destroy;
begin
  FCliente := nil;
  inherited;
end;

function TClienteController.GetCliente: ICliente;
begin
  Result := FCliente;
end;

procedure TClienteController.CarregarDadosClientes(const AFDMemTable: TFDMemTable);
begin
  FCliente.CarregarDados(AFDMemTable);
end;

end.
