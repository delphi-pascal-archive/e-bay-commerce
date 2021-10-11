object Form3: TForm3
  Left = 278
  Top = 118
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'...'
  ClientHeight = 344
  ClientWidth = 306
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 7
    Top = 299
    Width = 107
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1080#1084#1103' '#1079#1072#1087#1080#1089#1080':'
  end
  object ListBox1: TListBox
    Left = 7
    Top = 7
    Width = 293
    Height = 280
    ItemHeight = 13
    Sorted = True
    TabOrder = 2
    OnClick = ListBox1Click
    OnDblClick = ListBox1DblClick
  end
  object Button1: TButton
    Left = 7
    Top = 319
    Width = 293
    Height = 20
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 182
    Top = 254
    Width = 106
    Height = 20
    Caption = 'View all records'
    TabOrder = 3
    Visible = False
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 78
    Top = 254
    Width = 98
    Height = 24
    TabOrder = 4
    Visible = False
  end
  object Edit2: TEdit
    Left = 130
    Top = 293
    Width = 170
    Height = 24
    TabOrder = 0
  end
end
