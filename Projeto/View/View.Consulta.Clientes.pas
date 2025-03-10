unit View.Consulta.Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Controller.ClienteController,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf;

type
  TFConsultaClientes = class(TForm)
    PRodape: TPanel;
    PDados: TPanel;
    BBSair: TBitBtn;
    BBSelecionar: TBitBtn;
    PHead: TPanel;
    DBGView: TDBGrid;
    LEFiltroNomeCliente: TLabeledEdit;
    BBFiltrar: TBitBtn;
    DSConslutaCliente: TDataSource;
    FDMemTableCliente: TFDMemTable;
    procedure BBFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBSairClick(Sender: TObject);
    procedure DBGViewDblClick(Sender: TObject);
    procedure DBGViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FClienteController: TClienteController;

    procedure pAtualizacao;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FConsultaClientes: TFConsultaClientes;

implementation

{$R *.dfm}

procedure TFConsultaClientes.BBSairClick(Sender: TObject);
begin
  Close;
end;

constructor TFConsultaClientes.Create(AOwner: TComponent);
begin
  inherited;
  FClienteController := TClienteController.Create;
end;

procedure TFConsultaClientes.DBGViewDblClick(Sender: TObject);
begin
  BBSelecionar.Click;
end;

procedure TFConsultaClientes.DBGViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    BBSelecionar.Click;
end;

destructor TFConsultaClientes.Destroy;
begin
  FClienteController.Free;
  inherited;
end;

procedure TFConsultaClientes.BBFiltrarClick(Sender: TObject);
begin
  // Carrega os dados no TFDMemTable
  pAtualizacao;
end;

procedure TFConsultaClientes.FormShow(Sender: TObject);
begin
  pAtualizacao;
end;

procedure TFConsultaClientes.pAtualizacao;
begin
  FClienteController.CarregarDadosClientes(
    FDMemTableCliente,
    '',
    LEFiltroNomeCliente.Text,
    '');
end;

end.
