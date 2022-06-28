program SterowanieTV;

uses
  Forms,
  Okno in 'Okno.pas' {Form1},
  Wysylanie in 'Wysylanie.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
