object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 723
  ClientWidth = 924
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 924
    Height = 723
    Align = alClient
    Caption = 'Panel1'
    Color = clWhite
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 922
      Height = 129
      Align = alTop
      Caption = #25968#25454#24211#37197#32622
      TabOrder = 0
      object PageControl1: TPageControl
        Left = 2
        Top = 15
        Width = 918
        Height = 112
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = 'MySQL'
          object Label1: TLabel
            Left = 16
            Top = 6
            Width = 10
            Height = 13
            Caption = 'IP'
          end
          object Label2: TLabel
            Left = 256
            Top = 6
            Width = 55
            Height = 13
            Caption = 'Datasource'
          end
          object Label3: TLabel
            Left = 3
            Top = 38
            Width = 47
            Height = 13
            Caption = 'username'
          end
          object Label4: TLabel
            Left = 256
            Top = 38
            Width = 46
            Height = 13
            Caption = 'password'
          end
          object ipEdt: TEdit
            Left = 77
            Top = 3
            Width = 121
            Height = 21
            TabOrder = 0
            Text = '127.0.0.1'
          end
          object datasourceEdt: TEdit
            Left = 317
            Top = 3
            Width = 121
            Height = 21
            TabOrder = 1
            Text = 'db_jxc'
          end
          object usernameEdt: TEdit
            Left = 77
            Top = 38
            Width = 121
            Height = 21
            TabOrder = 2
            Text = 'cen'
          end
          object password: TEdit
            Left = 317
            Top = 38
            Width = 121
            Height = 21
            TabOrder = 3
            Text = '1995'
          end
          object Button1: TButton
            Left = 480
            Top = 33
            Width = 75
            Height = 25
            Caption = #36830#25509
            TabOrder = 4
            OnClick = Button1Click
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'SQLite'
          ImageIndex = 1
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 130
      Width = 922
      Height = 592
      Align = alClient
      Caption = #34920#21015#34920
      TabOrder = 1
      object Panel2: TPanel
        Left = 2
        Top = 15
        Width = 918
        Height = 362
        Align = alTop
        Caption = 'Panel2'
        ShowCaption = False
        TabOrder = 0
        object Label5: TLabel
          Left = 335
          Top = 8
          Width = 40
          Height = 13
          Caption = #34920#21069#32512':'
        end
        object CheckListBox1: TCheckListBox
          Left = 1
          Top = 1
          Width = 328
          Height = 360
          Align = alLeft
          ItemHeight = 13
          TabOrder = 0
          OnClick = CheckListBox1Click
          ExplicitTop = 27
          ExplicitHeight = 337
        end
        object tableEdt: TEdit
          Left = 381
          Top = 2
          Width = 121
          Height = 21
          TabOrder = 1
          Text = 'T'
        end
        object Button2: TButton
          Left = 839
          Top = -9
          Width = 75
          Height = 25
          Caption = #29983#25104
          TabOrder = 2
          Visible = False
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 596
          Top = 0
          Width = 75
          Height = 25
          Caption = #29983#25104
          TabOrder = 3
          OnClick = Button3Click
        end
        object zjCheck: TCheckBox
          Left = 519
          Top = 4
          Width = 71
          Height = 17
          Caption = #29983#25104#27880#35299
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object ListBox1: TListBox
          Left = 376
          Top = 88
          Width = 233
          Height = 249
          ItemHeight = 13
          TabOrder = 5
        end
      end
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=db_jxc'
      'User_Name=cen'
      'Password=1995'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 584
    Top = 304
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 699
    Top = 329
  end
  object FDTable1: TFDTable
    Connection = FDConnection1
    Left = 731
    Top = 257
  end
end
