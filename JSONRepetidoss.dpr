program JSONRepetidoss;

uses
  Vcl.Forms,
  JsonRepetido in 'Frm\JsonRepetido.pas' {frm_Principal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_Principal, frm_Principal);
  Application.Run;
end.
