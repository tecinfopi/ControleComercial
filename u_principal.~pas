unit u_principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RxCtrls, Grids, DBGrids, RxDBCtrl, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, Buttons, ACBrBase, ACBrEnterTab, ExtCtrls, ComCtrls, RxClock,
  jpeg, IdStack, IdBaseComponent, IdComponent, IdIPWatch;

type
  Tfrmprincipal = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    ConexaoSac: TZConnection;
    ZQryConVen: TZQuery;
    DsConVen: TDataSource;
    Gestao: TZConnection;
    QryLancamentos: TZQuery;
    DSLancamentos: TDataSource;
    Panel3: TPanel;
    Image1: TImage;
    Image8: TImage;
    Image10: TImage;
    Timer1: TTimer;
    IdIPWatch1: TIdIPWatch;
    ZQryConVenID: TIntegerField;
    ZQryConVenVENDEDOR_ID: TIntegerField;
    ZQryConVenTABELAPRECO_ID: TSmallintField;
    ZQryConVenCLIENTE_ID: TIntegerField;
    ZQryConVenINDCOMPRADOR: TSmallintField;
    ZQryConVenDATAEMISSAO: TDateField;
    ZQryConVenOBS: TStringField;
    ZQryConVenOBSCONTRIBUSUARIO: TStringField;
    ZQryConVenSITUACAO: TSmallintField;
    ZQryConVenAMBIENTE: TSmallintField;
    ZQryConVenVALORFRETE: TFloatField;
    ZQryConVenVALORSEGURO: TFloatField;
    ZQryConVenVALORDESPESAS: TFloatField;
    ZQryConVenQTDITEM: TIntegerField;
    ZQryConVenPESOLIQUIDO: TFloatField;
    ZQryConVenPESOBRUTO: TFloatField;
    ZQryConVenTOTALQTD: TFloatField;
    ZQryConVenTOTALCUSTO: TFloatField;
    ZQryConVenSEMDESCTO: TFloatField;
    ZQryConVenTOTALDESCTO: TFloatField;
    ZQryConVenTOTALITENS: TFloatField;
    ZQryConVenTOTALVENDA: TFloatField;
    ZQryConVenTOTALCOMISSAO: TFloatField;
    ZQryConVenTOTALLUCRO: TFloatField;
    ZQryConVenTOTALPAGTO: TFloatField;
    ZQryConVenTOTALDINHEIRO: TFloatField;
    ZQryConVenTOTALCHEQUE: TFloatField;
    ZQryConVenTOTALCREDIARIO: TFloatField;
    ZQryConVenTOTALCARTAO: TFloatField;
    ZQryConVenTOTALBANCO: TFloatField;
    ZQryConVenVALORRESTO: TFloatField;
    ZQryConVenVALORTROCO: TFloatField;
    btn1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    btn11: TSpeedButton;
    btn12: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    btnabastecimento: TSpeedButton;
    QryLancamentosID: TIntegerField;
    QryLancamentosDATA: TDateField;
    QryLancamentosKM: TStringField;
    QryLancamentosPROXIMOKM: TStringField;
    QryLancamentosIDVEICULO: TIntegerField;
    SpeedButton1: TSpeedButton;
    img1: TImage;
    SpeedButton5: TSpeedButton;
    Panel2: TPanel;
    Image2: TImage;
    procedure Image10Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btnabastecimentoClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure fechar;
  end;

var
  frmprincipal: Tfrmprincipal;

implementation

uses
  u_opcoesrelatorios, u_sobre, u_formsac, u_conveiculo, u_dmbasedados, u_cadusuarios,
  U_lancabastecimento, U_cadgrupos;

{$R *.dfm}
procedure Tfrmprincipal.fechar;
begin
   if Application.MessageBox('Deseja Realmente Fechar','C O N F I R M A Ç Ã O...',MB_YESNOCANCEL + MB_ICONINFORMATION + MB_DEFBUTTON2) = IdYes then
   Application.Terminate;
end;

procedure Tfrmprincipal.Image10Click(Sender: TObject);
begin
  if Application.MessageBox('Deseja Realmente Fechar','C O N F I R M A Ç Ã O...',MB_YESNOCANCEL + MB_ICONINFORMATION + MB_DEFBUTTON2) = IdYes then
  Application.Terminate;
end;

procedure Tfrmprincipal.Timer1Timer(Sender: TObject);
begin
   Statusbar1.Panels [1].Text := ' '+formatdatetime ('dddd","dd" de "mmmm" de "yyyy',now);//
end;

procedure Tfrmprincipal.FormCreate(Sender: TObject);
begin

   StatusBar1.Panels[2].Text := 'IP = LOCAL .: ' + idipwatch1.LocalIP;
   StatusBar1.Panels[3].Text := 'Usuário logado: ' + DmBasedados.QryUser.FieldByName('LOGIN').AsString;

end;

procedure Tfrmprincipal.SpeedButton2Click(Sender: TObject);
begin
   frmconveiculo := Tfrmconveiculo.Create(Application);
   frmconveiculo.Show;
end;

procedure Tfrmprincipal.SpeedButton3Click(Sender: TObject);
begin
  fechar;
end;

procedure Tfrmprincipal.btn12Click(Sender: TObject);
begin
  frmconsultasac := Tfrmconsultasac.Create(Application);
  frmconsultasac.Show;
end;
procedure Tfrmprincipal.btnabastecimentoClick(Sender: TObject);
begin
   frmlancabastecimento := Tfrmlancabastecimento.Create(Application);
   frmlancabastecimento.Show;
end;

procedure Tfrmprincipal.SpeedButton4Click(Sender: TObject);
begin
   frmcadgrupos := Tfrmcadgrupos.Create(Application);
   frmcadgrupos.Show;
end;

procedure Tfrmprincipal.SpeedButton1Click(Sender: TObject);
begin
   frmsobre := Tfrmsobre.Create(Application);
   frmsobre.Show;
end;

procedure Tfrmprincipal.SpeedButton5Click(Sender: TObject);
begin
  frmcadusuarios := Tfrmcadusuarios.Create(Application);
  frmcadusuarios.Show;
end;

end.
