program Aplic;

uses
  Forms,
  SysUTils,
  u_principal in 'u_principal.pas' {frmprincipal},
  u_abertura in 'u_abertura.pas' {frmabertura},
  u_opcoesrelatorios in 'u_opcoesrelatorios.pas' {frmopcoesrelatorios},
  u_sobre in 'u_sobre.pas' {frmsobre},
  u_formsac in 'u_formsac.pas' {frmconsultasac},
  u_frmelvendas in 'u_frmelvendas.pas' {frmrelvendas},
  u_conveiculo in 'u_conveiculo.pas' {frmconveiculo},
  u_consultaveiculos in 'u_consultaveiculos.pas' {frmlocveiculo},
  u_dmbasedados in 'u_dmbasedados.pas' {DmBasedados: TDataModule},
  u_login in 'u_login.pas' {frmlogin},
  u_cadusuarios in 'u_cadusuarios.pas' {frmcadusuarios},
  U_lancabastecimento in 'U_lancabastecimento.pas' {frmlancabastecimento},
  U_cadgrupos in 'U_cadgrupos.pas' {frmcadgrupos},
  U_RelGrupos in 'U_RelGrupos.pas' {FrmRelGrupos};

{$R *.res}

begin
  frmabertura := Tfrmabertura.Create(Application);

  // cria a tela de abertura antes
  frmabertura := Tfrmabertura.Create(Application);
  // mostra a tela de abertura
  frmabertura.Show;
  frmabertura.Refresh;
  // Começa com 1%
  frmabertura.Gauge1.Progress := 1;
    // espera...
    Sleep(100);
  Application.Initialize;
  //Application.MainFormOnTaskbar := True;
//Application.CreateForm(TfrmSplash, frmSplash);
  // cria o form2
  Application.Title := 'SysCon - Controle de Consultas';
  Application.CreateForm(TDmBasedados, DmBasedados);
  Application.CreateForm(Tfrmlogin, frmlogin);
  Application.CreateForm(Tfrmprincipal, frmprincipal);
  // altera a ProgressBar
    frmabertura.Gauge1.Progress := 10;
    // espera...
    Sleep(500);


  Application.CreateForm(Tfrmsobre, frmsobre);
  // altera a ProgressBar
  frmabertura.Gauge1.Progress := 30;
  // espera...
  Sleep(500);

  Application.CreateForm(Tfrmconveiculo, frmconveiculo);
  // altera a ProgressBar
  frmabertura.Gauge1.Progress := 50;
  // espera...
  Sleep(500);

  Application.CreateForm(Tfrmconsultasac, frmconsultasac);
  // altera a ProgressBar
  frmabertura.Gauge1.Progress:= 70;
  // espera...
  Sleep(500);

   Application.CreateForm(Tfrmlocveiculo, frmlocveiculo);
  // altera a ProgressBar
  frmabertura.Gauge1.Progress := 90;
  // espera...
  Sleep(500);

  Application.CreateForm(Tfrmopcoesrelatorios, frmopcoesrelatorios);
   //altera a ProgressBar
  frmabertura.Gauge1.Progress := 100;
  //espera...
  Sleep(500);
  Application.CreateForm(Tfrmrelvendas, frmrelvendas);

 // esconde o form
  frmabertura.Hide;
  frmabertura.Free;
  Application.Run;
//  try
//  frmabertura.Show;
//  frmabertura.Update;
//  Application.Initialize;
//  Application.Title := 'Sistema de Controle de Consulta';
//  Application.CreateForm(TfrmPrincipal, frmPrincipal);
//  Application.CreateForm(Tfrmopcoesrelatorios, frmopcoesrelatorios);
//  Application.CreateForm(Tfrmrelvendas, frmrelvendas);
//  // Aguanda 2 segundos (opcional)
//  Sleep(5000);
//  finally
//  FreeAndNil(frmabertura);
//  end;
//  Application.Run;
end.
