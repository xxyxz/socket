inherited frmServerChatRoom: TfrmServerChatRoom
  Caption = 'frmServerChatRoom'
  PixelsPerInch = 96
  TextHeight = 13
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 552
    Top = 24
  end
  object IdTCPServer1: TIdTCPServer
    Active = True
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 1024
      end>
    DefaultPort = 1024
    OnConnect = IdTCPServer1Connect
    OnDisconnect = IdTCPServer1Disconnect
    OnExecute = IdTCPServer1Execute
    Left = 552
    Top = 72
  end
end
