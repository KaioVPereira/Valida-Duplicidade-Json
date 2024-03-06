object frm_Principal: Tfrm_Principal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 441
  ClientWidth = 956
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 664
    Top = 60
    Width = 154
    Height = 15
    Caption = 'C'#243'digos Externos Duplicados'
  end
  object Label2: TLabel
    Left = 56
    Top = 72
    Width = 221
    Height = 15
    Caption = 'C'#243'digos Externos do Arquivo Selecionado'
  end
  object Button1: TButton
    Left = 408
    Top = 216
    Width = 89
    Height = 25
    Caption = 'Buscar Arquivo'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 24
    Top = 104
    Width = 321
    Height = 281
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Memo2: TMemo
    Left = 608
    Top = 104
    Width = 321
    Height = 281
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Left = 432
    Top = 376
  end
end
