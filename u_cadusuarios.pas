unit u_cadusuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, RxExtenders, StdCtrls, Mask, RxToolEdit,
  Buttons, u_database;

type
  Tfrmcadusuarios = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    rxwzrdhdr1: TRxWizardHeader;
    rxwzrdhdr2: TRxWizardHeader;
    Pnlbotoes: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Edtcodigo: TEdit;
    Label2: TLabel;
    Edtnome: TEdit;
    Label3: TLabel;
    Edtlogin: TEdit;
    Label4: TLabel;
    Edtsenha: TEdit;
    Label5: TLabel;
    Edtconfirmar: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Edtobs: TEdit;
    Btnsalvar: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnExcluir: TBitBtn;
    BitBtn4: TBitBtn;
    Edtdata: TDateTimePicker;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure BtnsalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure habilitarbotoes;
    procedure limparedits;
  public
    { Public declarations }
  end;

var
  frmcadusuarios: Tfrmcadusuarios;

implementation

uses
  u_principal, u_dmbasedados, ZAbstractRODataset;

{$R *.dfm}

procedure Tfrmcadusuarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //verifica se a tecla pressionada � a tecla ENTER, conhecida pelo Delphi como #13
  If key = #13 then
  Begin
//se for, passa o foco para o pr�ximo campo, zerando o valor da vari�vel Key
  Key:= #0;
  Perform(Wm_NextDlgCtl,0,0);
end;
end;
procedure Tfrmcadusuarios.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrmcadusuarios.BtnsalvarClick(Sender: TObject);
begin
  if  Edtnome.Text = '' then
  begin
  ShowMessage('Digite um nome para continuar...');
  Edtnome.SetFocus;
  end
  else
  with DmBasedados.QryCadUsers do
  begin
    if Edtsenha.Text <> Edtconfirmar.Text then
    //raise
    //Exception.Create('Senha n�o s�o iguais repita novamente..');
    ShowMessage('Senha n�o s�o iguais repita novamente..');
    limparedits;
    Edtconfirmar.Clear;
    Edtnome.SetFocus;
    Close;
    SQL.Add('INSERT INTO usuarios');
    SQL.Add('(nome, login, senha, data, obs)');
    SQL.Add('values (:pnome, :plogin, :psenha, :pdata, :pobs)');
    ParamByName('pnome').AsString  := Edtnome.Text;
    ParamByName('plogin').AsString := Edtlogin.Text;
    ParamByName('psenha').AsString := Edtsenha.Text;
    ParamByName('pdata').AsDate    := Edtdata.Date;
    ParamByName('pobs').AsString   := Edtobs.Text;
    ExecSQL;
    ShowMessage('Registro inserido com sucesso....');
    limparedits;
    habilitarbotoes;
    end;
end;
procedure Tfrmcadusuarios.habilitarbotoes;
begin
  btnalterar.Enabled := True;
  btnexcluir.Enabled := True;
end;

procedure Tfrmcadusuarios.limparedits;
begin
   Edtcodigo.Clear;
   Edtnome.Clear;
   Edtlogin.Clear;
   Edtsenha.Clear;
   Edtobs.Clear;
   Edtnome.SetFocus;
end;

procedure Tfrmcadusuarios.FormActivate(Sender: TObject);
begin
  Edtnome.SetFocus;
end;

end.


