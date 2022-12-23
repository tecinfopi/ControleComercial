program P_aulas;

uses
  Forms,
  U_aulas in '..\..\Aulas\U_aulas.pas' {Frm_teste};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Paulas - Sistema de Controle de Aprendizagem - DELPHI';
  Application.CreateForm(TFrm_teste, Frm_teste);
  Application.Run;
end.
