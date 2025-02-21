unit Controller.ProdutoController;

interface

uses
  Interfaces.IProduto, Model.Produto, FireDAC.Comp.Client;

type
  TProdutoController = class
  private
    FProduto: IProduto;
  public
    constructor Create;
    destructor Destroy; override;

    function GetProduto: IProduto;
    function CarregarNomePorId(pId: String): String;
    function CarregarPricePorId(pId: String): Double;
    procedure CarregarDadosProdutos(const AFDMemTable: TFDMemTable; pDescricaoProduto: String);
  end;

implementation

{ TProdutoController }

uses WKConst;

constructor TProdutoController.Create;
begin
  FProduto := TProduto.Create(cPATH_INI);
end;

destructor TProdutoController.Destroy;
begin
  FProduto := nil;
  inherited;
end;

function TProdutoController.CarregarNomePorId(pId: String): String;
begin
  Result := FProduto.CarregarNomePorId(pId);
end;

function TProdutoController.CarregarPricePorId(pId: String): Double;
begin
  Result := FProduto.CarregarPricePorId(pId);
end;

function TProdutoController.GetProduto: IProduto;
begin
  Result := FProduto;
end;

procedure TProdutoController.CarregarDadosProdutos(const AFDMemTable: TFDMemTable; pDescricaoProduto: String);
begin
  FProduto.CarregarDados(AFDMemTable, pDescricaoProduto);
end;

end.
