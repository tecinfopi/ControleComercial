unit u_cadusuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, RxExtenders, StdCtrls, Mask, RxToolEdit,
  Buttons, u_database, Grids, DBGrids;

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
    Edtdata: TDateEdit;
    Label8: TLabel;
    ComboBox1: TComboBox;
    Label9: TLabel;
    Edtpesquisar: TEdit;
    BtnBuscar: TBitBtn;
    DBGrid1: TDBGrid;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnsalvarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
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
  //verifica se a tecla pressionada é a tecla ENTER, conhecida pelo Delphi como #13
  If key = #13 then
  Begin
//se for, passa o foco para o próximo campo, zerando o valor da variável Key
  Key:= #0;
  Perform(Wm_NextDlgCtl,0,0);
end;
end;
procedure Tfrmcadusuarios.BitBtn4Click(Sender: TObject);
begin
  Close;
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
   Edtconfirmar.Clear;
   Edtdata.Clear;
   Edtnome.SetFocus;
end;

procedure Tfrmcadusuarios.FormActivate(Sender: TObject);
begin
  Edtnome.SetFocus;
end;

procedure Tfrmcadusuarios.BtnsalvarClick(Sender: TObject);
begin
  if Edtnome.Text = '' then
  begin
  ShowMessage('Digite um nome de usuário para continuar...');
  Edtnome.SetFocus;
  end
  else
  if Edtsenha.Text <> Edtconfirmar.Text then
  begin
  ShowMessage('Senhas não são iguais tente novamente...');
  Edtnome.SetFocus;
  limparedits;
  end
  else
  with DmBasedados.QryCadUser do
  begin
    Close;
    SQL.Add('INSERT INTO usuarios');
    SQL.Add('(nome, login, senha, data, obs)');
    SQL.Add('values (:pnome, :plogin, :psenha, :pdata, :pobs)');
    ParamByName('pdata').AsDateTime := StrToDate(edtdata.Text);
    ParamByName('pnome').AsString := Edtnome.Text;
    ParamByName('plogin').AsString := Edtlogin.Text;
    ParamByName('psenha').AsString := Edtsenha.Text;
    ParamByName('pobs').AsString   := Edtobs.Text;
    ExecSQL;
    ShowMessage('Registro inserido com sucesso....');
    limparedits;
  end;
  end;
procedure Tfrmcadusuarios.BtnAlterarClick(Sender: TObject);
begin
   with DmBasedados.QryUser do
   begin
     Close;
     SQL.Clear;
     SQL.Add('update usuarios set  NOME = :NOME, LOGIN = :LOGIN, SENHA = :SENHA, DATA = :DATA, OBS = :OBS ');
     SQL.Add('where ID_USER = :ID_USER');
     ParamByName('NOME').AsString := Edtnome.Text;
     ParamByName('LOGIN').AsString := Edtlogin.Text;
     ParamByName('SENHA').AsString := Edtsenha.Text;
     ParamByName('OBS').AsString := EdtObs.Text;
     ParamByName('DATA').AsDateTime := StrToDate(Edtdata.Text);
     ParamByName('ID_USER').AsInteger := StrToInt(Edtcodigo.Text);
     limparedits;
      try
        ExecSQL;
         ShowMessage('Atualizado com sucesso');
      except on E:Exception do
        ShowMessage('Erro ao atualizar o registro');
      end;
   end;

end;

end.


