object Form2: TForm2
  AlignWithMargins = True
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1057#1087#1088#1072#1074#1082#1072
  ClientHeight = 224
  ClientWidth = 272
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 59
    Top = 8
    Width = 157
    Height = 19
    Caption = 'Screen Changer v.2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 71
    Top = 193
    Width = 124
    Height = 23
    Caption = #1054#1050
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 33
    Width = 256
    Height = 154
    Alignment = taCenter
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1087#1077#1088#1077#1073#1088#1072#1089#1099#1074#1072#1077#1090' '#1087#1086' '#1095#1072#1089#1086#1074#1086#1081
      #1089#1090#1088#1077#1083#1082#1077' '#1082#1091#1088#1089#1086#1088' '#1087#1086' '#1084#1086#1085#1080#1090#1086#1088#1072#1084
      #1074' '#1089#1083#1091#1095#1072#1077', '#1077#1089#1083#1080' '#1080#1093' '#1073#1086#1083#1100#1096#1077' '#1086#1076#1085#1086#1075#1086'.'
      #1050#1091#1088#1089#1086#1088' '#1091#1089#1090#1072#1085#1072#1074#1083#1080#1074#1072#1077#1090#1089#1103' '#1074' '#1094#1077#1085#1090#1088' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086
      #1084#1086#1085#1080#1090#1086#1088#1072'.'
      #1053#1072#1087#1080#1089#1072#1085#1072' '#1076#1083#1103' '#1057#1077#1088#1077#1075#1080
      ''
      #1051#1080#1094#1077#1085#1079#1080#1103': GNU General Public License v. 3'
      #1040#1074#1090#1086#1088' - Zhbert'
      'GitHub '#1087#1088#1086#1077#1082#1090#1072': '
      'https://github.com/Zhbert/ScreenChanger')
    ParentFont = False
    TabOrder = 1
  end
end
