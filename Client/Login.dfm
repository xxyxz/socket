object frmLogin: TfrmLogin
  Left = 675
  Top = 262
  BorderStyle = bsDialog
  Caption = 'Connect'
  ClientHeight = 141
  ClientWidth = 194
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
  OnCreate = FormCreate
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
    Style.Color = 16776178
    TabOrder = 0
    Height = 141
    Width = 194
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
      Top = 53
      Width = 22
      Height = 13
      Caption = 'User'
      Transparent = True
    end
    object eIp: TEdit
      Left = 48
      Top = 13
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '10.1.3.78'
    end
    object eNick: TEdit
      Left = 48
      Top = 50
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'User'
    end
    object bLogin: TcxButton
      Left = 16
      Top = 92
      Width = 153
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
