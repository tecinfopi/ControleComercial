unit u_formsac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, RxDBCtrl, ComCtrls, StdCtrls, Buttons,
  RxCtrls, Mask, RxToolEdit, DB, RxExtenders;

type
  Tfrmconsultasac = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    Label3: TLabel;
    Panel4: TPanel;
    Label4: TLabel;
    Label2: TLabel;
    RxAnimBitBtn1: TRxAnimBitBtn;
    edtPesquisa: TEdit;
    Panel2: TPanel;
    cbb1: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label7: TLabel;
    btnlimpar: TRxAnimBitBtn;
    btnimprimir: TRxAnimBitBtn;
    RxAnimBitBtn4: TRxAnimBitBtn;
    DataSource1: TDataSource;
    RxWizardHeader1: TRxWizardHeader;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RxAnimBitBtn1Click(Sender: TObject);
    procedure cbb1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxAnimBitBtn4Click(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure btnlimparClick(Sender: TObject);
  private
    { Private declarations }
    procedure fechar;
  public
    { Public declarations }
  end;

var
  frmconsultasac: Tfrmconsultasac;

implementation

uses
  u_principal, u_frmelvendas;

{$R *.dfm}

procedure Tfrmconsultasac.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //verifica se a tecla pressionada é a tecla ENTER, conhecida pelo Delphi como #13
  If key = #13 then
  Begin
//se for, passa o foco para o próximo campo, zerando o valor da variável Key
  Key:= #0;
  Perform(Wm_NextDlgCtl,0,0);
end;
end;

procedure Tfrmconsultasac.RxAnimBitBtn1Click(Sender: TObject);
begin
  if  edtPesquisa.Text = '' then
  begin
  ShowMessage('Escolhe um tipo de consultar...');
  cbb1.SetFocus;
  end
  else
  begin
  with frmprincipal.ZQryConVen do
  begin
    Close;
    SQL.Clear;
     case cbb1.ItemIndex of
     0: begin
         SQL.Add('Select * from venda where id = ' + edtPesquisa.Text);
        end;

     1: begin
         SQL.Add('Select * from venda where obs LIKE ' + QuotedStr( '%' + edtPesquisa.Text + '%' ));
        end;
     2: begin
         //SQL.Add('Select * from venda where DATAEMISSAO LIKE ' + QuotedStr( '%' + edtPesquisa.Text + '%' ));
         SQL.Add('Select * from venda where 1 = 1  ');
         SQL.Add(' and DATAEMISSAO >= :DATAINICIAL');
         SQL.Add(' and DATAEMISSAO <= :DATAFINAL');
         ParamByName('DATAINICIAL').AsDate:=DateEdit1.Date;
         ParamByName('DATAFINAL').AsDate := DateEdit2.date;
         //ParamByName('DATAFINAL').AsDate := StrToDate(MaskEdit1.Text);
         //ParamByName('DATAFINAL').AsDate := StrToDate(MaskEdit2.Text);
        end;
     end;
     Open;
     Label4.Caption := IntToStr(RecordCount);
     if frmprincipal.ZQryConVen.RecordCount = 0 then
     ShowMessage('Registro não encontrado....');
     btnlimpar.Enabled   := True;
     btnimprimir.Enabled := True;
     edtPesquisa.SetFocus;
    end;
  end;
end;

procedure Tfrmconsultasac.cbb1Click(Sender: TObject);
begin
  DateEdit1.Enabled := True;
  DateEdit2.Enabled := True;
end;

procedure Tfrmconsultasac.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmprincipal.ZQryConVen.Close;
end;

procedure Tfrmconsultasac.RxAnimBitBtn4Click(Sender: TObject);
begin
   close;
end;

procedure Tfrmconsultasac.fechar;
begin
   if Application.MessageBox('Deseja Realmente Fechar','C O N F I R M A Ç Ã O...',MB_YESNOCANCEL + MB_ICONINFORMATION + MB_DEFBUTTON2) = IdYes then
   close;
end;

procedure Tfrmconsultasac.btnimprimirClick(Sender: TObject);
begin
 frmrelvendas.RLReport1.Preview;
end;

procedure Tfrmconsultasac.btnlimparClick(Sender: TObject);
begin
  DateEdit1.Clear;
  DateEdit2.Clear;
  edtPesquisa.Clear;
  MaskEdit1.Clear;
  MaskEdit2.Clear;
  btnimprimir.Enabled := false;
  btnlimpar.Enabled   := False;
  Label4.Caption := '';
  frmprincipal.ZQryConVen.Close;
  cbb1.SetFocus;
end;

end.
