unit Unit1;

{$MODE Delphi}

interface

uses
  {Windows,} Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, {XPMan,} Menus, LResources, IniFiles;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Label2: TLabel;
    TrackBar1: TTrackBar;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    ListBox1: TListBox;
    Button2: TButton;
    LabeledEdit3: TLabeledEdit;
    GroupBox3: TGroupBox;
    Button3: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet5: TTabSheet;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    Image1: TImage;
    ProgressBar1: TProgressBar;
    ComboBox1: TComboBox;
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure LabeledEdit3Change(Sender: TObject);
  private
    { Private declarations }
  public
    P: TPoint;
    { Public declarations }
  end;

var
  Form1: TForm1;
  IniFile: TIniFile;
  
implementation

uses Unit2;


procedure XY(S: String; var X, Y: String);
begin
  //S := ListBox1.Items[ListBox1.ItemIndex];
  Delete(S, 1, Pos(':', S) + 1);
  X := Copy(S, 1, Pos(',', S) - 1);
  Y := Copy(S, Pos(',', S) + 2, Length(S));
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
{Label1.Caption := '���������� ���� � ����: (' + IntToStr(X) + ', ' + IntToStr(Y) + ')';
GetCursorPos(P);
Label2.Caption := '���������� ���� ���������: (' + IntToStr(P.X) + ', ' + IntToStr(P.Y) + ')'}
end;

procedure TForm1.Button1Click(Sender: TObject);
var _X, _Y: integer;
begin
_X := StrToInt(LabeledEdit1.Text);
_Y := StrToInt(LabeledEdit2.Text);
SetCursorPos(_X, _Y);
//mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
//mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
end;

procedure TForm1.FormClick(Sender: TObject);
begin
  {LabeledEdit1.Text := IntToStr(P.X);
  LabeledEdit2.Text := IntToStr(P.Y);
  ListBox1.Items.Add('���������: ' + IntToStr(P.X) + ', ' + IntToStr(P.Y));
  ListBox1.Selected[ListBox1.Items.Count - 1] := TRUE;
  Button2.Enabled := TRUE;}
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  Form2.AlphaBlendValue := TrackBar1.Position;
  Label3.Caption := IntToStr(TrackBar1.Position);
  IniFile.WriteInteger('���������','������������', TrackBar1.Position);
end;

procedure TForm1.FormCreate(Sender: TObject);
var i, k: integer;
    S: String;
begin
  if FileExists(ExtractFilePath(Application.ExeName) + 'Items.it') then
  ComboBox1.Items.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Items.it')
  else
  ComboBox1.Items.SaveToFile(ExtractFilePath(Application.ExeName) + 'Items.it');
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
  //Form1.AlphaBlendValue := TrackBar1.Position;
  k := ComboBox1.Items.IndexOf(IniFile.ReadString('���������','���������', ''));
  //ShowMessage(IntToStr(k));
  if (FileExists(IniFile.ReadString('���������','���������', ''))) and
  (k = -1) then
  begin
    ComboBox1.Items.Add(IniFile.ReadString('���������','���������', ''));
    ComboBox1.Items.SaveToFile(ExtractFilePath(Application.ExeName) + 'Items.it');
  end;
  CheckBox1.Checked := IniFile.ReadBool('���������','���������', FALSE);
  if CheckBox1.Checked then
  begin
    ListBox1.Items.LoadFromFile(IniFile.ReadString('���������','���������', ''));
    if ListBox1.Items.Count > 0 then CheckBox1.Enabled := TRUE;
  end;

  for i := 0 to ComboBox1.Items.Count do
  if not FileExists(ComboBox1.Items[i]) then ComboBox1.Items.Delete(i);
  LabeledEdit3.Text := IntToStr(IniFile.ReadInteger('���������','��������', 100));
  //TrackBar1.Position := IniFile.ReadInteger('���������','������������', 150);

  label4.Caption := '��������� ������' + #13#10 + '� �������� "' + Form1.Caption + '"' + #13#10 +   //' + #13#10 + '
               #13#10 + #13#10 + '��������� ����� � 2012 ������� �. �.' + #13#10 +
              '�������, ����������� ���� ��������.' + #13#10 + #13#10 +
              '����� �������, �������, ����������� - ' + #13#10 +
              '� �������� ������� �� ������' + #13#10 + 'quoe@mail.ru';
end;

procedure TForm1.ListBox1Click(Sender: TObject);
var X, Y: String;
begin
  if Pos('����', ListBox1.Items[ListBox1.ItemIndex]) <> 0 then exit;
  XY(ListBox1.Items[ListBox1.ItemIndex], X, Y);
  LabeledEdit1.Text := X;
  LabeledEdit2.Text := Y;
end;

procedure TForm1.Button2Click(Sender: TObject);
var i, _Sleep: integer;
    S, X, Y: string;
    T: TPoint;
begin
  ProgressBar1.Position := 0;
  GetCursorPos(T);
  _Sleep := StrToInt(LabeledEdit3.Text);
  ProgressBar1.Max := ListBox1.Items.Count;
  for i := 0 to ListBox1.Items.Count - 1 do
  begin
    if Pos('���������', ListBox1.Items[i]) <> 0 then
    begin
      XY(ListBox1.Items[i], X, Y);
      SetCursorPos(StrToInt(X), StrToInt(Y));
      Sleep(_Sleep);
    end;
    if Pos('����', ListBox1.Items[i]) <> 0 then
    begin
      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
    end;
    ProgressBar1.Position := i + 1;
  end;
  SetCursorPos(T.X, T.Y);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ListBox1.Items.Add('����');
  ListBox1.Selected[ListBox1.Items.Count - 1] := TRUE;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if (Button4.Caption = '�������?') then
  begin
    ListBox1.Clear;
    Button4.Caption := '��������';
  end
  else
    Button4.Caption := '�������?';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if (Button5.Caption = '������') then
  begin
    Form2.Show;
    Button5.Caption := '����������';
  end
  else
  begin
    Form2.Hide;
    Button5.Caption := '������';
  end;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
  Button4.Caption := '��������';
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  if CheckBox1.Checked then ListBox1.Items.LoadFromFile(IniFile.ReadString('���������','���������', ''));
  if OpenDialog1.Execute then
  begin                             //���� ���� ������, ��..
    ListBox1.Items.LoadFromFile(OpenDialog1.FileName);
    IniFile.WriteString('���������','���������', OpenDialog1.FileName);
    CheckBox1.Enabled := TRUE;
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    ListBox1.Items.SaveToFile(SaveDialog1.FileName + '.tl');
    IniFile.WriteString('���������','���������', SaveDialog1.FileName + '.tl');
    CheckBox1.Enabled := TRUE;
  end;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  if ListBox1.Items.Count > 0 then
  begin
    ListBox1.Items.Delete(ListBox1.ItemIndex);
    ListBox1.Selected[ListBox1.Items.Count - 1] := TRUE;
  end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    IniFile.WriteBool('���������','���������', TRUE)
  else
    IniFile.WriteBool('���������','���������', FALSE);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  if FileExists(ComboBox1.Items[ComboBox1.ItemIndex]) then
  ListBox1.Items.LoadFromFile(ComboBox1.Items[ComboBox1.ItemIndex]);
end;

procedure TForm1.LabeledEdit3Change(Sender: TObject);
begin
  IniFile.WriteInteger('���������','��������', StrToInt(LabeledEdit3.Text));
end;

initialization
  {$i Unit1.lrs}
  {$i Unit1.lrs}

end.
