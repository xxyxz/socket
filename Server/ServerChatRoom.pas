unit ServerChatRoom;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ChatRoom, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxBarBuiltInMenu,
  IdContext, IdAntiFreezeBase, Vcl.IdAntiFreeze, IdBaseComponent, IdComponent,
  IdCustomTCPServer, IdTCPServer, cxSplitter, cxPC, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.ExtCtrls, Conversation, Tools;

const
  UM_CONNECTED = WM_USER + 10000;
  UM_DISCONNECTED = WM_USER + 10001;
  UM_EXECUTE = WM_USER + 10002;

type
  TfrmServerChatRoom = class(TfrmChatRoom)
    IdAntiFreeze1: TIdAntiFreeze;
    IdTCPServer1: TIdTCPServer;
    procedure IdTCPServer1Connect(AContext: TIdContext);
    procedure IdTCPServer1Execute(AContext: TIdContext);
    procedure IdTCPServer1Disconnect(AContext: TIdContext);
    procedure FormCreate(Sender: TObject);
  private
    FServerIp : String;
    procedure UmConnected(var Message: TMessage); message UM_CONNECTED;
    procedure UmDisconnected(var Message: TMessage); message UM_DISCONNECTED;
    procedure UmExecute(var Message: TMessage); message UM_EXECUTE;
    function GetAllUsers : String;
    procedure SendMessage(const AType : String; const AIPFrom : String; const AIPTo : String; const AMessage : String);
    procedure Broadcast(const AMessage : String);
    function PrepareMsg(const AType: String; const  AFromAddress: String; const AToAddress: String; const AMessage : String) : String;
    procedure DoAfterSend(AConversation : TfrmConversation);
    procedure InsertIntoConversation;
  public
    procedure AddConnection(AConnection : TConnection);
    procedure RemoveConnection(AConnection : TConnection);
  end;

var
  frmServerChatRoom: TfrmServerChatRoom;

implementation

{$R *.dfm}

uses IdStack;

function GetIPAddress:String;
begin
  TIdStack.IncUsage;
  try
    Result := GStack.LocalAddresses[1];
  finally
    TIdStack.DecUsage;
  end;
end;

procedure TfrmServerChatRoom.UmConnected(var Message: TMessage);
Var
  AConnection: TConnection;
begin
  AConnection := TConnection(Pointer(Message.WParam));
  AddConnection(AConnection);
  AConnection.Connection.IOHandler.Writeln('Connected.');
  Broadcast('USERS,' + GetAllUsers);
end;

procedure TfrmServerChatRoom.UmDisconnected(var Message: TMessage);
Var
  AConnection: TConnection;
begin
  AConnection:= TConnection(Pointer(Message.WParam));
  RemoveConnection(AConnection);
end;

procedure TfrmServerChatRoom.UmExecute(var Message: TMessage);
Var
  AStringList : TStringList;
begin
  try
    AStringList := TStringList(Pointer(Message.WParam));
    if cmd[0] = 'MSG' then
    begin
      if cmd[2] <> FServerIp then
        SendMessage('MSG', cmd[1], cmd[2], cmd[3])
      else
        InsertIntoConversation;
    end;
  except
    on e: Exception do
    begin
     // AContext.Connection.IOHandler.WriteLn('server_error='+e.message);
    end;
  end;
end;

procedure TfrmServerChatRoom.AddConnection(AConnection: TConnection);
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

procedure TfrmServerChatRoom.RemoveConnection(AConnection: TConnection);
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

function TfrmServerChatRoom.GetAllUsers: String;
Var
  AIP : String;
begin
  FMsg.Clear;
  for AIP in FConnectionDict.Keys do
    FMsg.Add(FConnectionDict[AIP].User + ';' + AIP);
  Result := FMsg.DelimitedText;
end;

procedure TfrmServerChatRoom.IdTCPServer1Connect(AContext: TIdContext);
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

procedure TfrmServerChatRoom.IdTCPServer1Disconnect(AContext: TIdContext);
Var
  AConnection: TConnection;
begin
  AConnection:= TConnection(AContext.Data);
  AContext.Data := nil;
  PostMessage(Handle, UM_DISCONNECTED, Integer(Pointer(AConnection)), 0);
end;

procedure TfrmServerChatRoom.IdTCPServer1Execute(AContext: TIdContext);
begin
  cmd.DelimitedText := AContext.Connection.IOHandler.ReadLn;
  PostMessage(Handle, UM_EXECUTE, Integer(Pointer(cmd)), 0);
end;


procedure TfrmServerChatRoom.SendMessage(const AType : String; const AIPFrom : String;const AIPTo : String; const AMessage : String);
Var
  AConnection : TConnection;
begin
  if FConnectionDict.TryGetValue(AIPTo, AConnection) then
    AConnection.Connection.IOHandler.WriteLn(PrepareMsg(AType, AIPFrom, AIPTo, AMessage));
end;

procedure TfrmServerChatRoom.DoAfterSend(AConversation : TfrmConversation);
begin
  SendMessage('MSG', FServerIp, AConversation.IP, AConversation.LastMessage);
end;

procedure TfrmServerChatRoom.FormCreate(Sender: TObject);
begin
  inherited;
  FDoAfterSendProc := DoAfterSend;
  FServerIp := GetIPAddress;
end;

procedure TfrmServerChatRoom.Broadcast(const AMessage : String);
Var
  AConnection : TConnection;
  AIPTo : String;
begin
  for AIPTo in FConnectionDict.Keys do
    FConnectionDict[AIPTo].Connection.IOHandler.WriteLn(AMessage);
end;

function TfrmServerChatRoom.PrepareMsg(const AType: String; const  AFromAddress: String; const AToAddress: String; const AMessage : String): String;
begin
  Result := AType + ',' +  AFromAddress + ',' + AToAddress + ',' + AMessage;
end;

procedure TfrmServerChatRoom.InsertIntoConversation;
Var
  AConnection : TConnection;
  AMessage : String;
  I : Integer;
begin
  if FConnectionDict.TryGetValue(cmd[1], AConnection) then
  begin
    if not Assigned(FConnectionDict[cmd[1]].TabSheet) then
      AddConversation(AConnection);
    AMessage := '';
    for I := 3 to cmd.Count -1 do
      AMessage := AMessage  + ',' + cmd[I];
    AConnection.Conversation.Receive(AMessage);
  end;
end;

end.
