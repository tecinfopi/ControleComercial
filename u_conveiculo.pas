unit u_conveiculo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RxExtenders, RxCtrls, RxToolEdit, StdCtrls, Mask,
  ACBrBase, ACBrEnterTab, ExtCtrls, Grids, DBGrids, RxDBCtrl, Buttons, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  Tfrmconveiculo = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RxWizardHeader1: TRxWizardHeader;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtcodigo: TComboEdit;
    edtdata: TDateEdit;
    edtkm: TComboEdit;
    edtproxkm: TComboEdit;
    RxWizardHeader2: TRxWizardHeader;
    Label5: TLabel;
    cbb1: TComboBox;
    Label6: TLabel;
    edtPesquisa: TEdit;
    btnlocalizar: TRxAnimBitBtn;
    btnsalvar: TRxAnimBitBtn;
    btnalterar: TRxAnimBitBtn;
    btnexcluir: TRxAnimBitBtn;
    btnimprimir: TRxAnimBitBtn;
    btnfechar: TRxAnimBitBtn;
    Panel2: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label9: TLabel;
    Label10: TLabel;
    codveiculo: TEdit;
    edtresultado: TEdit;
    Button1: TButton;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    qry: TZQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    lbl1: TLabel;
    lbl2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnfecharClick(Sender: TObject);
    procedure btnlocalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnsalvarClick(Sender: TObject);
    procedure codveiculoExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    //procedure RxDBGrid1CellClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnalterarClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cbb1Click(Sender: TObject);
  private
    { Private declarations }
    procedure habilitarbotoes;
    procedure limparedits;
  public
    { Public declarations }
    function DescricaoVeiculo(aValue : Integer) : String;
  end;

var
  frmconveiculo: Tfrmconveiculo;

implementation

uses
  u_principal, u_consultaveiculos, u_opcoesrelatorios, u_dmbasedados;

{$R *.dfm}

procedure Tfrmconveiculo.FormCreate(Sender: TObject);
begin
  //edtdata.SetFocus;   
end;

procedure Tfrmconveiculo.btnfecharClick(Sender: TObject);
begin
   close;
end;

procedure Tfrmconveiculo.btnlocalizarClick(Sender: TObject);
begin
//  if  edtPesquisa.Text = '' then
//  begin
//  ShowMessage('Digite algo para consultar...');
//  cbb1.SetFocus;
//  end
//  else
//  begin
  with frmprincipal.QryLancamentos do
  begin
    Close;
    SQL.Clear;
     case cbb1.ItemIndex of
     0: begin
         SQL.Add('Select * from lancamentos where id = ' + edtPesquisa.Text);
        end;
     1: begin
         SQL.Add('Select * from lancamentos where km LIKE ' + QuotedStr( '%' + edtPesquisa.Text + '%' ));
        end;
     2: begin
         //SQL.Add('Select * from venda where DATAEMISSAO LIKE ' + QuotedStr( '%' + edtPesquisa.Text + '%' ));
         SQL.Add('Select * from lancamentos where 1 = 1  ');
         SQL.Add(' and DATA >= :DATAINICIAL');
         SQL.Add(' and DATA <= :DATAFINAL');
         ParamByName('DATAINICIAL').AsDate:=DateEdit1.Date;
         ParamByName('DATAFINAL').AsDate := DateEdit2.date;
         //ParamByName('DATAFINAL').AsDate := StrToDate(MaskEdit1.Text);
         //ParamByName('DATAFINAL').AsDate := StrToDate(MaskEdit2.Text);
        end;
     3: begin
        SQL.Add('Select * from lancamentos ');
     end;
     end;
     Open;
     Label7.Caption := IntToStr(RecordCount);
     if frmprincipal.QryLancamentos.RecordCount = 0 then
     ShowMessage('Registro não encontrado....');
     //btnlimpar.Enabled   := True;
     btnimprimir.Enabled := True;
     //edtPesquisa.SetFocus;
     habilitarbotoes;
    end;
  end;
//end;

procedure Tfrmconveiculo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   frmprincipal.QryLancamentos.Close;
end;

procedure Tfrmconveiculo.btnsalvarClick(Sender: TObject);
begin

// Código para salvar registros..................

 if  codveiculo.Text = '' then
  begin
  ShowMessage('Digite ou consulte código de veiculo para continuar...');
  codveiculo.SetFocus;
  end
  else
  with DmBasedados.Qry do
  begin
    Close;
    SQL.Add('INSERT INTO lancamentos');
    SQL.Add('(data, km, proximokm, idveiculo)');
    SQL.Add('values (:pdata, :pkm, :pproximokm, :pidveiculo)');
    ParamByName('pdata').AsDateTime := StrToDate(edtdata.Text);
    ParamByName('pidveiculo').AsString := codveiculo.Text;
    ParamByName('pkm').AsString := edtkm.Text;
    ParamByName('pproximokm').AsString := edtproxkm.Text;
    ExecSQL;
    ShowMessage('Registro inserido com sucesso....');
    limparedits;
    habilitarbotoes;
    PageControl1.ActivePage := TabSheet2;
  end;
end;
procedure Tfrmconveiculo.habilitarbotoes;
begin
  btnalterar.Enabled := True;
  btnexcluir.Enabled := True;
  btnimprimir.Enabled:= True;
end;

procedure Tfrmconveiculo.limparedits;
begin
  edtcodigo.Clear;
  edtkm.Clear;
  edtdata.Clear;
  edtproxkm.Clear;
  codveiculo.Clear;
  edtresultado.Clear;
  codveiculo.SetFocus;
end;

function Tfrmconveiculo.DescricaoVeiculo(aValue: Integer): String;
begin
  qry.close;
	qry.SQL.Clear;
	qry.SQL.Add('SELECT NOME FROM VEICULOS WHERE ID = :ID');
	qry.ParamByName('ID').AsInteger := aValue;
	qry.Open;

	Result := qry.FieldByName('NOME').AsString;
end;

procedure Tfrmconveiculo.codveiculoExit(Sender: TObject);
begin
  if codveiculo.Text = '' then
  begin
  ShowMessage('Digite um código para processegir');
 // codveiculo.SetFocus;
  end
  else
  begin
  edtresultado.text := DescricaoVeiculo(StrToInt(codveiculo.text));
  end;
end;

procedure Tfrmconveiculo.Button1Click(Sender: TObject);
begin
   frmlocveiculo := Tfrmlocveiculo.Create(Application);
   frmlocveiculo.Show;
end;
procedure Tfrmconveiculo.DBGrid1CellClick(Column: TColumn);
begin
  PageControl1.ActivePageIndex  := 0;
  frmconveiculo.edtcodigo.Text  := DBGrid1.Fields[0].Value;
  frmconveiculo.codveiculo.Text := DBGrid1.Fields[1].Value;
  frmconveiculo.edtdata.Text    := DBGrid1.Fields[2].Value;
  frmconveiculo.edtkm.Text      := DBGrid1.Fields[3].Value;
  frmconveiculo.edtproxkm.Text  := DBGrid1.Fields[4].Value;

  { Retonnar o valor do código do veiculo }

  edtresultado.text := DescricaoVeiculo(StrToInt(codveiculo.text));
  //edtcodigo.SetFocus;
end;

procedure Tfrmconveiculo.btnalterarClick(Sender: TObject);
begin
   with frmprincipal.QryLancamentos do
   begin

     Close;
     SQL.Clear;
     SQL.Add('update lancamentos set  km = :km, proximokm = :proximokm, idveiculo = :idveiculo ');
     SQL.Add('where id = :id');
     ParamByName('km').AsString := edtkm.Text;
     ParamByName('proximokm').AsString := edtproxkm.Text;
     ParamByName('idveiculo').AsInteger := StrToInt(codveiculo.Text);
     ParamByName('id').AsInteger := StrToInt(edtcodigo.Text);
      try
        ExecSQL;
         ShowMessage('Atualizado com sucesso');
      except on E:Exception do
        ShowMessage('Erro ao atualizar o registro');
      end;
   end;
 PageControl1.ActivePage := TabSheet2;
 btnlocalizarClick(sender);

end;

procedure Tfrmconveiculo.btnexcluirClick(Sender: TObject);
begin
    with frmprincipal.QryLancamentos do
   begin

     Close;
     SQL.Clear;
     SQL.Add('delete from lancamentos where id = :id');
     ParamByName('id').AsInteger := StrToInt(edtcodigo.Text);
      try
        ExecSQL;
         ShowMessage('Excluido com seucesso');
      except on E:Exception do
        ShowMessage('Erro ao Excluir o registro');
      end;
   end;
 PageControl1.ActivePage := TabSheet2;
 btnlocalizarClick(sender);
 limparedits;

end;

procedure Tfrmconveiculo.btnimprimirClick(Sender: TObject);
begin
  frmopcoesrelatorios.RLReport1.Preview;
end;

procedure Tfrmconveiculo.FormKeyPress(Sender: TObject; var Key: Char);
begin
 //verifica se a tecla pressionada é a tecla ENTER, conhecida pelo Delphi como #13
  If key = #13 then
  Begin
//se for, passa o foco para o próximo campo, zerando o valor da variável Key
  Key:= #0;
  Perform(Wm_NextDlgCtl,0,0);
end;
end;
procedure Tfrmconveiculo.cbb1Click(Sender: TObject);
begin
   case cbb1.ItemIndex of
     0: begin
      edtPesquisa.Visible := True;
      end;
     1: begin
      edtPesquisa.Visible := True;
      end;
     2: begin
      edtPesquisa.Visible := False;
     end;
     3: begin
      edtPesquisa.Visible := True;
      end;
end;
end;
end.

