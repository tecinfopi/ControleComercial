unit u_abertura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, RxCtrls, ComCtrls, Gauges, frxpngimage;

type
  Tfrmabertura = class(TForm)
    RxPanel1: TRxPanel;
    Image1: TImage;
    Gauge1: TGauge;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmabertura: Tfrmabertura;

implementation

{$R *.dfm}

end.
