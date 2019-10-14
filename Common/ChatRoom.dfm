object frmChatRoom: TfrmChatRoom
  Left = 0
  Top = 0
  Caption = 'frmChatRoom'
  ClientHeight = 755
  ClientWidth = 1051
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1051
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = 16382457
    ParentBackground = False
    TabOrder = 0
    Visible = False
  end
  object pnlMain: TPanel
    Left = 0
    Top = 41
    Width = 1051
    Height = 540
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object pnlLeft: TPanel
      Left = 0
      Top = 0
      Width = 297
      Height = 540
      Align = alLeft
      BevelOuter = bvNone
      Color = 16382457
      ParentBackground = False
      TabOrder = 0
      object grdUsers: TcxGrid
        AlignWithMargins = True
        Left = 1
        Top = 82
        Width = 296
        Height = 457
        Margins.Left = 1
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 1
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        object vwUsers: TcxGridBandedTableView
          DragMode = dmAutomatic
          Navigator.Buttons.ConfirmDelete = True
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Visible = False
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Last.Visible = False
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Post.Visible = True
          Navigator.Buttons.Refresh.Visible = True
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          FindPanel.ApplyInputDelay = 0
          FindPanel.HighlightSearchResults = False
          FindPanel.ShowClearButton = False
          FindPanel.UseExtendedSyntax = True
          OnSelectionChanged = vwUsersSelectionChanged
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skMax
              Column = vwUsersID
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.DragDropText = True
          OptionsBehavior.PullFocusing = True
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.InvertSelect = False
          OptionsView.ScrollBars = ssNone
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLineColor = clWhite
          OptionsView.GroupByBox = False
          OptionsView.Header = False
          OptionsView.HeaderHeight = 50
          OptionsView.BandHeaders = False
          Styles.Background = frmConversation.cxStyle3
          Styles.Content = frmConversation.cxStyle4
          Styles.Inactive = frmConversation.cxStyle4
          Bands = <
            item
              Caption = 'Reset Group'
              Width = 46
            end
            item
              Width = 250
            end>
          object vwUsersID: TcxGridBandedColumn
            Caption = 'ID'
            DataBinding.ValueType = 'Integer'
            Visible = False
            BestFitMaxWidth = 20
            Options.Editing = False
            Options.FilteringWithFindPanel = False
            Options.Focusing = False
            Options.AutoWidthSizable = False
            Options.CellMerging = True
            SortIndex = 0
            SortOrder = soAscending
            Width = 25
            Position.BandIndex = -1
            Position.ColIndex = -1
            Position.RowIndex = -1
          end
          object vwUsersUSER_NAME: TcxGridBandedColumn
            Caption = 'User Name'
            Options.Editing = False
            Options.Filtering = False
            Options.Moving = False
            SortIndex = 1
            SortOrder = soAscending
            Styles.Content = frmConversation.stBold
            Width = 185
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object vwUsersIMAGE: TcxGridBandedColumn
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Images = frmConversation.ImageList32x32
            Properties.Items = <
              item
                ImageIndex = 0
              end>
            Properties.ReadOnly = True
            Width = 47
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object vwUsersIP: TcxGridBandedColumn
            Visible = False
            Position.BandIndex = -1
            Position.ColIndex = -1
            Position.RowIndex = -1
          end
        end
        object lvlUsers: TcxGridLevel
          GridView = vwUsers
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 297
        Height = 35
        Align = alTop
        BevelEdges = [beBottom]
        BevelKind = bkTile
        BevelOuter = bvNone
        Color = 16382457
        ParentBackground = False
        TabOrder = 1
        object cxImage: TcxImage
          Left = 0
          Top = 0
          Align = alLeft
          Picture.Data = {
            0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000020
            00000020080300000044A48AC60000000373424954080808DBE14FE000000009
            704859730000085B0000085B01E89F75D00000001974455874536F6674776172
            65007777772E696E6B73636170652E6F72679BEE3C1A00000183504C5445FFFF
            FF5555AA408080666699FFFFFF496D92DBDBFF55558EE6E6E6EAEAEA515D8059
            6485556080525C85555E845861849EA7B9808899526384586080576380556081
            545F80545E81E7EEEEE7EAEEE8EBEEE8EBEB565F80E6EDED566180E8ECEE5660
            81546080556080E6ECED555F80E7ECEE566080566080555F80E4EAEBE8ECED55
            608078829A78829B848EA3868FA4747E979AA3B37780997881995560809AA2B3
            556080747D97A3AABAA4ACBB6B7691768099A3ACBAA7AFBE6B7590E7ECED6771
            8E556080555F80636F8B626C89B6BDC9556080636C8AB9C0CBBAC0CABAC2CC5E
            68865F6A875D67865E69875560805D67865561805B65845D6887C5CCD4C6CDD4
            556080E7ECEDC8CFD6555F80C9CFD6CBD0D7E7ECEC556080556080E7EBEDCED4
            DACFD6DC556080556080D2D8DD556080D6DAE0556080556080D9DEE355608055
            6080E8ECED556080566080555F80E7ECED556080566080E1E6E9E7ECED556080
            556080556080556180556080E6EBECE6EBED556080556081E6EBED556080E7EC
            ED3F91DFA40000007F74524E5300030405050707090A0C161718191B1D1D1E1F
            202C454649494A4D4E6E7174787D82909193939598B3B5B9BDBDBDBFBFC0C0C1
            C1C2C3C4C4C4C4C5C5C5C5C6C7C8CACBCBCECECFCFCFD0D0D1D1D4D4D5D5D6D6
            D6D7D7D8D8DADBDBDBDCDDDEDEDFDFE1E2E4E6E6E8E9EAEDEEEFF1F1F3F3F4F4
            F4F4F5F6F7FBFDFDFDFEFEFEE0F489CA0000016E49444154181965C109434C61
            1406E0774C895C5B1AD9AB4B0D06A1C5125AC89229FB90ADE49665D21491EDF6
            9E9F5EF3DDF39DEE34CF834D8DB9B0AF545E9D2AE4DBB2A8D71C5668CADD016A
            653B9759A3D2D18494608075460298D6397A8B8BF4665BA182593AFF2F5E9B59
            5B9BB9718589B9004ED3089DF892A8FE98CE4016551D4CF48AE965A2131B820A
            13E362C699586E06D04D158989A842205BA68AC444549546B4D18BC444F472C8
            D39B17334F2F4481EAA1A43CA3EAC314D5794919A42A6195EA9CA40C5295F195
            EAE93FD9748FEA171ED1BB29E6424CF504057A45F15EC7F44E234FF34AD42D9A
            10399AEB9278F387E620329F699E8B739BE653063845F3409C499A10C0EE6FF4
            5E887387DECF166C384635F1579CAB31D50954654659F5BDE787A8FB453A77B7
            C1D955227F5FFE2229634592EFF742ED7937FC41B6187BFCF100CCBEB352E7CC
            7EA41D7D2B355E1EC616DBDB97C42C1C6F40BD9D47BA86A65756A6874E1EDA01
            B30E291178CC115571850000000049454E44AE426082}
          Properties.ReadOnly = True
          Properties.ShowFocusRect = False
          Style.BorderStyle = ebsNone
          Style.HotTrack = False
          TabOrder = 0
          Height = 33
          Width = 33
        end
        object lblUser: TcxLabel
          Left = 40
          Top = 7
          Caption = 'Admin'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = 5395026
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
        end
        object btnMore: TcxButton
          Left = 256
          Top = 0
          Width = 41
          Height = 33
          Hint = 'More'
          Align = alRight
          Caption = '...'
          LookAndFeel.Kind = lfOffice11
          SpeedButtonOptions.CanBeFocused = False
          SpeedButtonOptions.Flat = True
          SpeedButtonOptions.Transparent = True
          TabOrder = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6908265
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object cxLabel1: TcxLabel
        AlignWithMargins = True
        Left = 3
        Top = 45
        Margins.Top = 10
        Margins.Bottom = 10
        Align = alTop
        Caption = 'Recent Chats'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 8618883
        Style.Font.Height = -19
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
    end
    object PageControl: TcxPageControl
      Left = 297
      Top = 0
      Width = 754
      Height = 540
      Align = alClient
      TabOrder = 1
      Properties.CustomButtons.Buttons = <>
      Properties.HideTabs = True
      ClientRectBottom = 540
      ClientRectRight = 754
      ClientRectTop = 0
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 589
    Width = 1051
    Height = 166
    Align = alBottom
    BevelOuter = bvNone
    Color = 16382457
    ParentBackground = False
    TabOrder = 2
  end
  object splitterBottom: TcxSplitter
    Left = 0
    Top = 581
    Width = 1051
    Height = 8
    HotZoneClassName = 'TcxXPTaskBarStyle'
    AlignSplitter = salTop
    Control = pnlBottom
    Color = 16382457
    ParentColor = False
    Visible = False
  end
end
