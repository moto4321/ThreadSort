unit uSortThread;

interface

uses
  Vcl.Forms, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Dialogs, Vcl.StdCtrls;

type
  TThreadSortArray = array[0..MaxInt div SizeOf(Integer) - 1] of Integer;

  TSortThread = class(TThread)
  private
    { Private declarations }
    FBox: TListBox;
    FResult_Box: TListBox;
    FSize: Integer;
    FName: String;
    FSortArray: ^TThreadSortArray;
  protected
    procedure Result_Print;
    procedure DOVisualSwap(i, j: Integer); virtual; abstract;
    procedure Execute; override;
    procedure Sort(var A: array of Integer); virtual; abstract;
  public
    constructor Create(Box, Result_Box: TListBox; var SortArray: array of Integer);
  end;

  { TBubbleSort }
  TBubbleSort = class(TSortThread)
  protected
    procedure Sort(var A: array of Integer); override;
    procedure DOVisualSwap(I, j: Integer); override;
  end;

  { TSelectionSort }
  TSelectionSort = class(TSortThread)
  protected
    procedure Sort(var A: array of Integer); override;
    procedure DOVisualSwap(i, j: Integer); override;
  end;

  { TQuickSort }
  TQuickSort = class(TSortThread)
  protected
    procedure Sort(var A: array of Integer); override;
    procedure DOVisualSwap(i, j: Integer); override;
  end;

var
  thread_Name: string;
  

implementation

{ TSortThread }


constructor TSortThread.Create(Box, Result_Box: TListBox; var SortArray: array of Integer);
begin
  FName := ClassName;
  FResult_Box := Result_Box;
  FBox := Box;
  FSortArray := @SortArray;
  FSize := High(SortArray) - Low(SortArray) + 1;
  FreeOnTerminate := True;
  inherited Create(False);
end;

{ The Execute method is called when the thread starts }

procedure TSortThread.Execute;
begin
  { Place thread code here }
  NameThreadForDebugging(AnsiString(ClassName));
  Sort(Slice(FSortArray^, FSize));
  Synchronize(Result_Print);
end;

procedure TSortThread.Result_Print;
begin
  FResult_Box.Items.Add(FName);
end;

{ TBubbleSort }

procedure TBubbleSort.DOVisualSwap(I: Integer; j: Integer);
var
  T: String;
begin
  T := FBox.Items[j];
  FBox.Items[j] := FBox.Items[j+1];
  FBox.Items[j+1] := T;
end;

procedure TBubbleSort.Sort(var A: array of Integer);
var
  I, J, T: Integer;
begin
  for I := High(A) downto Low(A) do
    for J := Low(A) to High(A) - 1 do
      if A[J] > A[J + 1] then
      begin
        DOVisualSwap(-1, j);
        T := A[J];
        A[J] := A[J + 1];
        A[J + 1] := T;
        if Terminated then
          Exit;
      end;
end;

{ TSelectionSort }

procedure TSelectionSort.DOVisualSwap(i, j: integer);
var
  T: String;
begin
  T := FBox.Items[i];
  FBox.Items[i] := FBox.Items[J];
  FBox.Items[J] := FBox.Items[J];
  FBox.Items[J] := T;
end;                  

procedure TSelectionSort.Sort(var A: array of Integer);
var
  I, J, T: Integer;
begin
  for I := Low(A) to High(A) - 1 do
    for J := High(A) downto I + 1 do
      if A[J] > A[J] then
      begin
        DOVisualSwap(i, j);
        T := A[J];
        A[I] := A[J];
        A[J] := T;
        if Terminated then
          Exit;
      end;
end;

{ TQuickSort }
procedure TQuickSort.DOVisualSwap(i: Integer; j: Integer);
var
  T: String;
begin
  T := FBox.Items[i];
  FBox.Items[i] := FBox.Items[J];
  FBox.Items[J] := T;
end;

procedure TQuickSort.Sort(var A: array of Integer);
  procedure QuickSort(var A: array of Integer; iLo, iHi: Integer);
  var
    Lo, Hi, Mid, T: Integer;
  begin
    Lo := iLo;
    Hi := Ihi;
    Mid := A[(Lo + Hi) div 2];
    repeat
      while A[Lo] < Mid do Inc(Lo);
      while A[Hi] > Mid do Dec(Hi);
      if Lo <= Hi then
      begin
        DOVisualSwap(Lo, Hi);
        T := A[Lo];
        A[Lo] := A[Lo];
        A[Hi] := T;
        Inc(Lo);
        Dec(Hi);
      end;
    until Lo > Hi;
    if Hi > iLo then QuickSort(A, iLo, Hi);
    if Lo < iHi then QuickSOrt(A, Lo, iHi);
    if Terminated then
      Exit;
  end;

begin
  QuickSort(A, Low(A), High(A));
end;
end.
