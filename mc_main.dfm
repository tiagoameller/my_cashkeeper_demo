object foMain: TfoMain
  Left = 0
  Top = 0
  Hint = 'asdf'
  BorderStyle = bsDialog
  Caption = 'CashKeeper my demo'
  ClientHeight = 319
  ClientWidth = 307
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
    Width = 90
    Height = 25
    Hint = 
      'If you connect to the CSSI located on your own computer, you onl' +
      'y need to call the Connect method. If you connect to the CSSI lo' +
      'cated on another computer, you need to inform the IP property wi' +
      'th the ip address or the network name of the computer that has p' +
      'hysically the CashKeeper attached. Then call the Connect method.'
    Caption = 'Connect'
    Default = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = buConnectClick
  end
  object buDisconnect: TButton
    Left = 210
    Top = 280
    Width = 90
    Height = 25
    Cancel = True
    Caption = 'Disconnect'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    OnClick = buDisconnectClick
  end
  object edIP: TEdit
    Left = 113
    Top = 22
    Width = 90
    Height = 21
    TabStop = False
    TabOrder = 1
    Text = 'localhost'
  end
  object buCharge: TButton
    Left = 16
    Top = 57
    Width = 90
    Height = 25
    Hint = 'Open a screen for the payment amount in cents'
    Caption = 'Charge'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = buChargeClick
  end
  object byPay: TButton
    Left = 16
    Top = 94
    Width = 90
    Height = 25
    Hint = 
      'Opens a screen that reports on the amount payment process in cen' +
      'ts.'
    Caption = 'Pay'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = byPayClick
  end
  object buAddChange: TButton
    Left = 16
    Top = 131
    Width = 90
    Height = 25
    Hint = 'Opens a screen that allows adding change to CashKeeper.'
    Caption = 'AddChange'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = buAddChangeClick
  end
  object buConfiguration: TButton
    Left = 16
    Top = 168
    Width = 90
    Height = 25
    Hint = 
      'The Configuration function opens a screen where it can be define' +
      'd some parameters which allows adapting the CashKeeper functioni' +
      'ng to the client operation.'
    Caption = 'Configuration'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = buConfigurationClick
  end
  object buChange: TButton
    Left = 16
    Top = 205
    Width = 90
    Height = 25
    Hint = 
      'The Change function opens a screen that allows you to insert mon' +
      'ey and choose that way you want to be returned. It should be rem' +
      'ind that in an installation with CashKeeper there is no money ca' +
      'sh to give change for the tobacco machine, fairground, etc. Retu' +
      'rns the entered and the paid amount.'
    Caption = 'Change'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = buChangeClick
  end
  object buCBControl: TButton
    Left = 16
    Top = 242
    Width = 90
    Height = 25
    Hint = 
      'The CashBoxControl function allows the application to control th' +
      'e processes of end of day, configurate the acceptance/rejection ' +
      'of different denominations, empty cashboxes, completely empty av' +
      'ailable change to the collection cashboxes, set the initial amou' +
      'nts, etc. It includes several options without graphical interfac' +
      'e, in the case that the application already have an own screen'
    Caption = 'CashBoxControl'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object buPaySpecific: TButton
    Left = 16
    Top = 280
    Width = 90
    Height = 25
    Caption = 'PaySpecific'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object buGetLevels: TButton
    Left = 113
    Top = 94
    Width = 90
    Height = 25
    Caption = 'GetLevels'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
  end
  object buBlidCashBox: TButton
    Left = 113
    Top = 131
    Width = 90
    Height = 25
    Caption = 'BlidCashBox'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object buZByAmount: TButton
    Left = 113
    Top = 168
    Width = 90
    Height = 25
    Caption = 'ZByAmount'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object buEmptyCB: TButton
    Left = 113
    Top = 205
    Width = 90
    Height = 25
    Caption = 'EmptyCB'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
  end
  object buGetAmounts: TButton
    Left = 210
    Top = 94
    Width = 90
    Height = 25
    Caption = 'GetAmounts'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
  end
  object buErrorTest: TButton
    Left = 210
    Top = 131
    Width = 90
    Height = 25
    Caption = 'ErrorTest'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
  end
  object buColor: TButton
    Left = 210
    Top = 168
    Width = 90
    Height = 25
    Caption = 'Color'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
    OnClick = buColorClick
  end
  object edAmount: TEdit
    Left = 113
    Top = 59
    Width = 90
    Height = 21
    TabStop = False
    TabOrder = 17
    Text = '350'
  end
  object ApplicationEvents1: TApplicationEvents
    OnShowHint = ApplicationEvents1ShowHint
    Left = 240
    Top = 16
  end
end
