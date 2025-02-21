unit Utils.ServerRestHorse;

interface

uses
  Horse, System.SysUtils, Utils.BrasilAPI;

procedure StartServer;

implementation

procedure StartServer;
var
  BrasilAPI: TBrasilAPI;
begin
  BrasilAPI := TBrasilAPI.Create;

  THorse.Get('/cep/:cep',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send(BrasilAPI.ConsultarCEP(Req.Params['cep']));
    end
  );

  THorse.Get('/cnpj/:cnpj',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send(BrasilAPI.ConsultarCNPJ(Req.Params['cnpj']));
    end
  );

  THorse.Get('/ibge/:cidade/:uf',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send(BrasilAPI.ConsultarIBGE(Req.Params['cidade'], Req.Params['uf']));
    end
  );

  THorse.Get('/latlong/:cep',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send(BrasilAPI.ConsultarLatLongCEP(Req.Params['cep']));
    end
  );

  THorse.Listen(9000);
end;

end.

