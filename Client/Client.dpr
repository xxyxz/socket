program Client;

uses
  Vcl.Forms,
  Conversation in '..\Common\Conversation.pas' {frmConversation},
  ChatRoom in '..\Common\ChatRoom.pas' {frmChatRoom},
  ClientChatRoom in 'ClientChatRoom.pas' {frmClientChatRoom},
  Login in 'Login.pas' {frmLogin},
  Tools in '..\Common\Tools.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmClientChatRoom, frmClientChatRoom);
  Application.Run;
end.
