unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TForm2 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  Form1.TrackBar1.Position := IniFile.ReadInteger('���������','������������', 150);
  Form2.AlphaBlendValue := Form1.TrackBar1.Position;
end;

procedure TForm2.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Form1.Label1.Caption := '���������� ���� � ����: (' + IntToStr(X) + ', ' + IntToStr(Y) + ')';
  GetCursorPos(Form1.P);
  Form1.Label2.Caption := '���������� ���� ���������: (' + IntToStr(Form1.P.X) + ', ' + IntToStr(Form1.P.Y) + ')'
end;

procedure TForm2.FormClick(Sender: TObject);
begin
  Form1.LabeledEdit1.Text := IntToStr(Form1.P.X);
  Form1.LabeledEdit2.Text := IntToStr(Form1.P.Y);
  Form1.ListBox1.Items.Add('���������: ' + IntToStr(Form1.P.X) + ', ' + IntToStr(Form1.P.Y));
  Form1.ListBox1.Selected[Form1.ListBox1.Items.Count - 1] := TRUE;
  Form1.Button2.Enabled := TRUE;
end;

procedure TForm2.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Form2.Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Button5.Caption := '������';
end;

procedure TForm2.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  Form1.Button3Click(Sender);
end;

end.