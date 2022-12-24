object DmBasedados: TDmBasedados
  OldCreateOrder = False
  Left = 433
  Top = 131
  Height = 512
  Width = 479
  object Xerife: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = True
    Properties.Strings = (
      'AutoEncodeStrings=ON'
      'controls_cp=GET_ACP')
    Connected = True
    HostName = '127.0.0.1'
    Port = 3050
    Database = 'C:\DataSoft\Banco\BANCO_TESTE.FDB'
    User = 'SYSDBA'
    Password = 'masterkey'
    Protocol = 'firebird-2.5'
    LibraryLocation = 'C:\DataSoft\fbclient.dll'
    Left = 24
    Top = 8
  end
  object QryConVei: TZQuery
    Connection = Xerife
    SQL.Strings = (
      'Select * from veiculos')
    Params = <>
    Left = 80
    Top = 8
  end
  object DSConveiculos: TDataSource
    DataSet = QryConVei
    Left = 144
    Top = 8
  end
  object QryUser: TZQuery
    Connection = Xerife
    SQL.Strings = (
      'Select * from usuarios')
    Params = <>
    Left = 80
    Top = 64
    object intgrfldQryUserID_USER: TIntegerField
      FieldName = 'ID_USER'
      Required = True
    end
    object strngfldQryUserNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object strngfldQryUserLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 15
    end
    object strngfldQryUserSENHA: TStringField
      FieldName = 'SENHA'
      Size = 6
    end
    object dtfldQryUserDATA: TDateField
      FieldName = 'DATA'
    end
    object strngfldQryUserOBS: TStringField
      FieldName = 'OBS'
      Size = 15
    end
  end
  object DSuser: TDataSource
    DataSet = QryUser
    Left = 144
    Top = 64
  end
  object QryLancamentos: TZQuery
    Connection = Xerife
    SQL.Strings = (
      'Select * from lancamentos')
    Params = <>
    Left = 80
    Top = 120
  end
  object Dslancamentos: TDataSource
    DataSet = QryLancamentos
    Left = 160
    Top = 120
  end
  object Qry: TZQuery
    Connection = Xerife
    Params = <>
    Left = 80
    Top = 184
  end
  object DSqry: TDataSource
    DataSet = Qry
    Left = 152
    Top = 184
  end
  object QryGrupos: TZQuery
    Connection = Xerife
    Params = <>
    Left = 80
    Top = 248
  end
  object DSgrupos: TDataSource
    DataSet = QryGrupos
    Left = 152
    Top = 248
  end
  object QryConGrup: TZQuery
    Connection = Xerife
    SQL.Strings = (
      'Select * from grupos')
    Params = <>
    Left = 80
    Top = 320
  end
  object DSConGrup: TDataSource
    DataSet = QryConGrup
    Left = 152
    Top = 320
  end
  object QryCadUser: TZQuery
    Connection = Xerife
    SQL.Strings = (
      '')
    Params = <>
    Left = 72
    Top = 392
  end
  object DSCadUser: TDataSource
    DataSet = QryCadUser
    Left = 144
    Top = 392
  end
end
