unit ClientChatRoom;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ChatRoom, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxBarBuiltInMenu,
  cxSplitter, cxPC, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.ExtCtrls,
  IdAntiFreezeBase, Vcl.IdAntiFreeze, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, Tools, IdIntercept, Conversation,
  cxImageComboBox, cxCalendar, cxContainer, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxLabel, dxGDIPlusClasses, cxImage;

type
  TfrmClientChatRoom = class(TfrmChatRoom)
    IdTCPClient1: TIdTCPClient;
    IdAntiFreeze1: TIdAntiFreeze;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IdTCPClient1Connected(Sender: TObject);
  private
    FMsgDetail : TStringList;
    FUserName : String;
    FIP : String;
    procedure Connect;
    procedure Disconnect;
    procedure UnknowCmd;
    procedure GetUsers;
    procedure ProcessIncomingMsg;
    procedure Send(AConversation : TfrmConversation);
  public
    property UserName : String read FUserName write FUserName;
  end;

  TClientThread = class(TThread)
  protected
    procedure Execute; override;
    procedure Terminate(Sender: TObject);
  public
    constructor Create(CreateSuspended: Boolean);
  end;

var
  frmClientChatRoom: TfrmClientChatRoom;

implementation

{$R *.dfm}

uses Login, StrUtils;

procedure TfrmClientChatRoom.Connect;
var
  Login : TFrmLogin;
begin
  Login := TfrmLogin.Create(Self);
  try
    Login.ShowModal;
    if not IdTCPClient1.Connected then
      Close;
  finally
    Login.Free;
  end;
end;

procedure TfrmClientChatRoom.FormCreate(Sender: TObject);
begin
  inherited;
  FMsgDetail := TStringList.Create;
  FMsgDetail.Delimiter := ';';
  FMsgDetail.QuoteChar := #0;
  frmClientChatRoom := Self;
  FDoAfterSendProc := Send;
end;

{ TClientThread }

constructor TClientThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
  Priority := tpIdle;
  FreeOnTerminate:= true;
  OnTerminate := Terminate;
end;

procedure TClientThread.Execute;
Var
  AText : String;
begin
  with frmClientChatRoom do
  begin
    if not IdTCPClient1.Connected  then
       exit;
    repeat
      try
        AText := IdTCPClient1.IOHandler.ReadLn;
        AText := AText.Replace(#16, #13#10);
        cmd.DelimitedText:= AText;
        if cmd.Count > 0 then
        begin
          if cmd[0] = 'USERS' then
             Synchronize(GetUsers)
          else if cmd[0] = 'MSG' then
             Synchronize(ProcessIncomingMsg)
//          else if VerifyCommand(cmd.text,'list_user=',true) then
//             Synchronize(ListUsers)
//          else if VerifyCommand(cmd.text,'nick_existente=',true) then
//             Synchronize(NickExistente)
//          else if VerifyCommand(cmd.text,'server_error=',true) then
//             Synchronize(ShowServerError)
          else
           Synchronize(UnknowCmd);
        end;
      except
        on e: exception do
        begin
           if not AnsiSameText(e.message, 'Disconnected.') then
           begin
             Application.MessageBox(pchar(e.message), 'Error', mb_iconError);
             IdTCPClient1.Disconnect;
           end;
        end;
      end;
    until not IdTCPClient1.Connected or not IdTCPClient1.IOHandler.Opened;
  end;
end;

procedure TClientThread.Terminate(Sender: TObject);
begin
  frmClientChatRoom.Disconnect;
end;

procedure TfrmClientChatRoom.Disconnect;
begin
  //
end;

procedure TfrmClientChatRoom.FormShow(Sender: TObject);
begin
  inherited;
  Connect;
end;

procedure TfrmClientChatRoom.IdTCPClient1Connected(Sender: TObject);
begin
  inherited;
  IdTCPClient1.IOHandler.WriteLn(UserName);
  TClientThread.Create(false);
end;

procedure TfrmClientChatRoom.UnknowCmd;
begin
  Caption := cmd.text;
end;

procedure TfrmClientChatRoom.GetUsers;
var
  I, AMsgIndex: Integer;
  procedure Add(AIndex : Integer;const AName, AIp : String);
  Var
    AConnection : TConnection;
  begin
    vwUsers.DataController.Values[AIndex, vwUsersID.Index] := AIndex;
    vwUsers.DataController.Values[AIndex, vwUsersUSER_NAME.Index] := AName;
    vwUsers.DataController.Values[AIndex, vwUsersIP.Index] := AIp;
    vwUsers.DataController.Post;


    AConnection := TConnection.Create;
    AConnection.User := AName;
    AConnection.IP := AIp;
    AConnection.Connection := nil;
    FConnectionDict.Add(AIp, AConnection);
  end;
begin
  FConnectionDict.Clear;
  vwUsers.BeginUpdate;
  try
    vwUsers.DataController.RecordCount := cmd.Count -1 ;
    Add(0, 'Admin', IdTCPClient1.Host);
    AMsgIndex := 1;

    for I := 1 to cmd.Count -1 do
    begin
      FMsgDetail.DelimitedText := cmd[AMsgIndex];
      if  FMsgDetail[0] <> UserName then
      begin
        Add(AMsgIndex, FMsgDetail[0], FMsgDetail[1]);
        Inc(AMsgIndex);
      end
      else
        FIP :=  FMsgDetail[1];
    end;

  finally
    vwUsers.EndUpdate;
  end;

end;

procedure TfrmClientChatRoom.Send(AConversation : TfrmConversation);
begin
  IdTCPClient1.IOHandler.WriteLn('MSG,' + FIP + ',' + AConversation.Ip + ',' +  AConversation.LastMessageSingleLine);
end;

procedure TfrmClientChatRoom.ProcessIncomingMsg;
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
      AMessage := AMessage + ifthen(AMessage <> '', ',') +cmd[I];
    AConnection.Conversation.Receive(AMessage);
  end;
end;

end.
