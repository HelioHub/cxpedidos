unit CXPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Winapi.ShellApi;

type
  TFWKPedidos = class(TForm)
    BBCadPedidos: TBitBtn;
    BBFechar: TBitBtn;
    PHost: TPanel;
    EHostName: TEdit;
    LWK: TLabel;
    BExecFolder: TButton;
    BBCadClientes: TBitBtn;
    procedure BBFecharClick(Sender: TObject);
    procedure LWKClick(Sender: TObject);
    procedure BBCadPedidosClick(Sender: TObject);
    procedure BExecFolderClick(Sender: TObject);
    procedure BBCadClientesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FWKPedidos: TFWKPedidos;

implementation

{$R *.dfm}

uses View.Show.MaisVendido, View.Show.Atencao, CXConst, View.Pedidos,
  Utils.DMUtils, View.Clientes;


procedure TFWKPedidos.BBCadClientesClick(Sender: TObject);
begin
  FViewClientes := TFViewClientes.Create(Application);
  FViewClientes.ShowModal;
end;

procedure TFWKPedidos.BBCadPedidosClick(Sender: TObject);
begin
  FViewPedidos := TFViewPedidos.Create(Application);
  FViewPedidos.ShowModal;
end;

procedure TFWKPedidos.BBFecharClick(Sender: TObject);
begin
  FViewAtencao := TFViewAtencao.Create(Application);
  FViewAtencao.ShowModal;
  Application.Terminate;
end;

procedure TFWKPedidos.BExecFolderClick(Sender: TObject);
var
  ExecutablePath, ExecutableDir: string;
begin
  ExecutablePath := ParamStr(0); // Obtém o caminho completo do executável
  ExecutableDir := ExtractFileDir(ExecutablePath); // Extrai o diretório do caminho
  ShowMessage('O executável está sendo executado na pasta: ' + ExecutableDir);
end;

procedure TFWKPedidos.LWKClick(Sender: TObject);
begin
  ShellExecute(Handle, nil, PChar(curlWK), nil, nil, SW_SHOWNORMAL);
end;

end.
