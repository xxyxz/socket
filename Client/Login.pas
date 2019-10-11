unit Login;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Db, OracleData, Oracle,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, cxButtons, cxGroupBox;

type
  TfrmLogin = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    eIp: TEdit;
    Label2: TLabel;
    eNick: TEdit;
    bLogin: TcxButton;
    procedure bLoginClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  public

  end;

var
  frmLogin: TfrmLogin;


implementation

{$R *.DFM}

uses ClientChatRoom;

procedure TfrmLogin.bLoginClick(Sender: TObject);
begin
  with frmClientChatRoom do
    if IdTCPClient1.Connected then
       IdTCPClient1.Disconnect
    else
    begin
      IdTCPClient1.Host := eIp.Text;
      IdTCPClient1.Port := 1024;
      try
        //changed connectTimeout property
        frmClientChatRoom.UserName := eNick.Text;
        frmClientChatRoom.lblUser.Caption := eNick.Text;
        IdTCPClient1.Connect;
        Self.Close;
      except
        on e: Exception do
        begin
          if pos('connection refused',AnsiLowerCase(e.message)) > 0 then
             Application.MessageBox('Connection refused. Server is down.','Error',mb_IconError);
        end;
      end;
    end;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 //
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  bLogin.SetFocus;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  eNick.Text := GetEnvironmentVariable('USERNAME');
end;

end.
