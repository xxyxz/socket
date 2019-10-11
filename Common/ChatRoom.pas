unit ChatRoom;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdContext, Vcl.ExtCtrls,
  IdAntiFreezeBase, Vcl.IdAntiFreeze, IdBaseComponent, IdComponent,
  IdCustomTCPServer, IdTCPServer, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxLabel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView, cxClasses,
  cxGridCustomView, cxGrid, IdTCPConnection, System.Generics.Collections,
  dxBarBuiltInMenu, cxPC, cxSplitter, Conversation, cxImageComboBox, cxCalendar,
  cxContainer, Vcl.Menus, Vcl.StdCtrls, cxButtons, dxGDIPlusClasses, cxImage;
type
  TConnection = class
    IP         : String;
    Connection : TidTCPConnection;
    ID         : Integer;
    User       : String;
    TabSheet   : TcxTabSheet;
    Conversation : TfrmConversation;
  end;

  TfrmChatRoom = class(TForm)
    pnlTop: TPanel;
    pnlMain: TPanel;
    pnlLeft: TPanel;
    grdUsers: TcxGrid;
    vwUsers: TcxGridBandedTableView;
    vwUsersID: TcxGridBandedColumn;
    vwUsersUSER_NAME: TcxGridBandedColumn;
    lvlUsers: TcxGridLevel;
    vwUsersIP: TcxGridBandedColumn;
    PageControl: TcxPageControl;
    pnlBottom: TPanel;
    splitterBottom: TcxSplitter;
    vwUsersIMAGE: TcxGridBandedColumn;
    Panel1: TPanel;
    cxImage: TcxImage;
    lblUser: TcxLabel;
    btnMore: TcxButton;
    cxLabel1: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure vwUsersSelectionChanged(Sender: TcxCustomGridTableView);
  private
    procedure ReadFromContent(AContext: TIdContext);
  protected
    FMsg: TStringList;
    FConnectionDict : TObjectDictionary<String, TConnection>;
    FIdCounter : Integer;
    FDoAfterSendProc : TConvProc;
    procedure AddConversation(AConnection : TConnection);
  public
    { Public declarations }
  end;

var
  frmChatRoom: TfrmChatRoom;

implementation

{$R *.dfm}

procedure TfrmChatRoom.FormCreate(Sender: TObject);
begin
  FMsg := TStringList.Create;
  FMsg.QuoteChar := #0;
  FConnectionDict := TObjectDictionary<String, TConnection>.Create;
  splitterBottom.CloseSplitter;
end;

procedure TfrmChatRoom.FormDestroy(Sender: TObject);
begin
  FMsg.Free;
  FConnectionDict.Free;
end;

procedure TfrmChatRoom.ReadFromContent(AContext: TIdContext);
begin
  FMsg.DelimitedText:= AContext.Connection.IOHandler.ReadLn;
end;

procedure TfrmChatRoom.AddConversation(AConnection : TConnection);
begin
  AConnection.TabSheet := TcxTabSheet.Create(Self);
  AConnection.TabSheet.PageControl := PageControl;

  AConnection.Conversation := TfrmConversation.Create(AConnection.TabSheet);
  AConnection.Conversation.Ip := AConnection.IP;
  AConnection.Conversation.Align := alClient;
  AConnection.Conversation.ManualDock(AConnection.TabSheet);
  AConnection.Conversation.lblName.Caption := AConnection.User;
  if Assigned(FDoAfterSendProc) then
    AConnection.Conversation.AfterSend := FDoAfterSendProc;
  AConnection.Conversation.Show;
end;

procedure TfrmChatRoom.vwUsersSelectionChanged(Sender: TcxCustomGridTableView);
Var
  AID : Integer;
  AIP : String;
  AConnection : TConnection;
begin
  if vwUsers.Controller.SelectedRecordCount > 0 then
  begin
    AIP := vwUsers.Controller.SelectedRecords[0].Values[vwUsersIP.Index];

    AConnection := FConnectionDict[AIP];

    if Assigned(FConnectionDict[AIP].TabSheet) then
      PageControl.ActivePage := FConnectionDict[AIP].TabSheet
    else
      AddConversation(AConnection);
  end;
end;

end.
