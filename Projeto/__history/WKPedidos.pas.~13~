unit WKPedidos;

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
    procedure BBFecharClick(Sender: TObject);
    procedure LWKClick(Sender: TObject);
    procedure BBCadPedidosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FWKPedidos: TFWKPedidos;

implementation

{$R *.dfm}

uses UViewPedidos, UViewAtencao, WKConst;


procedure TFWKPedidos.BBCadPedidosClick(Sender: TObject);
begin
  //FViewAtencao := TFViewAtencao.Create(Application);
  //FViewAtencao.ShowModal;

  FViewPedidos := TFViewPedidos.Create(Application);
  FViewPedidos.ShowModal;
end;

procedure TFWKPedidos.BBFecharClick(Sender: TObject);
begin
  FViewAtencao := TFViewAtencao.Create(Application);
  FViewAtencao.ShowModal;
  Application.Terminate;
end;

procedure TFWKPedidos.LWKClick(Sender: TObject);
begin
  ShellExecute(Handle, nil, PChar(curlWK), nil, nil, SW_SHOWNORMAL);
end;

end.
