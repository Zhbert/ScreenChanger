unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    HeightEdit1: TEdit;
    WidthEdit1: TEdit;
    HeightEdit2: TEdit;
    WidthEdit2: TEdit;
    HeightEdit3: TEdit;
    WidthEdit3: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ScreenCounter1: TEdit;
    ScreenCounter2: TEdit;
    ScreenCounter3: TEdit;
    Label9: TLabel;
    ScreenCenter1: TEdit;
    ScreenCenter2: TEdit;
    ScreenCenter3: TEdit;
    Button2: TButton;
    GroupBox3: TGroupBox;
    visualizeCheckBox: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure cursorSet; // ��������� ��������� �������
    procedure hot_key(var Message: TMessage); message WM_HOTKEY;
  end;

var
  Form1: TForm1;
  foo: TPoint;

implementation
  uses Unit2;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm1.cursorSet;   //��������� ��������� �������
var
  EditsCheck1 : boolean;   //���������� ��������� ����� �����
  EditsCheck2 : boolean;   //���������� ��������� ����� �����
  EditsCheck3 : boolean;   //���������� ��������� ����� �����
begin
  //���������, ��� ��� ���� ���������� ���������
  EditsCheck1 := true;
  EditsCheck2 := true;
  EditsCheck3 := true;
  if Form1.HeightEdit1.Text = '' then EditsCheck1 := false;
  if Form1.WidthEdit1.Text = '' then EditsCheck1 := false;
  if Form1.ScreenCounter1.Text = '' then EditsCheck1 := false;
  if Form1.ScreenCenter1.Text = '' then EditsCheck1 := false;

  if Form1.HeightEdit2.Text = '' then EditsCheck2 := false;
  if Form1.WidthEdit2.Text = '' then EditsCheck2 := false;
  if Form1.ScreenCounter2.Text = '' then EditsCheck2 := false;
  if Form1.ScreenCenter2.Text = '' then EditsCheck2 := false;

  if Form1.HeightEdit3.Text = '' then EditsCheck3 := false;
  if Form1.WidthEdit3.Text = '' then EditsCheck3 := false;
  if Form1.ScreenCounter3.Text = '' then EditsCheck3 := false;
  if Form1.ScreenCenter3.Text = '' then EditsCheck3 := false;


  //�������� � ���������
  if Screen.MonitorCount = 1 then
    begin
      SetCursorPos(Screen.Monitors[0].Width div 2, Screen.Monitors[0].Height div 2);
    end;

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //������� �������� ������
  UnRegisterHotKey(Handle, 0);
end;

procedure TForm1.FormCreate(Sender: TObject);
var i, y: Integer;
begin
  //������������ ������� �������
  RegisterHotKey(Handle, 0, MOD_CONTROL, $20); // ��� ������� Ctrl+������

  //��������� ������ �������� �����
  Form1.StringGrid1.Cells[0,0] := '����/���';
  Form1.StringGrid1.Cells[1,0] := '1';
  Form1.StringGrid1.Cells[2,0] := '2';
  Form1.StringGrid1.Cells[3,0] := '3';
  Form1.StringGrid1.Cells[0,1] := '������';
  Form1.StringGrid1.Cells[0,2] := '������';

  Try //��������� ���-�� ���������
    Form1.StatusBar1.Panels.Items[0].Text := '��������� ����������: ' + IntToStr(Screen.MonitorCount);
  except
    ShowMessage('���������� ���������� ���-�� ���������!');
  End;

  Try //��������� ���������� ���������
    for i := 1 to 3 do //������ �� ���������
      begin
        for y := 1 to 2 do  //������ �� �������
          begin     
            if i<=Screen.MonitorCount then  //������� ���-�� ���������
              begin
                if y=1 then
                  begin
                    Form1.StringGrid1.Cells[i,y] := IntToStr(Screen.Monitors[i-1].Height);
                  end else
                  begin
                    Form1.StringGrid1.Cells[i,y] := IntToStr(Screen.Monitors[i-1].Width);
                  end;
              end else
                begin
                  Form1.StringGrid1.Cells[i,y] := '-';  //��������� ������
                end;
          end;
      end;
  except
    ShowMessage('���-�� ����� �� ���!');
  End;
end;





procedure TForm1.FormShow(Sender: TObject);
begin
  //�������� �� ������ �����
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TForm1.hot_key(var Message: TMessage);
begin
  //���������� ������� ������
  //���� ����� �����: ���������� ���������� �� ������
  if Form1.visualizeCheckBox.Checked = true then
    begin
      GetCursorPos(foo);
      ShowMessage('������� ����������: ' + IntToStr(foo.X) + ' x ' + IntToStr(foo.Y));
    end else //���� ��� - ������ ������
    begin
        cursorSet;
    end;
end;

end.
