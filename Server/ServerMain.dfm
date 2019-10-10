object frmServer: TfrmServer
  Left = 0
  Top = 0
  Caption = 'frmServer'
  ClientHeight = 749
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
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    Visible = False
  end
  object pnlMain: TPanel
    Left = 0
    Top = 41
    Width = 1051
    Height = 534
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object pnlLeft: TPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 534
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object grdUsers: TcxGrid
        AlignWithMargins = True
        Left = 1
        Top = 0
        Width = 184
        Height = 533
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
          OptionsSelection.MultiSelect = True
          OptionsSelection.InvertSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLineColor = clWhite
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 50
          OptionsView.BandHeaders = False
          Bands = <
            item
              Caption = 'Reset Group'
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
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object vwUsersUSER_NAME: TcxGridBandedColumn
            Caption = 'User Name'
            Options.Editing = False
            Options.Filtering = False
            Options.Moving = False
            SortIndex = 1
            SortOrder = soAscending
            Width = 185
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object vwUsersIP: TcxGridBandedColumn
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
        end
        object lvlUsers: TcxGridLevel
          GridView = vwUsers
        end
      end
    end
    object PageControl: TcxPageControl
      Left = 185
      Top = 0
      Width = 866
      Height = 534
      Align = alClient
      TabOrder = 1
      Properties.CustomButtons.Buttons = <>
      Properties.HideTabs = True
      ClientRectBottom = 534
      ClientRectRight = 866
      ClientRectTop = 0
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 583
    Width = 1051
    Height = 166
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
  end
  object splitterBottom: TcxSplitter
    Left = 0
    Top = 575
    Width = 1051
    Height = 8
    HotZoneClassName = 'TcxXPTaskBarStyle'
    AlignSplitter = salTop
    Control = pnlBottom
    Color = clWhite
    ParentColor = False
  end
end
