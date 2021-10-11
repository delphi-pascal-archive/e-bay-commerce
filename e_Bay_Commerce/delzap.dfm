object Form2: TForm2
  Left = 762
  Top = 120
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1079#1087#1080#1089#1080
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
  object Button1: TButton
    Left = 7
    Top = 319
    Width = 293
    Height = 20
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 7
    Top = 7
    Width = 293
    Height = 306
    ItemHeight = 13
    Sorted = True
    TabOrder = 1
    OnDblClick = ListBox1DblClick
  end
  object Button2: TButton
    Left = 182
    Top = 280
    Width = 106
    Height = 20
    Caption = 'View all records'
    TabOrder = 2
    Visible = False
    OnClick = Button2Click
  end
end
