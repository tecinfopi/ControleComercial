unit u_login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, RxCtrls, frxpngimage, jpeg,
  ComCtrls, ACBrBase, ACBrEnterTab;

type
  Tfrmlogin = class(TForm)
    edtusuario: TEdit;
    edtsenha: TEdit;
    btnconfirmar: TRxAnimBitBtn;
    btnfechar: TRxAnimBitBtn;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    StatusBar1: TStatusBar;
    Label2: TLabel;
    Label3: TLabel;
    procedure btnconfirmarClick(Sender: TObject);
    procedure btnfecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmlogin: Tfrmlogin;

implementation

uses
  u_principal, u_dmbasedados;

{$R *.dfm}

procedure Tfrmlogin.btnconfirmarClick(Sender: TObject);
begin
  if ((edtusuario.Text ='')and(edtsenha.Text ='')) then
  begin
  ShowMessage('OPS! os campos estão vázios');

  edtusuario.SetFocus;
   Abort;
  end;
  DmBasedados.QryUser.Close;
  DmBasedados.QryUser.SQL.Clear; // Adicionei esta linha para limpar o SQL
  DmBasedados.QryUser.SQL.Add('Select * from usuarios');
  DmBasedados.QryUser.SQL.Add(' WHERE LOGIN = ' + QuotedStr(edtusuario.Text) + ' AND SENHA = ' + QuotedStr(edtsenha.Text));
  DmBasedados.QryUser.Open;
  frmprincipal.StatusBar1.Panels[3].Text := 'Usuário logado no sistema: '+ DmBasedados.QryUser.FieldByName('NOME').AsString;
  if DmBasedados.QryUser.IsEmpty then
  begin
  ShowMessage('Usuário ou senha inválida(o)');
  edtusuario.SetFocus;
  Abort;
  end;
  begin
  frmlogin.Hide;
  frmprincipal.ShowModal;
  frmlogin.Close;
end;
end;

procedure Tfrmlogin.btnfecharClick(Sender: TObject);
var
  reset:string;
begin
 edtusuario.Text :=reset;
 edtsenha.Text   :=reset;
 reset :='';
 edtusuario.SetFocus;
 end;
 procedure Tfrmlogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
 //verifica se a tecla pressionada é a tecla ENTER, conhecida pelo Delphi como #13
  If key = #13 then
  Begin
//se for, passa o foco para o próximo campo, zerando o valor da variável Key
  Key:= #0;
  Perform(Wm_NextDlgCtl,0,0);
end;
end;
end.
