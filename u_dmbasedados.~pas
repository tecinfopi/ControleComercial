unit u_dmbasedados;

interface

uses
  SysUtils, Classes, ZAbstractConnection, ZConnection, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDmBasedados = class(TDataModule)
    Xerife: TZConnection;
    QryConVei: TZQuery;
    DSConveiculos: TDataSource;
    QryUser: TZQuery;
    DSuser: TDataSource;
    intgrfldQryUserID_USER: TIntegerField;
    strngfldQryUserNOME: TStringField;
    strngfldQryUserLOGIN: TStringField;
    strngfldQryUserSENHA: TStringField;
    dtfldQryUserDATA: TDateField;
    strngfldQryUserOBS: TStringField;
    QryLancamentos: TZQuery;
    Dslancamentos: TDataSource;
    Qry: TZQuery;
    DSqry: TDataSource;
    QryGrupos: TZQuery;
    DSgrupos: TDataSource;
    QryConGrup: TZQuery;
    DSConGrup: TDataSource;
    QryCadUsers: TZQuery;
    DSCadUsers: TDataSource;
    QryCadUsersID_USER: TIntegerField;
    QryCadUsersNOME: TStringField;
    QryCadUsersLOGIN: TStringField;
    QryCadUsersSENHA: TStringField;
    QryCadUsersDATA: TDateField;
    QryCadUsersOBS: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmBasedados: TDmBasedados;

implementation

uses
  u_consultaveiculos, u_login, u_principal, u_conveiculo, U_RelGrupos, u_cadusuarios;

{$R *.dfm}

end.
