unit Conversation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxGdiplusClasses,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  Vcl.ExtCtrls, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxmdaset, cxExtEditRepositoryItems,
  cxContainer, cxLabel, cxGroupBox, cxImageComboBox, System.ImageList,
  Vcl.ImgList, cxImageList, cxTextEdit, cxMemo, cxGridBandedTableView,
  cxGridDBBandedTableView, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxBlobEdit,
  cxImage;

const
  FRAME_INACTIVE_COLOR = $5C5C5C;
  SentMessageContentColor = $00EEEEEE;
  SentMessageBorderColor = $00ECECEC;
type
  TfrmConversation = class;
  TcxViewInfoAcess = class(TcxGridTableDataCellViewInfo);  //Cell'e Image çizdirimi
  TcxPainterAccess = class(TcxGridTableDataCellPainter);   //Cell'e Image çizdirimi
  TConvProc = reference to procedure(AConversation : TfrmConversation);


  TfrmConversation = class(TForm)
    vwMessages: TcxGridBandedTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel1: TPanel;
    mdData: TdxMemData;
    mdDataINCOMING_MESSAGE: TBooleanField;
    mdDataMESSAGE: TWideStringField;
    DataSource1: TDataSource;
    vwMessagesINCOMING_MESSAGE: TcxGridBandedColumn;
    vwMessagesMESSAGE: TcxGridBandedColumn;
    Repo: TcxEditRepository;
    erLabelLeft: TcxEditRepositoryLabel;
    erLabelRight: TcxEditRepositoryLabel;
    gbHeader: TcxGroupBox;
    lblName: TcxLabel;
    StyleRepo: TcxStyleRepository;
    stBold: TcxStyle;
    vwMessagesUSER_IMAGE: TcxGridBandedColumn;
    ImageList32x32: TcxImageList;
    gbMessage: TcxGroupBox;
    Memo: TcxMemo;
    vwMessagesRIGHT: TcxGridBandedColumn;
    vwMessagesMESSAGE_INFO: TcxGridBandedColumn;
    mdDataIS_INFO_ROW: TBooleanField;
    vwMessagesDATE: TcxGridBandedColumn;
    vwMessagesIS_INFO_ROW: TcxGridBandedColumn;
    mdDataDATE: TDateTimeField;
    btnSend: TcxButton;
    ImageList24x24: TcxImageList;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure vwMessagesMESSAGECustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure vwMessagesMESSAGEGetProperties(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AProperties: TcxCustomEditProperties);
    procedure MemoEnter(Sender: TObject);
    procedure MemoExit(Sender: TObject);
    procedure MemoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MemoPropertiesEditValueChanged(Sender: TObject);
    procedure gbMessageCustomDraw(Sender: TcxCustomGroupBox;
      var ADone: Boolean);
    procedure MemoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MemoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure vwMessagesRIGHTCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure gbMessageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure vwMessagesGetCellHeight(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
    procedure vwMessagesUSER_IMAGECustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure gbMessageResize(Sender: TObject);
    procedure btnSendCustomDraw(Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxButtonViewInfo; var AHandled: Boolean);
    procedure btnSendClick(Sender: TObject);
  private
    FBrush : TdxGPBrush;
    FNullstring : String;
    FAfterSend : TConvProc;
    FLastMessage : String;
    FIp : String;
    function IsMessageValid : Boolean;
    procedure CalculateMemoHeight(AAdditionalLine : Boolean = False);
    procedure AppendRecord(const Values: array of const);
    procedure Send;
    function GetLastMessageSingleLine : String;
  public
    procedure Receive(const AMessage : String);
    property AfterSend : TConvProc read FAfterSend write FAfterSend;
    property LastMessage : String read FLastMessage write FLastMessage;
    property LastMessageSingleLine : String read GetLastMessageSingleLine;
    property Ip : String read FIp write FIp;
  end;

var
  frmConversation: TfrmConversation;


implementation

{$R *.dfm}

uses cxGeometry, GdipApi, GdipObj, dxCore, dxLayoutDragAndDrop, dxGdiPlusApi, cxGridRows, Math,  System.UITypes, cxDateUtils;

procedure TfrmConversation.FormCreate(Sender: TObject);
begin
  FBrush := TdxGPBrush.Create;
  FBrush.Color := $00FBAA62;
  FNullstring := 'Type a message here';
  Memo.Text := '';
  vwMessages.Controller.TopRowIndex := MaxInt;
  vwMessages.Site.VScrollBar.Position := MaxInt;
end;

procedure TfrmConversation.vwMessagesMESSAGECustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  AGraphics: TdxGPGraphics;
  AFrameRect : TRect;
  AText : String;
begin
  if not VarIsNull(AViewInfo.GridRecord.Values[vwMessagesIS_INFO_ROW.Index]) and 
     AViewInfo.GridRecord.Values[vwMessagesIS_INFO_ROW.Index] then
  begin
    if not VarIsNull(AViewInfo.GridRecord.Values[vwMessagesDATE.Index]) then
    begin
      AFrameRect := AViewInfo.Bounds;
      AFrameRect.Left := AViewInfo.Bounds.Left+ 12;
      ACanvas.Font.Color := $00BBBBBB;
      ACanvas.Font.Size := 10;
      AText := FormatDateTime('hh:nn', AViewInfo.GridRecord.Values[vwMessagesDATE.Index]);
      if AViewInfo.GridRecord.Values[vwMessagesINCOMING_MESSAGE.Index] then
      begin
        AText := lblName.Caption + ', ' + AText;
        ACanvas.DrawTexT(AText, AFrameRect, taLeftJustify, vaCenter, False, False); 
      end
      else
        ACanvas.DrawTexT(AText, AFrameRect, taRightJustify, vaCenter, False, False);  
      ADone := True;
    end;
  end
  else
  begin
    AGraphics := dxGpBeginPaint(ACanvas.Handle, AViewInfo.Bounds);
    try
      AGraphics.SmoothingMode := smAntiAlias;
      if AViewInfo.GridRecord.Values[vwMessagesINCOMING_MESSAGE.Index] then
      begin
        AFrameRect.Left   := AViewInfo.Bounds.Left+ 12;
        AFrameRect.Right  := Min(AViewInfo.Bounds.Left + AViewInfo.TextBounds.Width + 42, AViewInfo.Bounds.Right -20);
        AFrameRect.Top    := AViewInfo.Bounds.Top + 2;
        AFrameRect.Bottom := AViewInfo.Bounds.Bottom - 2;

        AGraphics.RoundRect(AFrameRect, $00D38A01, $00D38A01, 10, 10, 2, 255, 255);

        AFrameRect.Top := AViewInfo.Bounds.Top + 10;
        AFrameRect.Bottom := AViewInfo.Bounds.Bottom;
        AFrameRect.Left := AFrameRect.Left + 10;
        ACanvas.Brush.Style := bsClear;
        ACanvas.Font.Color := clWhite;
        ACanvas.DrawTexT(AViewInfo.Text, AFrameRect, taLeftJustify, vaTop, True, True);
      end
      else
      begin
        AFrameRect.Left  :=  Max(AViewInfo.Bounds.Right - AViewInfo.TextBounds.Width - 35, AViewInfo.Bounds.Left + 20);
        AFrameRect.Right  := AViewInfo.Bounds.Right;
        AFrameRect.Top    := AViewInfo.Bounds.Top + 2;
        AFrameRect.Bottom := AViewInfo.Bounds.Bottom - 2;

        AGraphics.RoundRect(AFrameRect, SentMessageBorderColor, SentMessageContentColor, 10, 10, 2, 255, 255);


        AFrameRect.Top := AViewInfo.Bounds.Top + 10;
        AFrameRect.Bottom := AViewInfo.Bounds.Bottom;
        AFrameRect.Left := AFrameRect.Left + 10;
        ACanvas.Brush.Style := bsClear;
        ACanvas.Font.Color := clBlack;
        ACanvas.DrawTexT(AViewInfo.Text, AFrameRect, taLeftJustify, vaTop, True, True);
      end;
    finally
      dxGpEndPaint(AGraphics);
    end;

    ADone := True;
  end;
end;

procedure TfrmConversation.vwMessagesMESSAGEGetProperties(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AProperties: TcxCustomEditProperties);
begin
  if not VarIsNull(ARecord.Values[vwMessagesINCOMING_MESSAGE.Index]) then
  begin
    if ARecord.Values[vwMessagesINCOMING_MESSAGE.Index] then
      AProperties := erLabelLeft.Properties
    else
      AProperties := erLabelRight.Properties;
  end;
end;

procedure TfrmConversation.MemoEnter(Sender: TObject);
begin
  if Memo.Lines.Text = FNullstring then
    Memo.Text := '';
end;

procedure TfrmConversation.MemoExit(Sender: TObject);
begin
  if Memo.Lines.Text = '' then
    Memo.Text := FNullstring;
end;

procedure TfrmConversation.MemoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Text = FNullstring then
    Memo.Text := '';
end;

procedure TfrmConversation.MemoPropertiesEditValueChanged(Sender: TObject);
begin
  if Memo.Text = '' then
    Memo.Text := FNullString;
  if (Memo.Text = FNullstring) or (Memo.Text = '')then
  begin
    Memo.Style.TextColor := FRAME_INACTIVE_COLOR;
    Memo.Style.TextStyle := [fsItalic];
    Memo.StyleHot.TextStyle :=[fsItalic];
  end
  else
  begin
    Memo.Style.TextColor := clWindowText;
    Memo.Style.TextStyle := [];
    Memo.StyleHot.TextStyle :=[];
  end;
end;

procedure TfrmConversation.gbMessageCustomDraw(Sender: TcxCustomGroupBox;
  var ADone: Boolean);
var
  AGraphics: TdxGPGraphics;
begin
  AGraphics := dxGpBeginPaint(Sender.Canvas.Handle, Sender.Bounds);
  try
    AGraphics.RoundRect(Sender.Bounds, SentMessageBorderColor, SentMessageContentColor, 10, 10, 2, 255, 255);
  finally
    dxGpEndPaint(AGraphics);
  end;
  ADone := True;
end;

procedure TfrmConversation.Receive(const AMessage : String);
Var
  ADate : TDateTime;
  AHour, AMin, ASec, AMSec: Word;
begin
  DecodeTime(now, AHour, AMin, ASec, AMSec);
  ADate := EncodeTime(AHour, AMin, 0, 0);

  if not vwMessages.DataController.Values[vwMessages.DataController.RecordCount -1, vwMessagesINCOMING_MESSAGE.Index]
    or VarIsNull(vwMessages.DataController.Values[vwMessages.DataController.RecordCount -1, vwMessagesDATE.Index])
    or (vwMessages.DataController.Values[vwMessages.DataController.RecordCount -1, vwMessagesDATE.Index] <> ADate) then
    AppendRecord([True, '', ADate, True]);

  AppendRecord([True, AMessage, ADate, False]);
  vwMessages.Site.VScrollBar.Position := MaxInt;
  vwMessages.Controller.TopRecordIndex  := MaxInt;
end;

procedure TfrmConversation.MemoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift <> []) and (Key <> VK_LCONTROL) then
    CalculateMemoHeight((Key = VK_RETURN) and (ssCtrl in Shift));

  if (Key = VK_RETURN) and not (ssCtrl in Shift) then
  begin
    Memo.Text := '';
    vwMessages.Site.VScrollBar.Position := MaxInt;
    CalculateMemoHeight;
  end;
end;

procedure TfrmConversation.MemoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Memo.Style.TextColor := clWindowText;
  Memo.Style.TextStyle := [];
  Memo.StyleHot.TextStyle :=[];
  if (Key = VK_RETURN) and not (ssCtrl in Shift) then
    Send;
end;

procedure TfrmConversation.vwMessagesRIGHTCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  ADone := True;
end;

procedure TfrmConversation.CalculateMemoHeight(AAdditionalLine : Boolean);
const
  LineHeight = 21;
  GroupBoxStartHeight = 35;
  MemoStartHeight = 7;
Var
  ALineCount : Integer;

  procedure SetScrollBars(AStyle : TScrollStyle);
  begin
    if Memo.Properties.ScrollBars <> AStyle then
      Memo.Properties.ScrollBars := AStyle;
  end;

  function SetHeight(AControl : TControl; AHeight: Integer) : Boolean;
  begin
    Result := AHeight <> AControl.Height;
    if Result then
    begin
      AControl.Height := AHeight;
      vwMessages.Site.VScrollBar.Position := MaxInt;
    end;
  end;
begin
  ALineCount := 1;
  if Memo.Lines.Count > 1 then
    ALineCount := Min(memo.Lines.Count, 5);

  ALineCount := ALineCount + ifthen(AAdditionalLine, 1, 0);

  SetHeight(gbMessage, GroupBoxStartHeight + LineHeight * ALineCount);
  SetHeight(Memo, MemoStartHeight + LineHeight * ALineCount);

  if memo.Lines.Count > 5 then
  begin
    SetScrollBars(System.UITypes.TScrollStyle.ssVertical);
    vwMessages.Site.VScrollBar.Position := MaxInt;
  end
  else
    SetScrollBars(System.UITypes.TScrollStyle.ssNone);
end;

procedure TfrmConversation.gbMessageMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  memo.SetFocus;
end;

function TfrmConversation.IsMessageValid: Boolean;
Var
  AText : String;
begin
  AText := Trim(Memo.Text);
  Result := (AText <> '') and (AText <> sLineBreak);
  if not Result then
  begin
    Memo.Text := '';
    CalculateMemoHeight;
  end;
end;

procedure TfrmConversation.vwMessagesGetCellHeight(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
Var
  AFreeText : String;
begin
  if ARecord.IsData and not VarIsNull(ARecord.Values[vwMessagesIS_INFO_ROW.Index]) then
  begin
    if not VarIsNull(ARecord.Values[vwMessagesIS_INFO_ROW.Index]) and (ARecord.Values[vwMessagesIS_INFO_ROW.Index]) then
      AHeight := 18
    else
    begin
      AHeight := AHeight + 17;
      Exit;
      AFreeText := VarToStr(ARecord.Values[vwMessagesMESSAGE.Index]);
      AHeight := 21;
      AHeight := AHeight + 17 * (AFreeText.CountChar(#10) + 1);
    end;
  end;
end;

procedure TfrmConversation.vwMessagesUSER_IMAGECustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.Item = vwMessagesUSER_IMAGE then
  begin

    if not TcxGridDataCellViewInfo(AViewInfo).IsMerged then
    begin
      if AViewInfo.GridRecord.Values[vwMessagesINCOMING_MESSAGE.Index] then
        ACanvas.DrawImage(ImageList32x32, AViewInfo.Bounds.Left + 2, AViewInfo.Bounds.Top, 0)
    end
    else if (TcxGridDataCellViewInfo(AViewInfo).MergedCellCount > 0)
      and (TcxGridDataCellViewInfo(AViewInfo).MergedCells[0] = AViewInfo) and AViewInfo.GridRecord.Values[vwMessagesINCOMING_MESSAGE.Index] then
    begin
      ACanvas.DrawImage(ImageList32x32, AViewInfo.Bounds.Left + 2, AViewInfo.Bounds.Top, 0);
    end;
    ADone := True;
  end;
end;

procedure TfrmConversation.gbMessageResize(Sender: TObject);
begin
  btnSend.Top  := 8 + (gbMessage.Height - btnSend.Height) div 2;
  btnSend.Left := gbMessage.Left + gbMessage.Width - 130;
end;

procedure TfrmConversation.btnSendCustomDraw(Sender: TObject; ACanvas: TcxCanvas;
  AViewInfo: TcxButtonViewInfo; var AHandled: Boolean);
begin
  ACanvas.FillRect(AViewInfo.Bounds, SentMessageContentColor);
  if AViewInfo.State = cxbsHot then
    ACanvas.DrawImage(ImageList24x24, AViewInfo.Bounds.Left + 4, AViewInfo.Bounds.Top + 4, 1)
  else
    ACanvas.DrawImage(ImageList24x24, AViewInfo.Bounds.Left + 4, AViewInfo.Bounds.Top + 4, 0);

  AHandled := True;
end;

procedure TfrmConversation.btnSendClick(Sender: TObject);
begin
  Send;
end;

procedure TfrmConversation.AppendRecord(const Values: array of const);
begin
  vwMessages.DataController.RecordCount := vwMessages.DataController.RecordCount + 1;
  vwMessages.DataController.Values[vwMessages.DataController.RecordCount -1, vwMessagesINCOMING_MESSAGE.Index] := Values[0].VBoolean;
  vwMessages.DataController.Values[vwMessages.DataController.RecordCount -1, vwMessagesUSER_IMAGE.Index]       := Values[0].VBoolean;
  vwMessages.DataController.Values[vwMessages.DataController.RecordCount -1, vwMessagesMESSAGE.Index] := String(Values[1].VWideString);
  vwMessages.DataController.Values[vwMessages.DataController.RecordCount -1, vwMessagesDATE.Index] := Values[2].VExtended^;
  vwMessages.DataController.Values[vwMessages.DataController.RecordCount -1, vwMessagesIS_INFO_ROW.Index] := Values[3].VBoolean;
  vwMessages.DataController.Post;
end;

procedure TfrmConversation.Send;
Var
  ADate : TDateTime;
  AHour, AMin, ASec, AMSec: Word;
begin
  if IsMessageValid then
  begin
    DecodeTime(now, AHour, AMin, ASec, AMSec);
    ADate := EncodeTime(AHour, AMin, 0, 0);


    if vwMessages.DataController.Values[vwMessages.DataController.RecordCount -1, vwMessagesINCOMING_MESSAGE.Index]
      or VarIsNull(vwMessages.DataController.Values[vwMessages.DataController.RecordCount -1, vwMessagesDATE.Index])
      or (vwMessages.DataController.Values[vwMessages.DataController.RecordCount -1, vwMessagesDATE.Index] <> ADate) then
      AppendRecord([False, '', ADate, True]);

    FLastMessage := Trim(Memo.Text);
    AppendRecord([False, FLastMessage, ADate, False]);
    Memo.Text := '';
    CalculateMemoHeight;
    vwMessages.Controller.TopRecordIndex  := MaxInt;

    if Assigned(FAfterSend) then
      FAfterSend(self);
  end;
end;

function TfrmConversation.GetLastMessageSingleLine: String;
begin
  Result := LastMessage.Replace(sLineBreak, #16);
end;

end.
