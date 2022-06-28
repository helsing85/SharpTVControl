object Form1: TForm1
  Left = 450
  Top = 247
  HorzScrollBar.Style = ssHotTrack
  BorderStyle = bsSingle
  Caption = 'SHARP by KaC'
  ClientHeight = 485
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poNone
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Menu: TPanel
    Left = 0
    Top = 404
    Width = 600
    Height = 59
    Align = alBottom
    TabOrder = 0
    object ComLed1: TComLed
      Left = 528
      Top = 8
      Width = 25
      Height = 25
      LedSignal = lsConn
      Kind = lkBulb
    end
    object But_port_option: TButton
      Left = 184
      Top = 8
      Width = 121
      Height = 41
      Caption = 'Opcje portu'
      TabOrder = 0
      OnClick = But_port_optionClick
    end
    object But_Open: TButton
      Left = 104
      Top = 8
      Width = 73
      Height = 41
      Caption = 'Otworz port'
      TabOrder = 1
      OnClick = But_OpenClick
    end
  end
  object Memo1: TMemo
    Left = 300
    Top = 0
    Width = 300
    Height = 404
    Align = alLeft
    TabOrder = 2
  end
  object Zakladki: TPageControl
    Left = 0
    Top = 0
    Width = 300
    Height = 404
    ActivePage = TabSheet2
    Align = alLeft
    MultiLine = True
    TabIndex = 1
    TabOrder = 1
    OnChange = ZakladkiChange
    object TabSheet1: TTabSheet
      Caption = 'G'#322'o'#347'no'#347#263
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 292
        Height = 113
        Align = alTop
        TabOrder = 0
        object Gauge1: TGauge
          Left = 1
          Top = 1
          Width = 290
          Height = 33
          Align = alTop
          ForeColor = clGreen
          MaxValue = 60
          Progress = 0
          ShowText = False
        end
        object ScrollBar1: TScrollBar
          Left = 1
          Top = 80
          Width = 290
          Height = 32
          Align = alBottom
          Max = 60
          PageSize = 0
          TabOrder = 0
          OnChange = ScrollBar1Change
        end
        object But_Vol2: TButton
          Left = 2
          Top = 60
          Width = 56
          Height = 17
          Caption = 'Zapytaj'
          TabOrder = 1
          OnClick = But_Vol2Click
        end
        object Edit1: TEdit
          Left = 102
          Top = 45
          Width = 50
          Height = 21
          MaxLength = 2
          TabOrder = 2
          OnChange = Edit1Change
          OnKeyPress = Edit1KeyPress
        end
        object But_Vol1: TButton
          Left = 188
          Top = 40
          Width = 105
          Height = 33
          Caption = 'Zmie'#324
          TabOrder = 3
          OnClick = But_Vol1Click
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Kana'#322'y'
      ImageIndex = 1
      object Label1: TLabel
        Left = 19
        Top = 21
        Width = 171
        Height = 20
        Caption = 'Aktualny numer kana'#322'u:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Nr_kanalu: TLabel
        Left = 224
        Top = 0
        Width = 19
        Height = 60
        Alignment = taCenter
        Caption = '1'
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -43
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Edit2: TEdit
        Left = 16
        Top = 56
        Width = 49
        Height = 21
        MaxLength = 2
        TabOrder = 0
        OnKeyPress = Edit2KeyPress
      end
      object But_Chan1: TButton
        Left = 80
        Top = 48
        Width = 49
        Height = 33
        Caption = 'Zmie'#324
        TabOrder = 1
        OnClick = But_Chan1Click
      end
      object Panel2: TPanel
        Left = 56
        Top = 104
        Width = 153
        Height = 185
        BevelOuter = bvNone
        TabOrder = 2
        object Button0: TButton
          Left = 56
          Top = 144
          Width = 41
          Height = 41
          Caption = '0'
          TabOrder = 0
          OnClick = ButtonClick
        end
        object Button9: TButton
          Left = 112
          Top = 96
          Width = 41
          Height = 41
          Caption = '9'
          TabOrder = 1
          OnClick = ButtonClick
        end
        object Button8: TButton
          Left = 56
          Top = 96
          Width = 41
          Height = 41
          Caption = '8'
          TabOrder = 2
          OnClick = ButtonClick
        end
        object Button7: TButton
          Left = 0
          Top = 96
          Width = 41
          Height = 41
          Caption = '7'
          TabOrder = 3
          OnClick = ButtonClick
        end
        object Button6: TButton
          Left = 112
          Top = 48
          Width = 41
          Height = 41
          Caption = '6'
          TabOrder = 4
          OnClick = ButtonClick
        end
        object Button5: TButton
          Left = 56
          Top = 48
          Width = 41
          Height = 41
          Caption = '5'
          TabOrder = 5
          OnClick = ButtonClick
        end
        object Button4: TButton
          Left = 0
          Top = 48
          Width = 41
          Height = 41
          Caption = '4'
          TabOrder = 6
          OnClick = ButtonClick
        end
        object Button3: TButton
          Left = 112
          Top = 0
          Width = 41
          Height = 41
          Caption = '3'
          TabOrder = 7
          OnClick = ButtonClick
        end
        object Button2: TButton
          Left = 56
          Top = 0
          Width = 41
          Height = 41
          Caption = '2'
          TabOrder = 8
          OnClick = ButtonClick
        end
        object Button1: TButton
          Left = 0
          Top = 0
          Width = 41
          Height = 41
          Caption = '1'
          TabOrder = 9
          OnClick = ButtonClick
        end
        object Podwojny: TCheckBox
          Left = 112
          Top = 152
          Width = 41
          Height = 25
          Caption = '-/--'
          TabOrder = 10
          OnClick = PodwojnyClick
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 463
    Width = 600
    Height = 22
    Panels = <
      item
        Alignment = taCenter
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Text = 'helsing2009'
        Width = 70
      end
      item
        Alignment = taCenter
        Text = 'Czas'
        Width = 70
      end
      item
        Text = 'Status'
        Width = 50
      end>
    SimplePanel = False
  end
  object ComPort1: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    OnAfterOpen = ComPort1AfterOpen
    OnAfterClose = ComPort1AfterClose
    OnRxChar = ComPort1RxChar
    Top = 280
  end
  object Czekaj: TTimer
    Enabled = False
    Interval = 50
    OnTimer = CzekajTimer
    Left = 320
    Top = 416
  end
  object Czas: TTimer
    Interval = 1
    OnTimer = CzasTimer
    Left = 64
    Top = 416
  end
  object TimeOut: TTimer
    Enabled = False
    OnTimer = TimeOutTimer
    Left = 352
    Top = 416
  end
end
