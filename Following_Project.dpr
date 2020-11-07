program Following_Project;

uses
  Vcl.Forms,
  uSort in 'uSort.pas' {frmSort},
  uSortThread in 'uSortThread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSort, frmSort);
  Application.Run;
end.
