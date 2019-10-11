object frmConversation: TfrmConversation
  Left = 0
  Top = 0
  Caption = 'frmConversation'
  ClientHeight = 631
  ClientWidth = 765
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 765
    Height = 631
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object cxGrid1: TcxGrid
      AlignWithMargins = True
      Left = 25
      Top = 85
      Width = 715
      Height = 440
      Margins.Left = 25
      Margins.Top = 4
      Margins.Right = 25
      Margins.Bottom = 19
      Align = alClient
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = cxcbsNone
      TabOrder = 0
      object vwMessages: TcxGridBandedTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Append.Visible = True
        OnGetCellHeight = vwMessagesGetCellHeight
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.SeparatorWidth = 8
        FixedDataRows.SeparatorWidth = 8
        NewItemRow.SeparatorWidth = 8
        OptionsBehavior.RecordScrollMode = rsmByRecord
        OptionsData.Appending = True
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsView.FocusRect = False
        OptionsView.NavigatorOffset = 63
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GridLines = glNone
        OptionsView.GroupByBox = False
        OptionsView.Header = False
        OptionsView.IndicatorWidth = 15
        OptionsView.BandHeaders = False
        OptionsView.FixedBandSeparatorWidth = 3
        Preview.LeftIndent = 25
        Preview.RightIndent = 6
        Styles.Content = stBold
        Bands = <
          item
          end>
        object vwMessagesUSER_IMAGE: TcxGridBandedColumn
          OnCustomDrawCell = vwMessagesUSER_IMAGECustomDrawCell
          MinWidth = 43
          Options.Focusing = False
          Options.AutoWidthSizable = False
          Options.CellMerging = True
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Width = 43
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object vwMessagesINCOMING_MESSAGE: TcxGridBandedColumn
          DataBinding.ValueType = 'Boolean'
          Visible = False
          MinWidth = 25
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object vwMessagesMESSAGE: TcxGridBandedColumn
          OnCustomDrawCell = vwMessagesMESSAGECustomDrawCell
          MinWidth = 25
          Width = 681
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object vwMessagesRIGHT: TcxGridBandedColumn
          OnCustomDrawCell = vwMessagesRIGHTCustomDrawCell
          MinWidth = 94
          Options.Focusing = False
          Options.HorzSizing = False
          Options.Moving = False
          Width = 94
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
        object vwMessagesMESSAGE_INFO: TcxGridBandedColumn
          Visible = False
          MinWidth = 25
          Position.BandIndex = 0
          Position.ColIndex = 6
          Position.RowIndex = 0
        end
        object vwMessagesDATE: TcxGridBandedColumn
          DataBinding.ValueType = 'DateTime'
          Visible = False
          MinWidth = 25
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object vwMessagesIS_INFO_ROW: TcxGridBandedColumn
          DataBinding.ValueType = 'Boolean'
          Visible = False
          MinWidth = 25
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = vwMessages
      end
    end
    object gbHeader: TcxGroupBox
      Left = 0
      Top = 0
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Alignment = alCenterCenter
      PanelStyle.CaptionIndent = 3
      ParentBackground = False
      ParentColor = False
      Style.BorderColor = clMedGray
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      Style.Edges = [bBottom]
      TabOrder = 1
      Height = 81
      Width = 765
      object lblName: TcxLabel
        Left = 16
        Top = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -20
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
      end
    end
    object gbMessage: TcxGroupBox
      AlignWithMargins = True
      Left = 88
      Top = 557
      Margins.Left = 88
      Margins.Top = 13
      Margins.Right = 75
      Margins.Bottom = 19
      Align = alBottom
      Alignment = alCenterCenter
      PanelStyle.Active = True
      PanelStyle.CaptionIndent = 3
      Style.BorderStyle = ebsNone
      TabOrder = 2
      OnCustomDraw = gbMessageCustomDraw
      OnMouseDown = gbMessageMouseDown
      OnResize = gbMessageResize
      Height = 55
      Width = 602
      object Memo: TcxMemo
        AlignWithMargins = True
        Left = 40
        Top = 15
        Margins.Left = 38
        Margins.Top = 13
        Margins.Right = 55
        Margins.Bottom = 11
        Align = alClient
        Lines.Strings = (
          'Type a message here')
        ParentFont = False
        Properties.WantReturns = False
        Properties.OnEditValueChanged = MemoPropertiesEditValueChanged
        Style.BorderStyle = ebsNone
        Style.Color = 15658734
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = 4868682
        Style.TextStyle = [fsItalic]
        Style.IsFontAssigned = True
        TabOrder = 0
        OnEnter = MemoEnter
        OnExit = MemoExit
        OnKeyDown = MemoKeyDown
        OnKeyUp = MemoKeyUp
        OnMouseDown = MemoMouseDown
        Height = 27
        Width = 505
      end
      object btnSend: TcxButton
        Left = 546
        Top = 4
        Width = 50
        Height = 50
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'btnSend'
        LookAndFeel.Kind = lfOffice11
        OptionsImage.Spacing = 5
        PaintStyle = bpsGlyph
        SpeedButtonOptions.CanBeFocused = False
        SpeedButtonOptions.Flat = True
        SpeedButtonOptions.Transparent = True
        TabOrder = 1
        OnCustomDraw = btnSendCustomDraw
        OnClick = btnSendClick
      end
    end
  end
  object mdData: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F050000000200000005001100494E434F4D494E475F
      4D45535341474500A00F0000140008004D455353414745001400000014000D00
      4D4553534147455F494E464F0004000000090005004441544500020000000500
      0C0049535F494E464F5F524F57000101000105000000480065006C006C006F00
      0112000000310035003A003400390020005200610068006D00690020004B0061
      0079006D0061006B0001F63F0B0000000001010001310000004900200061006D
      00200079006F00750072002000540072006100760065006C0020004100730073
      0069007300740061006E00200061007400200055006E00690074006500640020
      00540072006100760065006C0020004100670065006E00630079000112000000
      310035003A003400390020005200610068006D00690020004B00610079006D00
      61006B000000000000000000010100012100000049002000630061006E002000
      680065006C007000200079006F007500200062006F006F006B00200079006F00
      7500720020007600610063006100740069006F006E000112000000310035003A
      003500300020005200610068006D00690020004B00610079006D0061006B0000
      00000000000000010100012C000000570068006100740020006B0069006E0064
      0020006F00660020007600610063006100740069006F006E0020006100720065
      00200079006F007500200069006E007400650072006500730074006500640020
      0069006E003F000112000000310035003A003500300020005200610068006D00
      690020004B00610079006D0061006B000000000000000000010000010B000000
      460061006D0069006C007900200074007900700065000105000000310035003A
      0035003200000000000000000001010001280000005700680065006E00200064
      006F00200079006F0075002000770061006E007400200079006F007500720020
      007600610063006100740069006F006E00200074006F00200073007400610072
      0074003F000112000000310035003A003500330020005200610068006D006900
      20004B00610079006D0061006B000000000000000000010000010B0000003100
      370020004D0061007900200032003000310038000112000000310035003A0035
      00330020005200610068006D00690020004B00610079006D0061006B00000000
      00000000000101000130000000470072006500610074002E00200048006F0077
      0020006C006F006E006700200064006F00200079006F0075002000770061006E
      007400200079006F007500720020007600610063006100740069006F006E0020
      0074006F002000620065003F000112000000310035003A003500330020005200
      610068006D00690020004B00610079006D0061006B0000000000000000000100
      0001060000003200200064006100790073000112000000310035003A00350034
      0020005200610068006D00690020004B00610079006D0061006B000000000000
      000000010100012F00000048006F00770020006D0061006E0079002000700065
      006F0070006C0065002000770069006C00200062006500200074007200610076
      0065006C0069006E0067002C00200079006F007500200069006E0063006C0075
      006400650064003F000112000000310035003A00350034002000520061006800
      6D00690020004B00610079006D0061006B000000000000000000}
    SortOptions = []
    Left = 544
    Top = 184
    object mdDataINCOMING_MESSAGE: TBooleanField
      FieldName = 'INCOMING_MESSAGE'
    end
    object mdDataMESSAGE: TWideStringField
      FieldName = 'MESSAGE'
      Size = 4000
    end
    object mdDataDATE: TDateTimeField
      FieldName = 'DATE'
    end
    object mdDataIS_INFO_ROW: TBooleanField
      FieldName = 'IS_INFO_ROW'
    end
  end
  object DataSource1: TDataSource
    DataSet = mdData
    Left = 336
    Top = 296
  end
  object Repo: TcxEditRepository
    Left = 688
    Top = 128
    PixelsPerInch = 96
    object erLabelLeft: TcxEditRepositoryLabel
      Properties.Alignment.Vert = taVCenter
    end
    object erLabelRight: TcxEditRepositoryLabel
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
    end
  end
  object StyleRepo: TcxStyleRepository
    Left = 432
    Top = 144
    PixelsPerInch = 96
    object stBold: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 16382457
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 16382457
    end
  end
  object ImageList32x32: TcxImageList
    SourceDPI = 96
    Height = 32
    Width = 32
    FormatVersion = 1
    DesignInfo = 13107480
    ImageInfo = <
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D494844520000002000000020080300000044A48A
          C60000000373424954080808DBE14FE000000009704859730000085B0000085B
          01E89F75D00000001974455874536F667477617265007777772E696E6B736361
          70652E6F72679BEE3C1A00000183504C5445FFFFFF5555AA408080666699FFFF
          FF496D92DBDBFF55558EE6E6E6EAEAEA515D80596485556080525C85555E8458
          61849EA7B9808899526384586080576380556081545F80545E81E7EEEEE7EAEE
          E8EBEEE8EBEB565F80E6EDED566180E8ECEE566081546080556080E6ECED555F
          80E7ECEE566080566080555F80E4EAEBE8ECED55608078829A78829B848EA386
          8FA4747E979AA3B37780997881995560809AA2B3556080747D97A3AABAA4ACBB
          6B7691768099A3ACBAA7AFBE6B7590E7ECED67718E556080555F80636F8B626C
          89B6BDC9556080636C8AB9C0CBBAC0CABAC2CC5E68865F6A875D67865E698755
          60805D67865561805B65845D6887C5CCD4C6CDD4556080E7ECEDC8CFD6555F80
          C9CFD6CBD0D7E7ECEC556080556080E7EBEDCED4DACFD6DC556080556080D2D8
          DD556080D6DAE0556080556080D9DEE3556080556080E8ECED55608056608055
          5F80E7ECED556080566080E1E6E9E7ECED556080556080556080556180556080
          E6EBECE6EBED556080556081E6EBED556080E7ECED3F91DFA40000007F74524E
          5300030405050707090A0C161718191B1D1D1E1F202C454649494A4D4E6E7174
          787D82909193939598B3B5B9BDBDBDBFBFC0C0C1C1C2C3C4C4C4C4C5C5C5C5C6
          C7C8CACBCBCECECFCFCFD0D0D1D1D4D4D5D5D6D6D6D7D7D8D8DADBDBDBDCDDDE
          DEDFDFE1E2E4E6E6E8E9EAEDEEEFF1F1F3F3F4F4F4F4F5F6F7FBFDFDFDFEFEFE
          E0F489CA0000016E49444154181965C109434C611406E0774C895C5B1AD9AB4B
          0D06A1C5125AC89229FB90ADE49665D21491EDF69E9F5EF3DDF39DEE34CF834D
          8DB9B0AF545E9D2AE4DBB2A8D71C5668CADD016A653B9759A3D2D18494608075
          460298D6397A8B8BF4665BA182593AFF2F5E9B595B9BB9718589B9004ED3089D
          F892A8FE98CE4016551D4CF48AE965A2131B820A13E362C699586E06D04D1589
          89A842205BA68AC444549546B4D18BC444F472C8D39B17334F2F4481EAA1A43C
          A3EAC314D5794919A42A6195EA9CA40C5295F195EAE93FD9748FEA171ED1BB29
          E6424CF504057A45F15EC7F44E234FF34AD42D9A10399AEB9278F387E620329F
          699E8B739BE653063845F3409C499A10C0EE6FF45E887387DECF166C384635F1
          579CAB31D50954654659F5BDE787A8FB453A77B7C1D955227F5FFE2229634592
          EFF742ED7937FC41B6187BFCF100CCBEB352E7CC7EA41D7D2B355E1EC616DBDB
          97C42C1C6F40BD9D47BA86A65756A6874E1EDA01B30E291178CC115571850000
          000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D494844520000002000000020080300000044A48A
          C60000000467414D410000B18F0BFC6105000000206348524D00007A26000080
          840000FA00000080E8000075300000EA6000003A98000017709CBA513C000000
          87504C5445000000BABABABCBABABABABABFBFBFBBBABABCBABABBBBBBB9B9B9
          BBBABABABABAB8B8B8BCBABABBBABABBBABABCBCBCC6C6C6BCBABABBBABABBBB
          BBB9B9B9BBBBBBBBBABAB9B9B9FFFFFFBBB9B9BBBBBBBABABABEB8B8BBBABABB
          BABABBBBBBB3B3B3BABABABABABABBBABABABABABDB8B8BBBABABCBABABABABA
          BCBABABCB9B9BBBABA000000A22F336F0000002B74524E530086BD5904E6DF6D
          0BF091199FF8A22609D0FDB337F2C44D01D15E6F2BF4DE6C0A60C9DD6B36EB88
          89C158C4EBBCBB00000001624B47440088051D48000000097048597300000EC4
          00000EC401952B0E1B0000000774494D4507E3071F0B1E2F959BB532000000B2
          4944415438CB9593E716C2200C46516C5D68C5BD8BA3AEBCFFFB39503125817A
          FF72CFE1FB42102246AD2E1B412101489BAD8020E141BBD3E50DF534A0D7CF38
          61A05F060C4763C6C826F0663A9BF3312C8B2559493903D21551E913C3425572
          31B84A12307E2505654A95700C8B4695D61BDF806D6E9CB1038A7D7581BCE270
          349543C66AFA832AFE1A350E703A7B8F859FDB948F7F03686A61622BE796B610
          24B1B5974CF02F099A38C1E57A0B7FDE187724B33F6E84A53B14000000257445
          5874646174653A63726561746500323031392D30372D33315430393A33303A34
          372B30323A3030964DC8470000002574455874646174653A6D6F646966790032
          3031392D30372D33315430393A33303A34372B30323A3030E71070FB00000019
          74455874536F667477617265007777772E696E6B73636170652E6F72679BEE3C
          1A0000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D494844520000002000000020080300000044A48A
          C60000000467414D410000B18F0BFC6105000000206348524D00007A26000080
          840000FA00000080E8000075300000EA6000003A98000017709CBA513C000001
          9B504C54450000009C98989C99999B98989E9C9CAAAAAA9C99999C99999C9999
          9B99999C99999E9898A492929B98989C99999C99999C99999C99999D99999D99
          999B9B9B9B97979B99999C99999C99999C99999E98989A98989C9A9A9C99999C
          99999C99999C99999D98989C97978080809B9A9A9C99999C99999C99999C9999
          9D9898AAAAAA9797979C98989C99999C99999C99999C99999C9A9A9E9D9D9F9F
          9F9B97979C99999C99999C99999C99999B99999998989696969B99999C99999C
          99999B99999C99999C9A9A9B9B9B9C9A9A9C99999C99999C99999C99999C9999
          9C99999E98989797979C99999C99999C99999D98989D98989C97979B97979C99
          999C99999C99999D98989C98989C9A9A9C99999B99999C99999C99999C99999C
          9A9A9C99999D9A9A9C9A9A9C9A9A9C99999C9A9A9D9B9B9F95959C98989C9999
          9C99999B9A9A9C99999C99999C98989A9A9A9C99999B9B9B9C99999D99999C9B
          9B9F9F9F9C99999C99999C99999C9A9A9C99999C99999A9A9A9C99999B9B9B9E
          9999A197979C99999C99999C9A9A9C99999B99999D9A9AA09D9D9C9999000000
          432A29460000008774524E530094BB681701D4F6ECCE7F2A055FF2FBE9CF9442
          0C1197FD9D541529BBFEEFD0A2621F014CD2F5A67235020973E0FAB0763B0801
          1B97EBB27543120239B1F479471B0458C9F8C7804921070BDEFC8C4B230A1F91
          F0E29C4F210E3BAEF9EEB25C1E0E53CE72150B6BC69B4E8B4A230A2007794712
          02DDACA46D30A11F5314420CD5CD7E98BD6716BDF0498A00000001624B474400
          88051D48000000097048597300000DD700000DD70142289B780000000774494D
          4507E3071F0B1E39614F0063000001284944415438CB636020041899985958F1
          296063E7E0E4E2E6C1AD8097AF9D5F405048580497025131BEF676710E410949
          291C2AA465D8DBDBDB65E5E4151495B02A505651E56F07013536750D4D2D2C2A
          B4757465C12ADAF574F50D0C8D8C315498989AB543812C87B985A59535BA0A1B
          5BBB7638E063B2777074427386B30B3F4245BBAB9BBB87A7178A0A6F039F7664
          E0CBE6E71F1088AC222838044545BB6C6858784424521C4445C7B4A381D8B8F8
          8444B89794939265D155B4BBCAA7A4C28D484B976BC704FC19442B2068052147
          62F1666616923731032A3B27370F6F50E717E089ACC222B4C8428FEEE2125C09
          26A6B40C4B828127393BB6F28A4A65DC8956B04AB11A5B9A8527FB9A5AAC691A
          9671EAEA19708006768EC6267C59AFB9A5B50D6FE62504002A58BC4C03540721
          0000002574455874646174653A63726561746500323031392D30372D33315430
          393A33303A35372B30323A30305AE7C8D90000002574455874646174653A6D6F
          6469667900323031392D30372D33315430393A33303A35372B30323A30302BBA
          70650000001974455874536F667477617265007777772E696E6B73636170652E
          6F72679BEE3C1A0000000049454E44AE426082}
      end>
  end
  object ImageList24x24: TcxImageList
    SourceDPI = 96
    Height = 32
    Width = 32
    FormatVersion = 1
    DesignInfo = 8913176
    ImageInfo = <
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000B0B0B0F040404050000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000A4A4A5E1A8A8A9E6585858780C0C0C10000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000007373739DBABABBFFBABABBFFB0B0B1F16565668B1414
          151C000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000808080B9B9B9CD5BABABBFFBABABBFFBABABBFFB6B6
          B7FA767677A21F1F202B00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000001F1F202BB3B3B4F5BABABBFFBABABBFFBABA
          BBFFBABABBFFB9B9BAFE888889BB3838384D0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000047474761BABABBFFBABABBFFBABA
          BBFFBABABBFFBABABBFFBABABBFFBABABBFF969696CD4545455E020202030000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000757575A0BABABBFFBABA
          BBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFA0A0A1DC5151
          516F070707090000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000808080B9B9B9CD5BABA
          BBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABA
          BBFFAAAAABE95D5D5E800D0D0D12000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001F1F202BB3B3
          B4F5BABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABA
          BBFFBABABBFFBABABBFFB1B1B2F36A6A6A911515151D00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000004747
          4761BABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABA
          BBFFBABABBFFBABABBFFBABABBFFBABABBFFB6B6B7FA767677A21F1F202B0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000757575A0BABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABA
          BBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFB9B9BAFE8888
          89BB3838384D0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000808080B9B9B9CD5BABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABA
          BBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABA
          BBFFBABABBFF838383B300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000808080B9B9B9CD5BABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABA
          BBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABA
          BBFFBABABBFF838384B400000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00007474759FBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABA
          BBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFF8F8F
          90C43838384D0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000004141
          4159BABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABA
          BBFFBABABBFFBABABBFFBABABBFFBABABBFFB6B6B7FA767677A22020202C0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001C1C1C26B1B1
          B1F2BABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABA
          BBFFBABABBFFBABABBFFB1B1B2F36A6A6A911515151D00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000007070709989899D0BABA
          BBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABA
          BBFFAAAAABE95D5D5E800D0D0D12000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000007474759FBABABBFFBABA
          BBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFBABABBFFA1A1A2DD5151
          516F070707090000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000041414159BABABBFFBABABBFFBABA
          BBFFBABABBFFBABABBFFBABABBFFBABABBFF969696CD4545455E020202030000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000001C1C1C26B1B1B1F2BABABBFFBABABBFFBABA
          BBFFBABABBFFBABABBFF8F8F90C43838384D0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000007070709989899D0BABABBFFBABABBFFBABABBFFB6B6
          B7FA767677A22020202C00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000007272729CBABABBFFBABABBFFB1B1B1F26767678D1414
          151C000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000A3A3A4E0A8A8A9E7585859790C0C0C10000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000909090C040404050000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000909090F030303050000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000087878AE18A8A8DE6484849780A0A0A10000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000005E5E609D99999CFF99999CFF919193F15353558B1111
          111C000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000707070B808082D599999CFF99999CFF99999CFF9696
          99FA616163A21A1A1A2B00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000001A1A1A2B939396F599999CFF99999CFF9999
          9CFF99999CFF98989BFE707072BB2E2E2F4D0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003A3A3B6199999CFF99999CFF9999
          9CFF99999CFF99999CFF99999CFF99999CFF7B7B7DCD38383A5E020202030000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000606062A099999CFF9999
          9CFF99999CFF99999CFF99999CFF99999CFF99999CFF99999CFF848487DC4343
          446F050506090000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000707070B808082D59999
          9CFF99999CFF99999CFF99999CFF99999CFF99999CFF99999CFF99999CFF9999
          9CFF8C8C8FE94D4D4E800B0B0B12000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001A1A1A2B9393
          96F599999CFF99999CFF99999CFF99999CFF99999CFF99999CFF99999CFF9999
          9CFF99999CFF99999CFF929295F3575759911111121D00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003A3A
          3B6199999CFF99999CFF99999CFF99999CFF99999CFF99999CFF99999CFF9999
          9CFF99999CFF99999CFF99999CFF99999CFF969699FA616163A21A1A1A2B0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000606062A099999CFF99999CFF99999CFF99999CFF99999CFF99999CFF9999
          9CFF99999CFF99999CFF99999CFF99999CFF99999CFF99999CFF98989BFE7070
          72BB2E2E2F4D0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000707070B808082D599999CFF99999CFF99999CFF99999CFF99999CFF9999
          9CFF99999CFF99999CFF99999CFF99999CFF99999CFF99999CFF99999CFF9999
          9CFF99999CFF6B6B6EB300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000707070B808082D599999CFF99999CFF99999CFF99999CFF99999CFF9999
          9CFF99999CFF99999CFF99999CFF99999CFF99999CFF99999CFF99999CFF9999
          9CFF99999CFF6C6C6EB400000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00005F5F619F99999CFF99999CFF99999CFF99999CFF99999CFF99999CFF9999
          9CFF99999CFF99999CFF99999CFF99999CFF99999CFF99999CFF99999CFF7676
          78C42E2E2F4D0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003535
          365999999CFF99999CFF99999CFF99999CFF99999CFF99999CFF99999CFF9999
          9CFF99999CFF99999CFF99999CFF99999CFF969699FA616163A21A1A1B2C0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000171717269191
          94F299999CFF99999CFF99999CFF99999CFF99999CFF99999CFF99999CFF9999
          9CFF99999CFF99999CFF929295F3575759911111121D00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000050506097D7D7FD09999
          9CFF99999CFF99999CFF99999CFF99999CFF99999CFF99999CFF99999CFF9999
          9CFF8C8C8FE94D4D4E800B0B0B12000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000005F5F619F99999CFF9999
          9CFF99999CFF99999CFF99999CFF99999CFF99999CFF99999CFF858587DD4343
          446F050506090000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003535365999999CFF99999CFF9999
          9CFF99999CFF99999CFF99999CFF99999CFF7B7B7DCD38383A5E020202030000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000017171726919194F299999CFF99999CFF9999
          9CFF99999CFF99999CFF767678C42E2E2F4D0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000050506097D7D7FD099999CFF99999CFF99999CFF9696
          99FA616163A21A1A1B2C00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000005E5E5F9C99999CFF99999CFF919194F25555568D1111
          111C000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000868689E08B8B8DE749494A790A0A0A10000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000707070C030303050000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
end
