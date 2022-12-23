unit u_consultaveiculos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RxDBCtrl, Buttons, StdCtrls, ExtCtrls, ACBrBase,
  ACBrEnterTab;

type
  Tfrmlocveiculo = class(TForm)
    edpesquisa: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    RxDBGrid1: TRxDBGrid;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmlocveiculo: Tfrmlocveiculo;

implementation

uses
  u_principal, u_conveiculo, u_database, u_dmbasedados;

{$R *.dfm}

procedure Tfrmlocveiculo.BitBtn1Click(Sender: TObject);
begin
if  edpesquisa.Text = '' then
  begin
  ShowMessage('Digite algo para consultar...');
  edpesquisa.SetFocus;
  Abort;
  end
  else
  begin
  with DmBasedados.QryConVei do
  begin
   Close;
    SQL.Clear;
    SQL.Add('Select * from veiculos where NOME LIKE ' + QuotedStr( '%' + edPesquisa.Text + '%' ));
     ExecSQL;
     Open;
    if DmBasedados.QryConVei.RecordCount = 0 then
    ShowMessage('Registro não encontrado....');
  edPesquisa.SetFocus;
end;
end;
end;
procedure Tfrmlocveiculo.FormKeyPress(Sender: TObject; var Key: Char);
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
