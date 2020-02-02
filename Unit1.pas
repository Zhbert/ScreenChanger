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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  i: integer;      //counter
  y: integer;      //counter
  
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
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



end.
