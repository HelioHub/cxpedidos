unit View.Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Mask, System.UITypes,
  Interfaces.ICliente, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus,
  Controller.ClienteController,  System.Generics.Collections,
  CXConst, Winapi.ShellAPI, Vcl.ComCtrls, Vcl.DBCtrls;

type
  TFViewClientes = class(TForm)
    PHead: TPanel;
    PRodape: TPanel;
    PViewPedidos: TPanel;
    BBIncluir: TBitBtn;
    BBAlterar: TBitBtn;
    BBExcluir: TBitBtn;
    BBSair: TBitBtn;
    LNR: TLabel;
    ENR: TEdit;
    DSViewClientes: TDataSource;
    PFiltrar: TPanel;
    LEFiltroCodigoCliente: TLabeledEdit;
    LEFiltroNomeCliente: TLabeledEdit;
    BBAtualizar: TBitBtn;
    BBRelatorio: TBitBtn;
    SBClearPedido: TSpeedButton;
    SBClearNomeCliente: TSpeedButton;
    PDados: TPanel;
    DBGView: TDBGrid;
    ClientesMemTable: TFDMemTable;
    DBENF: TDBEdit;
    LNomeFant: TLabel;
    LEnd: TLabel;
    DBEEnd: TDBEdit;
    LBairro: TLabel;
    DBEBairro: TDBEdit;
    LLong: TLabel;
    DBELong: TDBEdit;
    LLati: TLabel;
    DBELati: TDBEdit;
    LCIBGE: TLabel;
    DBECIBGE: TDBEdit;
    LNum: TLabel;
    DBENum: TDBEdit;
    LSituacao: TLabel;
    DBESituacao: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBSairClick(Sender: TObject);
    procedure BBIncluirClick(Sender: TObject);
    procedure DBGViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGViewDblClick(Sender: TObject);
    procedure BBExcluirClick(Sender: TObject);
    procedure BBAtualizarClick(Sender: TObject);
    procedure BBAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PMAtualizarItensdoPedidoClick(Sender: TObject);
    procedure SBClearPedidoClick(Sender: TObject);
    procedure SBClearNomeClienteClick(Sender: TObject);
    procedure BBRelatorioClick(Sender: TObject);
  private
    { Private declarations }
    FClienteController: TClienteController;

    procedure TratarDelete;
    procedure pCRUD(pAcao: TAcao);
    procedure pAtualizacao;
    procedure GerarExibirRelatorio;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  end;

var
  FViewClientes: TFViewClientes;

implementation

{$R *.dfm}

uses Utils.DMUtils, View.Dados.Clientes;

constructor TFViewClientes.Create(AOwner: TComponent);
begin
  inherited;
  FClienteController := TClienteController.Create;
end;

destructor TFViewClientes.Destroy;
begin
  FClienteController.Free;
  inherited;
end;

procedure TFViewClientes.FormShow(Sender: TObject);
begin
  pAtualizacao;
end;

procedure TFViewClientes.GerarExibirRelatorio;
var
  HTML: string;
  FileName: string;
  ListaCodigos: TList<Integer>;
  CodigosClientes: TArray<Integer>;
  I: Integer;
begin
  ListaCodigos := TList<Integer>.Create;
  try
    If DBGView.SelectedRows.Count > 0 then
    begin
      for I := 0 to DBGView.SelectedRows.Count - 1 do
      begin
        DSViewClientes.DataSet.GotoBookmark(TBookmark(DBGView.SelectedRows.Items[I]));
        ListaCodigos.Add(DSViewClientes.DataSet.FieldByName('CodigoClientes').AsInteger);
      end;
      CodigosClientes := ListaCodigos.ToArray;
    end
    else
    begin
      DSViewClientes.DataSet.First;
      while Not DSViewClientes.DataSet.Eof do
      begin
        ListaCodigos.Add(DSViewClientes.DataSet.FieldByName('CodigoClientes').AsInteger);
        DSViewClientes.DataSet.Next;
      end;
      CodigosClientes := ListaCodigos.ToArray;
      DSViewClientes.DataSet.First;
    end;
  finally
    ListaCodigos.Free; // Libera a mem�ria da lista
  end;

  HTML := FClienteController.GerarRelatorioHTML(CodigosClientes);

  // Salva o HTML em um arquivo tempor�rio
  FileName := ExtractFilePath(Application.ExeName) + 'relatorio_pedido.html';
  with TStringList.Create do
  try
    Text := HTML;
    SaveToFile(FileName);
  finally
    Free;
  end;

  // Abre o arquivo no navegador padr�o
  ShellExecute(0, 'open', PChar(FileName), nil, nil, SW_SHOWNORMAL);
end;

procedure TFViewClientes.BBIncluirClick(Sender: TObject);
begin
  pCRUD(acIncluir);
end;

procedure TFViewClientes.BBRelatorioClick(Sender: TObject);
begin
  GerarExibirRelatorio;
end;

procedure TFViewClientes.BBAlterarClick(Sender: TObject);
begin
  pCRUD(acAlterar);
end;

procedure TFViewClientes.DBGViewDblClick(Sender: TObject);
begin
  BBAlterar.Click;
end;

procedure TFViewClientes.BBExcluirClick(Sender: TObject);
begin
  TratarDelete;
end;

procedure TFViewClientes.BBAtualizarClick(Sender: TObject);
begin
  pAtualizacao;
end;

procedure TFViewClientes.DBGViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Verifica se a tecla DELETE foi pressionada
  if Key = VK_DELETE then
  begin
    TratarDelete;
    Key := 0; // Evita que o DBGrid processe o DELETE automaticamente
  end
  else if key = VK_RETURN then
    pCRUD(acAlterar);
end;

procedure TFViewClientes.PMAtualizarItensdoPedidoClick(Sender: TObject);
begin
  pAtualizacao;
end;

procedure TFViewClientes.pCRUD(pAcao: TAcao);
var
  FormCliente: TFDadosClientes;
begin
  if (DSViewClientes.DataSet.FieldByName('CodigoClientes').IsNull) and
     (pAcao <> acIncluir) then
  begin
    Beep;
    ShowMessage('Selecione um registro v�lido '+cEOL+'para efetuar opera��o desejada!');
    Exit;
  end;

  if (pAcao = acExcluir) then
  begin
    if FClienteController.ExcluirCliente(
       DSViewClientes.DataSet.FieldByName('CodigoClientes').AsInteger) then
      ShowMessage('Cliente exclu�do com sucesso!')
    else
      ShowMessage('Erro ao excluir pedido.');
  end
  else
  begin
    FormCliente := TFDadosClientes.Create(Application);
    if (pAcao = acIncluir) then
    begin
      FormCliente.Caption := FormCliente.Caption + ' - ' + cAcaoIncluir;

      FormCliente.LECodigoCliente.Clear;
    end
    else
    begin
      FormCliente.Caption := FormCliente.Caption + ' - ' + cAcaoAlterar;

      FormCliente.LECodigoCliente.Text := DSViewClientes.DataSet.FieldByName('CodigoClientes').AsString;
      FormCliente.LECNPJ.Text := DSViewClientes.DataSet.FieldByName('CNPJClientes').AsString;
      FormCliente.ERazao.Text := DSViewClientes.DataSet.FieldByName('NomeClientes').AsString;
      FormCliente.EFantasia.Text := DSViewClientes.DataSet.FieldByName('NomeFantasiaClientes').AsString;
      FormCliente.ECEP.Text := DSViewClientes.DataSet.FieldByName('CEPClientes').AsString;
      FormCliente.EEndereco.Text := DSViewClientes.DataSet.FieldByName('RuaClientes').AsString;
      FormCliente.EBairro.Text := DSViewClientes.DataSet.FieldByName('BairroClientes').AsString;
      FormCliente.ECidade.Text := DSViewClientes.DataSet.FieldByName('CidadeClientes').AsString;
      FormCliente.EUF.Text := DSViewClientes.DataSet.FieldByName('UFClientes').AsString;
      FormCliente.ELongitude.Text := DSViewClientes.DataSet.FieldByName('LongitudeClientes').AsString;
      FormCliente.ELatidude.Text := DSViewClientes.DataSet.FieldByName('LatitudeClientes').AsString;
      FormCliente.EIBGE.Text := DSViewClientes.DataSet.FieldByName('CodIBGEClientes').AsString;
      FormCliente.ESituacao.Text := DSViewClientes.DataSet.FieldByName('SitCadastralClientes').AsString;
      FormCliente.ENumero.Text := DSViewClientes.DataSet.FieldByName('NumeroRuaClientes').AsString;
    end;
    FormCliente.ShowModal;
  end;
  pAtualizacao;
end;

procedure TFViewClientes.TratarDelete;
begin
  // Exibe uma mensagem de confirma��o antes de deletar o registro
  if MessageDlg('Deseja realmente Cancelar(Exclu�ndo) este Cliente '+
     DSViewClientes.DataSet.FieldByName('CodigoClientes').AsString+'?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    pCRUD(acExcluir);
end;

procedure TFViewClientes.pAtualizacao;
begin
  FClienteController.CarregarDadosClientes(ClientesMemTable,
    LEFiltroCodigoCliente.Text,
    LEFiltroNomeCliente.Text,
    ENR.Text);
end;

procedure TFViewClientes.SBClearNomeClienteClick(Sender: TObject);
begin
  LEFiltroNomeCliente.Clear;
end;

procedure TFViewClientes.SBClearPedidoClick(Sender: TObject);
begin
  LEFiltroCodigoCliente.Clear;
end;

procedure TFViewClientes.BBSairClick(Sender: TObject);
begin
  DSViewClientes.DataSet.Close;
  Close;
end;

procedure TFViewClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

end.
