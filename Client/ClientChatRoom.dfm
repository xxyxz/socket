inherited frmClientChatRoom: TfrmClientChatRoom
  Caption = 'frmClientChatRoom'
  FormStyle = fsMDIForm
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTop: TPanel
    TabOrder = 3
  end
  inherited pnlMain: TPanel
    inherited pnlLeft: TPanel
      inherited grdUsers: TcxGrid
        TabOrder = 2
      end
    end
  end
  inherited pnlBottom: TPanel
    TabOrder = 0
  end
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
