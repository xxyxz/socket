inherited frmClientChatRoom: TfrmClientChatRoom
  Caption = 'frmClientChatRoom'
  FormStyle = fsMDIForm
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object IdTCPClient1: TIdTCPClient
    OnConnected = IdTCPClient1Connected
    ConnectTimeout = 4000
    Host = '127.0.0.1'
    IPVersion = Id_IPv4
    Port = 1024
    ReadTimeout = 0
    Left = 664
    Top = 168
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 752
    Top = 168
  end
end
