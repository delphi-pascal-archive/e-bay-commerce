object Form1: TForm1
  Left = 219
  Top = 130
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'e-Bay Commerce'
  ClientHeight = 622
  ClientWidth = 657
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 65
    Width = 51
    Height = 13
    Caption = #1052#1086#1103' '#1094#1077#1085#1072':'
  end
  object Label3: TLabel
    Left = 388
    Top = 65
    Width = 79
    Height = 13
    Caption = #1062#1077#1085#1072' '#1076#1086#1089#1090#1072#1074#1082#1080':'
  end
  object Label4: TLabel
    Left = 20
    Top = 153
    Width = 82
    Height = 13
    Caption = 'E-mail '#1087#1088#1086#1076#1072#1074#1094#1072':'
  end
  object Label5: TLabel
    Left = 20
    Top = 127
    Width = 65
    Height = 13
    Caption = 'ID '#1087#1088#1086#1076#1072#1074#1094#1072':'
  end
  object Label6: TLabel
    Left = 20
    Top = 179
    Width = 108
    Height = 13
    Cursor = crHandPoint
    Caption = #1057#1089#1099#1083#1082#1072' '#1085#1072' '#1087#1088#1086#1076#1072#1074#1094#1072':'
    ParentShowHint = False
    ShowHint = True
    OnClick = Label6Click
    OnMouseMove = Label6MouseMove
  end
  object Label7: TLabel
    Left = 20
    Top = 205
    Width = 89
    Height = 13
    Cursor = crHandPoint
    Caption = #1057#1089#1099#1083#1082#1072' '#1085#1072' '#1090#1086#1074#1072#1088':'
    ParentShowHint = False
    ShowHint = True
    OnClick = Label7Click
    OnMouseMove = Label7MouseMove
  end
  object Label11: TLabel
    Left = 20
    Top = 13
    Width = 117
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072':'
  end
  object Label19: TLabel
    Left = 20
    Top = 39
    Width = 205
    Height = 13
    Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1083#1086#1090#1072':'
  end
  object Label20: TLabel
    Left = 20
    Top = 231
    Width = 66
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103':'
  end
  object Label21: TLabel
    Left = 512
    Top = 38
    Width = 86
    Height = 13
    Caption = 'Date/Time is...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 20
    Top = 114
    Width = 618
    Height = 5
    Shape = bsTopLine
  end
  object Label26: TLabel
    Left = 20
    Top = 91
    Width = 131
    Height = 13
    Caption = #1062#1077#1085#1072' '#1074' '#1053#1072#1096#1080#1093' '#1084#1072#1075#1072#1079#1080#1085#1072#1093':'
  end
  object Label28: TLabel
    Left = 297
    Top = 91
    Width = 163
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1090#1086#1074#1072#1088#1072' '#1085#1072' '#1088#1091#1082#1080':'
  end
  object Memo3: TMemo
    Left = 13
    Top = 325
    Width = 150
    Height = 59
    ScrollBars = ssBoth
    TabOrder = 15
    Visible = False
  end
  object RichEdit1: TRichEdit
    Left = 455
    Top = 361
    Width = 194
    Height = 69
    HideScrollBars = False
    ScrollBars = ssBoth
    TabOrder = 12
    Visible = False
    WordWrap = False
  end
  object RichEdit2: TRichEdit
    Left = 455
    Top = 441
    Width = 194
    Height = 67
    HideScrollBars = False
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 13
    Visible = False
    WordWrap = False
  end
  object Edit2: TEdit
    Left = 240
    Top = 34
    Width = 257
    Height = 24
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 85
    Top = 60
    Width = 196
    Height = 24
    BiDiMode = bdLeftToRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 480
    Top = 60
    Width = 158
    Height = 24
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 156
    Top = 8
    Width = 456
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    OnSelect = ComboBox1Select
  end
  object Edit6: TEdit
    Left = 156
    Top = 121
    Width = 482
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object Edit7: TEdit
    Left = 156
    Top = 147
    Width = 482
    Height = 24
    TabOrder = 7
  end
  object GroupBox1: TGroupBox
    Left = 20
    Top = 286
    Width = 618
    Height = 326
    Caption = ' '#1052#1086#1080' '#1083#1080#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnMouseMove = GroupBox1MouseMove
    object Label8: TLabel
      Left = 255
      Top = 27
      Width = 48
      Height = 13
      Caption = 'ID/'#1083#1086#1075#1080#1085':'
    end
    object Label12: TLabel
      Left = 60
      Top = 27
      Width = 31
      Height = 13
      Caption = 'E-mail:'
    end
    object Label13: TLabel
      Left = 456
      Top = 27
      Width = 41
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100':'
    end
    object Label10: TLabel
      Left = 13
      Top = 26
      Width = 37
      Height = 13
      Cursor = crHandPoint
      Caption = 'e-Bay:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = True
      OnClick = Label10Click
      OnMouseMove = Label10MouseMove
    end
    object Label27: TLabel
      Left = 13
      Top = 51
      Width = 141
      Height = 13
      Caption = #1055#1086#1083#1077#1079#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Alphabet: TEdit
      Left = 338
      Top = 57
      Width = 111
      Height = 24
      TabOrder = 6
      Visible = False
    end
    object Edit8: TEdit
      Left = 104
      Top = 20
      Width = 137
      Height = 24
      TabOrder = 0
    end
    object Edit9: TEdit
      Left = 312
      Top = 20
      Width = 131
      Height = 24
      TabOrder = 1
    end
    object Edit10: TEdit
      Left = 507
      Top = 20
      Width = 98
      Height = 24
      TabOrder = 2
    end
    object Button2: TButton
      Left = 253
      Top = 57
      Width = 73
      Height = 20
      Caption = 'Open "*.eby"'
      TabOrder = 4
      Visible = False
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 462
      Top = 57
      Width = 72
      Height = 20
      Caption = 'Save "*.eby"'
      TabOrder = 5
      Visible = False
      OnClick = Button3Click
    end
    object Memo2: TMemo
      Left = 13
      Top = 72
      Width = 588
      Height = 241
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 3
      OnMouseMove = Memo2MouseMove
    end
  end
  object Edit15: TEdit
    Left = 156
    Top = 173
    Width = 482
    Height = 24
    TabOrder = 8
  end
  object Edit16: TEdit
    Left = 156
    Top = 199
    Width = 482
    Height = 24
    TabOrder = 9
  end
  object Edit20: TEdit
    Left = 163
    Top = 86
    Width = 118
    Height = 24
    TabOrder = 4
  end
  object Edit21: TEdit
    Left = 480
    Top = 86
    Width = 158
    Height = 24
    TabOrder = 5
  end
  object Edit13: TEdit
    Left = 20
    Top = 254
    Width = 39
    Height = 24
    TabOrder = 14
    Visible = False
  end
  object UpDown1: TUpDown
    Left = 622
    Top = 7
    Width = 16
    Height = 20
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    OnClick = UpDown1Click
  end
  object Memo1: TMemo
    Left = 156
    Top = 225
    Width = 482
    Height = 49
    ScrollBars = ssVertical
    TabOrder = 10
    OnMouseMove = Memo1MouseMove
  end
  object MainMenu1: TMainMenu
    Left = 256
    object N1: TMenuItem
      Caption = '  '#1060#1072#1081#1083'  '
      object N2: TMenuItem
        Caption = #1053#1086#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
        OnClick = N2Click
      end
      object N4: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082' ...'
        OnClick = N4Click
      end
      object N8: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100'...'
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object MicrosoftWord1: TMenuItem
        Caption = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1086#1090#1095#1077#1090
        OnClick = MicrosoftWord1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object N7: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N7Click
      end
    end
    object N3: TMenuItem
      Caption = ' '#1055#1072#1088#1086#1083#1100' '
      object N6: TMenuItem
        Caption = #1057#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100'...'
        OnClick = N6Click
      end
      object N10: TMenuItem
        Caption = #1047#1072#1087#1088#1072#1096#1080#1074#1072#1090#1100' '#1074#1074#1086#1076' '#1087#1072#1088#1086#1083#1103
        OnClick = N10Click
      end
      object N11: TMenuItem
        Caption = #1053#1077' '#1079#1072#1087#1088#1072#1096#1080#1074#1072#1090#1100' '#1074#1074#1086#1076' '#1087#1072#1088#1086#1083#1103
        OnClick = N11Click
      end
    end
    object N12: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      OnClick = N12Click
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 432
  end
  object Table1: TTable
    TableType = ttParadox
    Left = 464
  end
  object SaveDialog1: TSaveDialog
    Filter = #1044#1086#1082#1091#1084#1077#1085#1090#1099' Word|*.doc'
    Left = 304
  end
  object WordApplication1: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 352
  end
  object WordDocument1: TWordDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 384
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 208
  end
  object BDE321: TBDE32
    LocalShare = False
    PdxNetDir = 'K:\'
    MaxBufSize = 2048
    MaxFileHandles = 48
    MemSize = 16
    SharedMemSize = 2048
    Left = 512
  end
  object PopupMenu1: TPopupMenu
    Left = 560
    object ljkj1: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1072#1076#1088#1077#1089' '#1089#1089#1099#1083#1082#1080
      OnClick = ljkj1Click
    end
  end
end
