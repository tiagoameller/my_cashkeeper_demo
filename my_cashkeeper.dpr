program my_cashkeeper;

uses
  Vcl.Forms,
  mc_main in 'mc_main.pas' {foMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfoMain, foMain);
  Application.Run;
end.
