unit View.Show.Atencao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TFViewAtencao = class(TForm)
    PAtencao: TPanel;
    IAtencao: TImage;
    ITexto: TImage;
    BBFechar: TBitBtn;
    procedure ITextoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FViewAtencao: TFViewAtencao;

implementation

{$R *.dfm}

procedure TFViewAtencao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFViewAtencao.ITextoClick(Sender: TObject);
begin
  Close;
end;

end.
