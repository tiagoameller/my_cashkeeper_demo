object foMain: TfoMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'CashKeeper my demo'
  ClientHeight = 319
  ClientWidth = 266
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object buConnect: TButton
    Left = 16
    Top = 20
    Width = 75
    Height = 25
    Caption = 'Connect'
    Default = True
    TabOrder = 0
    OnClick = buConnectClick
  end
  object buDisconnect: TButton
    Left = 178
    Top = 280
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Disconnect'
    TabOrder = 16
    OnClick = buDisconnectClick
  end
  object edIP: TEdit
    Left = 97
    Top = 22
    Width = 121
    Height = 21
    TabStop = False
    TabOrder = 1
    Text = 'localhost'
  end
  object buCharge: TButton
    Left = 16
    Top = 57
    Width = 75
    Height = 25
    Caption = 'Charge'
    TabOrder = 2
    OnClick = buChargeClick
  end
  object byPay: TButton
    Left = 16
    Top = 94
    Width = 75
    Height = 25
    Caption = 'Pay'
    TabOrder = 3
  end
  object buAddChange: TButton
    Left = 16
    Top = 131
    Width = 75
    Height = 25
    Caption = 'AddChange'
    TabOrder = 4
  end
  object buConfiguration: TButton
    Left = 16
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Configuration'
    TabOrder = 5
  end
  object buChange: TButton
    Left = 16
    Top = 205
    Width = 75
    Height = 25
    Caption = 'Change'
    TabOrder = 6
  end
  object buCBControl: TButton
    Left = 16
    Top = 242
    Width = 75
    Height = 25
    Caption = 'CBControl'
    TabOrder = 7
  end
  object buPaySpecific: TButton
    Left = 16
    Top = 280
    Width = 75
    Height = 25
    Caption = 'PaySpecific'
    TabOrder = 8
  end
  object buGetLevels: TButton
    Left = 97
    Top = 94
    Width = 75
    Height = 25
    Caption = 'GetLevels'
    TabOrder = 9
  end
  object buBlidCashBox: TButton
    Left = 97
    Top = 131
    Width = 75
    Height = 25
    Caption = 'BlidCashBox'
    TabOrder = 10
  end
  object buZByAmount: TButton
    Left = 97
    Top = 168
    Width = 75
    Height = 25
    Caption = 'ZByAmount'
    TabOrder = 11
  end
  object buEmptyCB: TButton
    Left = 97
    Top = 205
    Width = 75
    Height = 25
    Caption = 'EmptyCB'
    TabOrder = 12
  end
  object buGetAmounts: TButton
    Left = 178
    Top = 94
    Width = 75
    Height = 25
    Caption = 'GetAmounts'
    TabOrder = 13
  end
  object buErrorTest: TButton
    Left = 178
    Top = 131
    Width = 75
    Height = 25
    Caption = 'ErrorTest'
    TabOrder = 14
  end
  object buColor: TButton
    Left = 178
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Color'
    TabOrder = 15
    OnClick = buColorClick
  end
  object edAmount: TEdit
    Left = 97
    Top = 59
    Width = 121
    Height = 21
    TabStop = False
    TabOrder = 17
    Text = '350'
  end
end
