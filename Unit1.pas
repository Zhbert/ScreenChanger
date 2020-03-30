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
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

implementation
  uses Unit2;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm1.cursorSet;   //Процедура установки курсора
var
  EditsCheck1 : boolean;   //переменная состояния полей ввода
  EditsCheck2 : boolean;   //переменная состояния полей ввода
  EditsCheck3 : boolean;   //переменная состояния полей ввода
begin
  //Проверяем, что все поля разрешений заполнены
  EditsCheck1 := true;
  EditsCheck2 := true;
  EditsCheck3 := true;
  if (Form1.Edit1.Text = '') then EditsCheck1 := false;
  if (Form1.Edit2.Text = '') then EditsCheck1 := false;
  if (Form1.Edit3.Text = '') then EditsCheck2 := false;
  if (Form1.Edit4.Text = '') then EditsCheck2 := false;
  if (Form1.Edit5.Text = '') then EditsCheck3 := false;
  if (Form1.Edit6.Text = '') then EditsCheck3 := false;

  //Работаем с курсорами
  if Screen.MonitorCount = 1 then  //Если найден один монитор
    begin
      if EditsCheck1 = false then ShowMessage('Необходимо заполнить разрешения мониторов!') else
      SetCursorPos(Screen.Width div 2, Screen.Height div 2);
    end;
  if Screen.MonitorCount = 2 then //Если мониторов 2
    begin
      if EditsCheck1 = false or EditsCheck2 = false then
        ShowMessage('Необходимо заполнить разрешения мониторов!') else
          begin
            GetCursorPos(foo);
            if (foo.X > 0) then
            begin
              SetCursorpos(-(StrToInt(Form1.Edit4.Text) div 2), StrToInt(Form1.Edit3.Text) div 2);
            end else
            begin
              SetCursorpos(StrToInt(Form1.Edit6.Text) div 2, StrToInt(Form1.Edit5.Text) div 2);
            end;
          end;
    end;
  if Screen.MonitorCount = 3 then //Если мониторов 3
    begin
      if EditsCheck1 = false or EditsCheck2 = false or EditsCheck3 = false then
        ShowMessage('Необходимо заполнить разрешения мониторов!') else
        begin
          if (foo.X > 0) then
            begin
              SetCursorpos(-(StrToInt(Form1.Edit2.Text) div 2)-StrToInt(Form1.Edit4.Text), StrToInt(Form1.Edit1.Text) div 2);
            end else if (foo.X < -StrToInt(Form1.Edit4.Text)) then
            begin
              SetCursorpos(-(StrToInt(Form1.Edit4.Text) div 2), StrToInt(Form1.Edit3.Text) div 2);
            end else if foo.X > -StrToInt(Form1.Edit4.Text) then
            begin
              SetCursorPos(StrToInt(Form1.Edit2.Text) div 2, StrToInt(Form1.Edit1.Text) div 2);
            end;
        end;
    end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Убираем привязку хоткея
  UnRegisterHotKey(Handle, 0);
end;

procedure TForm1.FormCreate(Sender: TObject);
var i, y: Integer;
begin
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
end;





procedure TForm1.FormShow(Sender: TObject);
begin
  //Скрываем из панели задач
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TForm1.hot_key(var Message: TMessage);
begin
  //Обработчик нажатия хоткея
  cursorSet;
end;

end.
