inherited frmClientChatRoom: TfrmClientChatRoom
  Caption = 'frmClientChatRoom'
  FormStyle = fsMDIForm
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTop: TPanel
    Color = 16382457
  end
  inherited pnlMain: TPanel
    inherited pnlLeft: TPanel
      Color = 16382457
      inherited grdUsers: TcxGrid
        Top = 96
        Height = 443
        inherited vwUsers: TcxGridBandedTableView
          Styles.Background = frmConversation.cxStyle1
          Styles.Content = frmConversation.cxStyle2
          inherited vwUsersIMAGE: TcxGridBandedColumn
            Width = 36
          end
        end
      end
      inherited Panel1: TPanel
        Height = 49
        Color = 16382457
        inherited cxImage: TcxImage
          Height = 47
        end
        inherited lblUser: TcxLabel
          Top = 15
          Style.IsFontAssigned = True
        end
        inherited btnMore: TcxButton
          Height = 47
        end
      end
      inherited cxLabel1: TcxLabel
        Top = 59
        ParentColor = False
        Style.Color = 16382457
      end
    end
  end
  inherited pnlBottom: TPanel
    Color = 16382457
  end
  inherited splitterBottom: TcxSplitter
    Color = 16382457
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
