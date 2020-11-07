object frmSort: TfrmSort
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Sort'
  ClientHeight = 525
  ClientWidth = 826
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 61
    Top = 128
    Width = 52
    Height = 13
    Caption = 'BubbleSort'
  end
  object Label2: TLabel
    Left = 445
    Top = 128
    Width = 46
    Height = 13
    Caption = 'QuickSort'
  end
  object Label3: TLabel
    Left = 253
    Top = 128
    Width = 63
    Height = 13
    Caption = 'SelectionSort'
  end
  object Label4: TLabel
    Left = 629
    Top = 128
    Width = 30
    Height = 13
    Caption = 'Result'
  end
  object Startbtn: TButton
    Left = 352
    Top = 32
    Width = 113
    Height = 49
    Caption = 'Start'
    TabOrder = 0
    OnClick = StartbtnClick
  end
  object BubbleSOrt_ListBox: TListBox
    Left = 61
    Top = 160
    Width = 121
    Height = 209
    ItemHeight = 13
    TabOrder = 1
  end
  object SelectionSort_ListBox: TListBox
    Left = 253
    Top = 160
    Width = 121
    Height = 209
    ItemHeight = 13
    TabOrder = 2
  end
  object QuickSort_ListBox: TListBox
    Left = 445
    Top = 160
    Width = 121
    Height = 209
    ItemHeight = 13
    TabOrder = 3
  end
  object Result_ListBox: TListBox
    Left = 629
    Top = 160
    Width = 121
    Height = 209
    ItemHeight = 13
    TabOrder = 4
  end
end
