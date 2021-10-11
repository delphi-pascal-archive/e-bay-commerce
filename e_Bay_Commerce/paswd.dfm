object Form4: TForm4
  Left = 279
  Top = 119
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1042#1074#1086#1076' '#1087#1072#1088#1086#1083#1103
  ClientHeight = 32
  ClientWidth = 249
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Edit2: TEdit
    Left = 13
    Top = 0
    Width = 157
    Height = 24
    TabOrder = 2
    Visible = False
  end
  object Button1: TButton
    Left = 182
    Top = 7
    Width = 61
    Height = 20
    Caption = 'OK'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 7
    Top = 7
    Width = 169
    Height = 24
    PasswordChar = '*'
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object RichEdit1: TRichEdit
    Left = 7
    Top = 52
    Width = 234
    Height = 72
    TabOrder = 3
    Visible = False
    WordWrap = False
  end
end
