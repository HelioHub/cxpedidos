unit Interfaces.Visitor;

interface

type
  iVisitor = interface;
  iVisitable = interface;

  iItem = interface
    ['{617A4FC6-C646-407E-AC55-862291D2F90B}']
    function SetPrecoUnitario(Value: Currency) : iItem;
    function PrecoUnitario : Currency;
    function Regras : iVisitable;
  end;

  iItemRegras = interface
    ['{18818B84-D529-41C7-81F2-7C7E0040B323}']
    function PrecoAVista : Currency;
    function PrecoAPrazo : Currency;
    function Visitor: iVisitor;
  end;

  iVisitor = interface
    ['{48EF3CBE-9062-4A9E-9C6E-496D8029FF7F}']
    function Visit(Value : iItem) : iItemRegras; //Visitante
  end;

  iVisitable = interface
    ['{019DCCC5-A5E3-45B6-A851-326DF978E789}']
    function Accept(Value : iVisitor) : iItemRegras; //Visitado
  end;


implementation

end.
