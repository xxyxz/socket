object frmLogin: TfrmLogin
  Left = 675
  Top = 262
  BorderStyle = bsDialog
  Caption = 'Connect'
  ClientHeight = 112
  ClientWidth = 228
  Color = 16776178
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    ParentBackground = False
    ParentColor = False
    Style.BorderStyle = ebsNone
    Style.Color = clSkyBlue
    TabOrder = 0
    Height = 112
    Width = 228
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 10
      Height = 13
      Caption = 'IP'
      Transparent = True
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 22
      Height = 13
      Caption = 'Nick'
      Transparent = True
    end
    object eIp: TEdit
      Left = 16
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '10.1.3.78'
    end
    object eNick: TEdit
      Left = 16
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'User'
    end
    object bLogin: TcxButton
      Left = 144
      Top = 68
      Width = 75
      Height = 29
      Caption = 'Connect'
      TabOrder = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = bLoginClick
    end
  end
end
