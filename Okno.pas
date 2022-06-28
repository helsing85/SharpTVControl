unit Okno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CPort, StdCtrls, CPortCtl, ExtCtrls, Gauges, Wysylanie, ComCtrls;

type
  TForm1 = class(TForm)
    ComPort1: TComPort;
    Menu: TPanel;
    But_port_option: TButton;
    ComLed1: TComLed;
    But_Open: TButton;
    Czekaj: TTimer;
    Memo1: TMemo;
    Zakladki: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Gauge1: TGauge;
    ScrollBar1: TScrollBar;
    But_Vol2: TButton;
    Edit1: TEdit;
    But_Vol1: TButton;
    StatusBar1: TStatusBar;
    Czas: TTimer;
    TimeOut: TTimer;
    Label1: TLabel;
    Nr_kanalu: TLabel;
    Edit2: TEdit;
    But_Chan1: TButton;
    Panel2: TPanel;
    Button0: TButton;
    Button9: TButton;
    Button8: TButton;
    Button7: TButton;
    Button6: TButton;
    Button5: TButton;
    Button4: TButton;
    Button3: TButton;
    Button2: TButton;
    Button1: TButton;
    Podwojny: TCheckBox;
    procedure ComPort1AfterOpen(Sender: TObject);
    procedure ComPort1AfterClose(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure But_port_optionClick(Sender: TObject);
    procedure But_Vol1Click(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
    procedure But_OpenClick(Sender: TObject);
    procedure But_Vol2Click(Sender: TObject);
    procedure CzekajTimer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CzasTimer(Sender: TObject);
    procedure TimeOutTimer(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure But_Chan1Click(Sender: TObject);
    procedure ZakladkiChange(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
    procedure PodwojnyClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Zmiana_stanu;

    { Public declarations }
  end;

var
  Form1: TForm1;
  Port_otwarty : boolean;
  Komunikacja : boolean;
  Rodzaj : string[4];
  TV : record
        volume : integer;
        kanal : integer;
  end;

implementation

{$R *.dfm}


//*********************************************

procedure TForm1.ComPort1AfterOpen(Sender: TObject);
begin
Port_otwarty := true;
end;

//*********************************************

procedure TForm1.ComPort1AfterClose(Sender: TObject);
begin
Port_otwarty := false;
end;

//*********************************************

procedure TForm1.Zmiana_stanu;
begin

if ComPort1.Connected then
        begin
           But_open.Caption := 'Zamknij port';
           Port_otwarty := true;
           StatusBar1.Panels.Items[2].Text := 'Port otwarty';
        end else
        begin
           But_open.Caption := 'Otworz port';
           Port_otwarty := false;
           StatusBar1.Panels.Items[2].Text := 'Port zamkniêty';
        end;

end;

//*********************************************

procedure TForm1.FormCreate(Sender: TObject);
begin

Memo1.Width := Form1.Width div 2;
Zakladki.Width := Form1.Width - Memo1.Width;

zmiana_stanu;

Edit1.Text := IntToStr(ScrollBar1.Position);


end;

//*********************************************

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin

if TScrollBar(sender).Position > TScrollBar(sender).Max
        THEN TScrollBar(sender).Position := TScrollBar(sender).Min;

Edit1.Text := IntToStr(ScrollBar1.Position);

Gauge1.Progress := TScrollBar(sender).Position;

glosnosc(ScrollBar1.Position);

end;

//*********************************************

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin

  //format kodu: 00
  if key = #8 then exit; //backspace
  if key = #13 then exit;
  //na pozycji 1, 2, 4, 5, 6 mo¿na wpisywaæ jedynie cyfry

     if not (ord(key) in [48..57]) then
     begin
       ShowMessage('Tylko cyfry w tym oknie');
       key:=#0;
       exit;
     end;

     If Length(TEdit(sender).Text) = 1 then
        if StrToInt(TEdit(sender).Text) > 6 then
        begin
            TEdit(sender).Clear;
            ShowMessage('Jedynie wartosci z przedzialu <0;60>');
            key:=#0;
            TEdit(sender).SelStart:=1;
            exit;
        end;

end;

//*********************************************

procedure TForm1.Edit1Change(Sender: TObject);
begin
  If TEdit(sender).Text = '' then ScrollBar1.Position := 0;

  If (Length(TEdit(sender).Text) > 0) AND (StrToInt(TEdit(sender).Text) < 61 )  then
     ScrollBar1.Position := StrToInt(TEdit(sender).Text);

end;

//*********************************************

procedure TForm1.But_port_optionClick(Sender: TObject);
begin
ComPort1.ShowSetupDialog;
end;

//*********************************************

procedure TForm1.But_Vol1Click(Sender: TObject);
begin
glosnosc(ScrollBar1.Position);
end;

//*********************************************

procedure TForm1.ComPort1RxChar(Sender: TObject; Count: Integer);
var
odpowiedz : string;
begin

 TimeOut.Enabled := false;
 ComPort1.ReadStr(odpowiedz, Count);

 if Rodzaj = 'RGLO' then
 begin
   odpowiedz := Copy(odpowiedz,1,Length(odpowiedz)-1);
   if odpowiedz = 'ERR' then exit;
   TV.volume := StrToInt(odpowiedz);
   ScrollBar1.Position := tv.volume;
   end;

 if (Rodzaj = 'WGLO') then
 begin
   odpowiedz := Copy(odpowiedz,1,Length(odpowiedz)-1);

   if odpowiedz = 'ERR' then exit;
   end;

 if (Rodzaj = 'WKAN') then
 begin
   odpowiedz := Copy(odpowiedz,1,Length(odpowiedz)-1);
   Nr_kanalu.Caption := IntToStr(TV.kanal);
   if odpowiedz = 'ERR' then exit;
   end;


 if Rodzaj = 'RKAN' then
 begin
   odpowiedz := Copy(odpowiedz,1,Length(odpowiedz)-1);
   if odpowiedz = 'ERR' then exit;
   TV.kanal := StrToInt(odpowiedz);
   Nr_kanalu.Caption := (odpowiedz);
   end;

 Form1.Memo1.Lines.Add(odpowiedz);
 Form1.Czekaj.Enabled := true;

end;

//*********************************************

procedure TForm1.But_OpenClick(Sender: TObject);
begin

try
   ComPort1.Open;
   zmiana_stanu;
except
   on EComPort do
   begin
        MessageBox(Handle, 'Nie udalo sie otworzyc portu', 'Uwaga', MB_OK or MB_ICONWARNING);
        ComPort1.Close;
        exit;
   end;
end;

Form1.ZakladkiChange(nil);

end;

//*********************************************

procedure TForm1.But_Vol2Click(Sender: TObject);
begin
sprawdz_glosnosc;
end;

//*********************************************

procedure TForm1.CzekajTimer(Sender: TObject);
begin
Komunikacja := false;
Czekaj.Enabled := false;
end;

//*********************************************

procedure TForm1.FormResize(Sender: TObject);
begin
Memo1.Width := Form1.ClientWidth div 2;
Zakladki.Width := Form1.ClientWidth - Memo1.Width ;
Refresh;
end;

//*********************************************

procedure TForm1.CzasTimer(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := TimeToStr(Now());
end;

//*********************************************

procedure TForm1.TimeOutTimer(Sender: TObject);
begin
Memo1.Lines.Add('TimeOut');
TimeOut.Enabled := false;
//ComPort1.Close;
//ComPort1.Open;
end;

//*********************************************

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin

  //format kodu: 00
  if key = #8 then exit; //backspace
  if key = #13 then exit;

     if not (ord(key) in [48..57]) then
     begin
       ShowMessage('Tylko cyfry w tym oknie');
       key:=#0;
       exit;
     end;


end;

//*********************************************

procedure TForm1.But_Chan1Click(Sender: TObject);
begin

if (Edit2.Text = '') then
  begin
     Edit2.Text := '0';
  end;

kanal(StrToInt(Edit2.Text));

end;

//*********************************************

procedure TForm1.ZakladkiChange(Sender: TObject);
begin
if Port_otwarty then
begin

   if TabSheet1.Visible
      then sprawdz_glosnosc;

   if TabSheet2.Visible
      then sprawdz_kanal;

end;
end;

//*********************************************

procedure TForm1.PodwojnyClick(Sender: TObject);
begin
Edit2.Text :='';
end;

//*********************************************

procedure TForm1.ButtonClick(Sender: TObject);
var
nazwa : string[1];
begin

if ( not Podwojny.Checked ) then
begin
   Copy(TButton(sender).Name,7,1);
   Edit2.Text :=  Copy(TButton(sender).Name,7,1);
   kanal(StrToInt(Edit2.Text));
//   Panel2.Enabled := false;
end;

if ( Podwojny.Checked ) then
begin
   if Length(Edit2.Text) = 2
      then Edit2.Text :='';
   if Edit2.Text = ''
      then Edit2.Text := Copy(TButton(sender).Name,7,1)
      else
      begin
         Edit2.Text := Edit2.Text + Copy(TButton(sender).Name,7,1);
         kanal(StrToInt(Edit2.Text));
//         Panel2.Enabled := false;
      end;
end;

end;


//*********************************************
end.
