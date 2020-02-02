unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Try
    Form1.Label1.Caption := Form1.Label1.Caption + ' ' + IntToStr(Screen.Height);
    Form1.Label2.Caption := Form1.Label2.Caption + ' ' + IntToStr(Screen.Width);
    Form1.StatusBar1.Panels.Items[0].Text := 'Мониторов обнаружено: ' + IntToStr(Screen.MonitorCount);
  except
    ShowMessage('Невозможно определить кол-во мониторов!');
  End;
end;

end.
