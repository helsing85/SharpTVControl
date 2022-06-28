unit Wysylanie;



interface


function glosnosc(vol:integer):string;
function sprawdz_glosnosc:string;

function kanal(numer:integer):string;
function sprawdz_kanal:string;

implementation

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CPort, StdCtrls, CPortCtl, ExtCtrls, Gauges, Okno;


//*********************************************

function glosnosc(vol:integer):string;
var
wysylanie : array[1..9] of char;
napis : string[1];
i : integer;
begin

glosnosc := '';

 if (not Port_otwarty) then
        begin
        ShowMessage('Otwórz port');
        exit;
        end;

 if (Komunikacja) then
        begin
        exit;
        end;

 Komunikacja := true;
 Rodzaj := 'WGLO';
 TV.volume := vol;

  for i:=1 to 9 do
      wysylanie[i] := ' ';


  wysylanie[1] := 'V';
  wysylanie[2] := 'O';
  wysylanie[3] := 'L';
  wysylanie[4] := 'M';
  napis := IntToStr(vol div 10);
  wysylanie[5] := napis[1];
  napis := IntToStr(vol mod 10);
  wysylanie[6] := napis[1];
  wysylanie[9] := chr($0D);

 Form1.Memo1.Lines.Add(wysylanie);

 Form1.ComPort1.WriteStr(wysylanie);
 Form1.TimeOut.Enabled := true;

end;

//*********************************************

function sprawdz_glosnosc:string;
var
wysylanie : array[1..9] of char;
i : integer;
begin
sprawdz_glosnosc := '0';

 if (not Port_otwarty) then
        begin
        ShowMessage('Otwórz port');
        exit;
        end;

 if (Komunikacja) then
        begin
        exit;
        end;

 Komunikacja := true;
 Rodzaj := 'RGLO';

  for i:=1 to 9 do
      wysylanie[i] := '?';

  wysylanie[1] := 'V';
  wysylanie[2] := 'O';
  wysylanie[3] := 'L';
  wysylanie[4] := 'M';
  wysylanie[9] := chr($0D);

 Form1.Memo1.Lines.Add(wysylanie);
 Form1.ComPort1.WriteStr(wysylanie);
 Form1.TimeOut.Enabled := true;

end;

//*********************************************

function kanal(numer:integer):string;
var
wysylanie : array[1..9] of char;
napis : string[1];
i : integer;
begin

kanal := '';

 if numer = 0 then
        begin
        ShowMessage('Nie ma kanalu numer 0');
        exit;
        end;


 if (not Port_otwarty) then
        begin
        ShowMessage('Otwórz port');
        exit;
        end;

 if (Komunikacja) then
        begin
        exit;
        end;

 Komunikacja := true;
 Rodzaj := 'WKAN';
 TV.kanal := numer;

  for i:=1 to 9 do
      wysylanie[i] := ' ';


  wysylanie[1] := 'D';
  wysylanie[2] := 'C';
  wysylanie[3] := 'C';
  wysylanie[4] := 'H';
  napis := IntToStr(numer div 10);
  wysylanie[5] := napis[1];
  napis := IntToStr(numer mod 10);
  wysylanie[6] := napis[1];
  wysylanie[9] := chr($0D);

 Form1.Memo1.Lines.Add(wysylanie);

 Form1.ComPort1.WriteStr(wysylanie);
 Form1.TimeOut.Enabled := true;

end;

//*****************************************

function sprawdz_kanal:string;
var
wysylanie : array[1..9] of char;
i : integer;
begin

sprawdz_kanal := '';

 if (not Port_otwarty) then
        begin
        ShowMessage('Otwórz port');
        exit;
        end;

 if (Komunikacja) then
        begin
        exit;
        end;

 Komunikacja := true;
 Rodzaj := 'RKAN';

  for i:=1 to 9 do
      wysylanie[i] := '?';


  wysylanie[1] := 'D';
  wysylanie[2] := 'C';
  wysylanie[3] := 'C';
  wysylanie[4] := 'H';
  wysylanie[9] := chr($0D);

 Form1.Memo1.Lines.Add(wysylanie);

 Form1.ComPort1.WriteStr(wysylanie);
 Form1.TimeOut.Enabled := true;

end;

//*****************************************






end.
