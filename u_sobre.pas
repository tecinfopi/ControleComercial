unit u_sobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RxCtrls, ExtCtrls, jpeg, ShellAPI,
  frxpngimage;

type
  Tfrmsobre = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    btnok: TRxAnimBitBtn;
    lbnet: TLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnokClick(Sender: TObject);
    procedure lbnetDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmsobre: Tfrmsobre;

implementation

uses
  u_principal;

{$R *.dfm}

procedure Tfrmsobre.btnokClick(Sender: TObject);
begin
  close;
end;
procedure Tfrmsobre.lbnetDblClick(Sender: TObject);
begin
   ShellExecute(Handle,
               'open',
               'http://valdecyinformatica.ga',
               nil,
               nil,
               SW_SHOWMAXIMIZED);
end;

end.
