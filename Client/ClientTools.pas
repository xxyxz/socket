unit ClientTools;

interface

uses Classes;
var
  cmd: TStringList;

implementation

initialization
  if cmd = nil then
  begin
    cmd:= TStringList.Create;
    cmd.Options := [soStrictDelimiter];
    cmd.QuoteChar := #0;
  end;
finalization
  if cmd <> nil then
     cmd.free;
end.
