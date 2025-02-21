unit Utils.DMUtils;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls;

type
  TDMUtils = class(TDataModule)
    ILImagensSystem: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMUtils: TDMUtils;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
