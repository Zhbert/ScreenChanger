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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure cursorSet; // Процедура установки курсора
    procedure hot_key(var Message: TMessage); message WM_HOTKEY;
  end;

var
  Form1: TForm1;
  foo: TPoint;
  WidthOfAllScreens: Integer; // Общая ширина всех экранов
  
implementation

{$R *.dfm}

procedure TForm1.cursorSet;   //Процедура установки курсора
begin
  GetCursorPos(foo);
  showMessage(IntToStr(foo.X) + ' ' + IntToStr(foo.Y));
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Убираем привязку хоткея
  UnRegisterHotKey(Handle, 0);
end;

procedure TForm1.FormCreate(Sender: TObject);
var i, y: Integer;
begin
  //Обнуляем общую длину мониторов
  WidthOfAllScreens := 0;

  //Регистрируем горячую клавишу
  RegisterHotKey(Handle, 0, MOD_CONTROL, $20); // для команды Ctrl+Пробел

  //Заполняем ячейки основных полей
  Form1.StringGrid1.Cells[0,0] := 'Разр/Мон';
  Form1.StringGrid1.Cells[1,0] := '1';
  Form1.StringGrid1.Cells[2,0] := '2';
  Form1.StringGrid1.Cells[3,0] := '3';
  Form1.StringGrid1.Cells[0,1] := 'Высота';
  Form1.StringGrid1.Cells[0,2] := 'Ширина';

  Try //Заполняем кол-во мониторов
    Form1.StatusBar1.Panels.Items[0].Text := 'Мониторов обнаружено: ' + IntToStr(Screen.MonitorCount);
  except
    ShowMessage('Невозможно определить кол-во мониторов!');
  End;

  Try //Заполняем разрешения мониторов
    for i := 1 to 3 do //Пробег по мониторам
      begin
        for y := 1 to 2 do  //Пробег по строкам
          begin     
            if i<=Screen.MonitorCount then  //Границы кол-ва мониторов
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
                  Form1.StringGrid1.Cells[i,y] := '-';  //Заполняем пустые
                end;
          end;
      end;
  except
    ShowMessage('Что-то пошло не так!');
  End;

  //Считаем общую длину экранов по ширине
  for i := 0 to Screen.MonitorCount-1 do
    begin
      WidthOfAllScreens := WidthOfAllScreens + Screen.Monitors[i].Width;
      ShowMessage('Ширина мониторов: ' + IntToStr(WidthOfAllScreens));
    end;
end;





procedure TForm1.hot_key(var Message: TMessage);
begin
  //Обработчик нажатия хоткея
  cursorSet;
end;

end.
