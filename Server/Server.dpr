program Server;

uses
  Vcl.Forms,
  Conversation in '..\Common\Conversation.pas' {frmConversation},
  ChatRoom in '..\Common\ChatRoom.pas' {frmChatRoom},
  ServerChatRoom in 'ServerChatRoom.pas' {frmServerChatRoom},
  Tools in '..\Common\Tools.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmServerChatRoom, frmServerChatRoom);
  Application.Run;
end.
