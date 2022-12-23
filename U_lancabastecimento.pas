unit U_lancabastecimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls;

type
  Tfrmlancabastecimento = class(TForm)
    PageControl1: TPageControl;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmlancabastecimento: Tfrmlancabastecimento;

implementation

{$R *.dfm}

procedure Tfrmlancabastecimento.FormKeyPress(Sender: TObject;
  var Key: Char);
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
