object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 629
  ClientWidth = 1083
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 32
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 32
    Top = 336
    Width = 489
    Height = 265
    ItemHeight = 13
    TabOrder = 1
  end
  object Button2: TButton
    Left = 440
    Top = 305
    Width = 75
    Height = 25
    Caption = #36830#25509
    TabOrder = 2
    OnClick = Button2Click
  end
  object DBGrid1: TDBGrid
    Left = 544
    Top = 344
    Width = 531
    Height = 217
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object FDConnection1: TFDConnection
    Left = 472
    Top = 152
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Program Files (x' +
      '86)\qqjilu\763672354\FileRecv\'#36130#21153#31649#29702#31995#32479'.mdb;Persist Security Info=F' +
      'alse;'
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 248
    Top = 208
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from '#31185#30446#34920)
    Left = 640
    Top = 240
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 784
    Top = 256
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 760
    Top = 160
  end
end
