unit ServerMain;

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
  dxBarBuiltInMenu, cxPC, cxSplitter, Conversation;

const
  UM_CONNECTED = WM_USER + 10000;
  UM_DISCONNECTED = WM_USER + 10001;
  UM_EXECUTE = WM_USER + 10002;

type
  TConnection = class
    IP         : String;
    Connection : TidTCPConnection;
    ID         : Integer;
    User       : String;
    TabSheet   : TcxTabSheet;
    Conversation : TfrmConversation;
  end;

  TfrmServer = class(TForm)
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
    procedure FormCreate(Sender: TObject);
    procedure IdTCPServer1Connect(AContext: TIdContext);
    procedure FormDestroy(Sender: TObject);
    procedure IdTCPServer1Execute(AContext: TIdContext);
    procedure IdTCPServer1Disconnect(AContext: TIdContext);
    procedure vwUsersSelectionChanged(Sender: TcxCustomGridTableView);
  private
    FStringList: TStringList;
    FConnectionDict : TObjectDictionary<String, TConnection>;
    FIdCounter : Integer;
    procedure AddConnection(AConnection : TConnection);
    procedure RemoveConnection(AConnection : TConnection);
    procedure ReadFromContent(AContext: TIdContext);
    procedure SendMessage(const AMessage : String; AIPFrom : String = ''; AIPTo : String = '');
    procedure DoAfterSend;
    function GetAllUsers : String;
    procedure UmConnected(var Message: TMessage); message UM_CONNECTED;
    procedure UmDisconnected(var Message: TMessage); message UM_DISCONNECTED;
    procedure UmExecute(var Message: TMessage); message UM_EXECUTE;
  public
    { Public declarations }
  end;

var
  frmServer: TfrmServer;

implementation

{$R *.dfm}

procedure TfrmServer.FormCreate(Sender: TObject);
begin
  FStringList := TStringList.Create;
  FConnectionDict := TObjectDictionary<String, TConnection>.Create;
  IdTCPServer1.Active := true;
  splitterBottom.CloseSplitter;
end;

procedure TfrmServer.FormDestroy(Sender: TObject);
begin
  FStringList.Free;
  FConnectionDict.Free;
end;

procedure TfrmServer.AddConnection(AConnection : TConnection);
begin
  Inc(FIdCounter);
  AConnection.ID := FIdCounter;

  FConnectionDict.Add(AConnection.IP, AConnection);

  vwUsers.DataController.RecordCount := vwUsers.DataController.RecordCount + 1;
  vwUsers.DataController.Values[vwUsers.DataController.RecordCount -1, vwUsersID.Index] := FIdCounter;
  vwUsers.DataController.Values[vwUsers.DataController.RecordCount -1, vwUsersUSER_NAME.Index] := AConnection.User;
  vwUsers.DataController.Values[vwUsers.DataController.RecordCount -1, vwUsersIP.Index] := AConnection.IP;
  vwUsers.DataController.Post;
end;

procedure TfrmServer.RemoveConnection(AConnection: TConnection);
Var
  I : Integer;
begin
  for I := 0 to vwUsers.DataController.RecordCount -1 do
    if vwUsers.DataController.Values[I, vwUSERSID.Index] = AConnection.ID then
    begin
      vwUsers.DataController.DeleteRecord(I);
      Break;
    end;
  if Assigned(AConnection.TabSheet) then
    AConnection.TabSheet.Free;
  FConnectionDict.Remove(AConnection.IP);
end;

procedure TfrmServer.ReadFromContent(AContext: TIdContext);
begin
  FStringList.DelimitedText:= AContext.Connection.IOHandler.ReadLn;
end;

procedure TfrmServer.IdTCPServer1Connect(AContext: TIdContext);
Var
  AConnection : TConnection;
begin
  AConnection := TConnection.Create;
  AConnection.Connection:= AContext.Connection;
  AConnection.IP := AContext.Connection.Socket.Binding.PeerIP;
  AConnection.User := AContext.Connection.IOHandler.ReadLn;
  AContext.Data := AConnection;
  PostMessage(Handle, UM_CONNECTED, Integer(Pointer(AConnection)), 0);
end;

procedure TfrmServer.IdTCPServer1Disconnect(AContext: TIdContext);
Var
  AConnection: TConnection;
begin
  AConnection:= TConnection(AContext.Data);
  AContext.Data := nil;
  PostMessage(Handle, UM_DISCONNECTED, Integer(Pointer(AConnection)), 0);
end;

procedure TfrmServer.IdTCPServer1Execute(AContext: TIdContext);
Var
  AStringList : TStringList;
begin
  AStringList := TStringList.Create;
  AStringList.DelimitedText := AContext.Connection.IOHandler.ReadLn;
  PostMessage(Handle, UM_EXECUTE, Integer(Pointer(AStringList)), 0);
end;

procedure TfrmServer.SendMessage(const AMessage : String; AIPFrom : String = ''; AIPTo : String = '');
Var
  AConnection : TConnection;
begin
  if AIPTo <> '' then
  begin
    if FConnectionDict.TryGetValue(AIPTo, AConnection) then
      AConnection.Connection.IOHandler.WriteLn(AMessage);
  end
  else
  begin
    for AIPTo in FConnectionDict.Keys do
      FConnectionDict[AIPTo].Connection.IOHandler.WriteLn(AMessage);
  end;
end;

function TfrmServer.GetAllUsers: String;
Var
  AIP : String;
begin
  FStringList.Clear;
  for AIP in FConnectionDict.Keys do
    FStringList.Add(FConnectionDict[AIP].User + ';' + AIP);
  Result := FStringList.DelimitedText;
end;

procedure TfrmServer.vwUsersSelectionChanged(Sender: TcxCustomGridTableView);
Var
  AID : Integer;
  AIP : String;
  AConnection : TConnection;
begin
  if vwUsers.Controller.SelectedRecordCount > 0 then
  begin
    AID := vwUsers.Controller.SelectedRecords[0].Values[vwUsersID.Index];
    AIP := vwUsers.Controller.SelectedRecords[0].Values[vwUsersIP.Index];

    AConnection := FConnectionDict[AIP];

    if Assigned(FConnectionDict[AIP].TabSheet) then
      PageControl.ActivePage := FConnectionDict[AIP].TabSheet
    else
    begin
      AConnection.TabSheet := TcxTabSheet.Create(Self);
      AConnection.TabSheet.PageControl := PageControl;

      AConnection.Conversation := TfrmConversation.Create(AConnection.TabSheet);
      AConnection.Conversation.Align := alClient;
      AConnection.Conversation.ManualDock(AConnection.TabSheet);
      AConnection.Conversation.lblName.Caption := AConnection.User;
      AConnection.Conversation.AfterSend := DoAfterSend;
      AConnection.Conversation.Show;
    end;
  end;
end;

procedure TFrmServer.UmConnected(var Message: TMessage);
Var
  AConnection: TConnection;
begin
  AConnection := TConnection(Pointer(Message.WParam));
  AddConnection(AConnection);
  AConnection.Connection.IOHandler.Writeln('Connected.');
  SendMessage('USERS,' + GetAllUsers);
end;

procedure TFrmServer.UmDisconnected(var Message: TMessage);
Var
  AConnection: TConnection;
begin
  AConnection:= TConnection(Pointer(Message.WParam));
  RemoveConnection(AConnection);
end;

procedure TFrmServer.UmExecute(var Message: TMessage);
Var
  AStringList : TStringList;
begin
  try
    AStringList := TStringList(Pointer(Message.WParam));
    if FStringList[0] = 'MSG' then
      SendMessage(FStringList[1], FStringList[2]);
  except
    on e: Exception do
    begin
     // AContext.Connection.IOHandler.WriteLn('server_error='+e.message);
    end;
  end;
end;

procedure TfrmServer.DoAfterSend;
Var
  AID : Integer;
  AIP : String;
  AConnection : TConnection;
begin
  if vwUsers.Controller.SelectedRecordCount > 0 then
  begin
    AIP := vwUsers.Controller.SelectedRecords[0].Values[vwUsersIP.Index];

    AConnection := FConnectionDict[AIP];
    with AConnection.Conversation do
      SendMessage(LastMessage, '', AConnection.IP);
  end;
end;

end.
