unit U_cadgrupos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RxExtenders, ExtCtrls, StdCtrls, Buttons, Mask,
  RxToolEdit, Grids, DBGrids, RxDBCtrl, u_database;

type
  Tfrmcadgrupos = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RxWizardHeader1: TRxWizardHeader;
    pnlrodape: TPanel;
    Panel1: TPanel;
    BtnSalvar: TSpeedButton;
    BtnAlterar: TSpeedButton;
    BtnExcluir: TSpeedButton;
    BtnImprimir: TSpeedButton;
    BtnFechar: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edtcodigo: TEdit;
    Edtnome: TEdit;
    Edtdata: TDateEdit;
    Label4: TLabel;
    cb: TComboBox;
    Label5: TLabel;
    edtPesquisa: TEdit;
    SpeedButton1: TSpeedButton;
    RxDBGrid1: TRxDBGrid;
    Label6: TLabel;
    EdtObs: TEdit;
    procedure btnfecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RxDBGrid1CellClick(Column: TColumn);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure habilitarbotoes;
    procedure limparedits;
  public
    { Public declarations }
  end;

var
  frmcadgrupos: Tfrmcadgrupos;

implementation

uses u_dmbasedados, u_principal, ZDataset, U_RelGrupos;

{$R *.dfm}

procedure Tfrmcadgrupos.btnfecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrmcadgrupos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //verifica se a tecla pressionada é a tecla ENTER, conhecida pelo Delphi como #13
  If key = #13 then
  Begin
//se for, passa o foco para o próximo campo, zerando o valor da variável Key
  Key:= #0;
  Perform(Wm_NextDlgCtl,0,0);
end;
end;

procedure Tfrmcadgrupos.habilitarbotoes;
begin
  btnalterar.Enabled := True;
  btnexcluir.Enabled := True;
  btnimprimir.Enabled:= True;
end;

procedure Tfrmcadgrupos.limparedits;
begin
  Edtcodigo.Clear;
  Edtnome.Clear;
  Edtdata.Clear;
  EdtObs.Clear;
  Edtnome.SetFocus;
end;

procedure Tfrmcadgrupos.BtnSalvarClick(Sender: TObject);
begin
if  Edtnome.Text = '' then
  begin
  ShowMessage('Digite um nome de grupo para continuar...');
  Edtnome.SetFocus;
  end
  else
  with DmBasedados.QryGrupos do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO grupos');
    SQL.Add('(DESCRICAO, OBS, DATA)');
    SQL.Add('values (:pdescricao, :pobs, :pdata)');
    ParamByName('pdata').AsDate := StrToDate(Edtdata.Text);
    ParamByName('pdescricao').AsString := Edtnome.Text;
    ParamByName('pobs').AsString := EdtObs.Text;
    ExecSQL;
    ShowMessage('Registro inserido com sucesso....');
    limparedits;
    //habilitarbotoes;
    //PageControl1.ActivePage := TabSheet2;
  end;
end;

procedure Tfrmcadgrupos.BtnAlterarClick(Sender: TObject);
begin
   with DmBasedados.QryGrupos do
   begin

     Close;
     SQL.Clear;
     SQL.Add('update grupos set  DESCRICAO = :DESCRICAO, OBS = :OBS, DATA = :DATA ');
     SQL.Add('where ID_GRUPO = :ID_GRUPO');
     ParamByName('DESCRICAO').AsString := Edtnome.Text;
     ParamByName('OBS').AsString := EdtObs.Text;
     ParamByName('DATA').AsDateTime := StrToDate(Edtdata.Text);
     ParamByName('ID_GRUPO').AsInteger := StrToInt(Edtcodigo.Text);
     limparedits;
      try
        ExecSQL;
         ShowMessage('Atualizado com sucesso');
      except on E:Exception do
        ShowMessage('Erro ao atualizar o registro');
      end;
   end;
end;

procedure Tfrmcadgrupos.SpeedButton1Click(Sender: TObject);
begin
  with DmBasedados.QryConGrup do
  begin
    Close;
    SQL.Clear;
     case cb.ItemIndex of
     0: begin
         SQL.Add('Select * from grupos where id_grupo = ' + edtPesquisa.Text);
        end;
     1: begin
         SQL.Add('Select * from grupos where DESCRICAO LIKE ' + QuotedStr( '%' + edtPesquisa.Text + '%' ));
        end;
     3: begin
        SQL.Add('Select * from grupos');
     end;
     end;

     //SQL.Text
     Open;
     if DmBasedados.QryGrupos.Active then
     if DmBasedados.QryGrupos.RecordCount = 0 then
     ShowMessage('Registro não encontrado....');
    end;
  end;
procedure Tfrmcadgrupos.RxDBGrid1CellClick(Column: TColumn);
begin
  PageControl1.ActivePageIndex  := 0;
  Edtcodigo.Text  := RxDBGrid1.Fields[0].Value;
  Edtnome.Text    := RxDBGrid1.Fields[1].Value;
  Edtdata.Text    := RxDBGrid1.Fields[3].Value;
  EdtObs.Text     := RxDBGrid1.Fields[2].Value;
  habilitarbotoes;
  Edtnome.SetFocus;
end;
procedure Tfrmcadgrupos.BtnExcluirClick(Sender: TObject);
begin
   with DmBasedados.QryConGrup do
   begin

     Close;
     SQL.Clear;
     SQL.Add('delete from grupos where id_grupo = :id_grupo');
     ParamByName('id_grupo').AsInteger := StrToInt(Edtcodigo.Text);
     if Application.MessageBox('Deseja Realmente Fechar','C O N F I R M A Ç Ã O...',MB_YESNOCANCEL + MB_ICONINFORMATION + MB_DEFBUTTON2) = IdYes then
     Exit;
      try
        ExecSQL;
         ShowMessage('Excluido com seucesso');
      except on E:Exception do
        ShowMessage('Erro ao Excluir o registro');
      end;
   end;
 //PageControl1.ActivePage := TabSheet2;
 //btnlocalizarClick(sender);
 limparedits;
end;

procedure Tfrmcadgrupos.BtnImprimirClick(Sender: TObject);
begin
  FrmRelGrupos.RLReport1.Preview;
end;

procedure Tfrmcadgrupos.FormActivate(Sender: TObject);
begin
  Edtnome.SetFocus;
end;

end.
