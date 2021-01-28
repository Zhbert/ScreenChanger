unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids,
  Vcl.ExtCtrls, IniFiles;

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
    Label9: TLabel;
    ScreenCenter1: TEdit;
    ScreenCenter2: TEdit;
    ScreenCenter3: TEdit;
    Button2: TButton;
    GroupBox3: TGroupBox;
    visualizeCheckBox: TCheckBox;
    RadioGroup1: TRadioGroup;
    BorderCheck1: TRadioButton;
    BorderCheck2: TRadioButton;
    BorderCheck3: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
  pathINI : string;
  sIniFile: TIniFile;

implementation
  uses Unit2;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  sIniFile := TIniFile.Create(pathINI);
  sIniFile.WriteString('PARAMETERS', 'HeightEdit1', Form1.HeightEdit1.Text);
  sIniFile.WriteString('PARAMETERS', 'HeightEdit2', Form1.HeightEdit2.Text);
  sIniFile.WriteString('PARAMETERS', 'HeightEdit3', Form1.HeightEdit3.Text);
  sIniFile.WriteString('PARAMETERS', 'WidthEdit1', Form1.WidthEdit1.Text);
  sIniFile.WriteString('PARAMETERS', 'WidthEdit2', Form1.WidthEdit2.Text);
  sIniFile.WriteString('PARAMETERS', 'WidthEdit3', Form1.WidthEdit3.Text);
  sIniFile.WriteBool('PARAMETERS', 'BorderCheck1', Form1.BorderCheck1.Checked);
  sIniFile.WriteBool('PARAMETERS', 'BorderCheck2', Form1.BorderCheck2.Checked);
  sIniFile.WriteBool('PARAMETERS', 'BorderCheck3', Form1.BorderCheck3.Checked);
  sIniFile.WriteString('PARAMETERS', 'ScreenCenter1', Form1.ScreenCenter1.Text);
  sIniFile.WriteString('PARAMETERS', 'ScreenCenter2', Form1.ScreenCenter2.Text);
  sIniFile.WriteString('PARAMETERS', 'ScreenCenter3', Form1.ScreenCenter3.Text);
  sIniFile.Free;
end;

procedure TForm1.cursorSet;   //Процедура установки курсора
var
  //Границы полей положений курсора
  FirstFieldMin : Integer;
  FirstFieldMax : Integer;
  SecondFieldMin : Integer;
  SecondFieldMax : Integer;
  ThirdFieldMin : Integer;
  ThirdFieldMax : Integer;
begin
  //Работаем с курсорами
  //Если монитор 1
  if Screen.MonitorCount = 1 then
    begin
      SetCursorPos(Screen.Monitors[0].Width div 2, Screen.Monitors[0].Height div 2);
    end;
  //Если мониторов 2
  if Screen.MonitorCount = 2 then
    begin
      if Form1.BorderCheck1.Checked = true then
        begin
        //Определяем границы
         FirstFieldMin := 0;
         FirstFieldMax := StrToInt(Form1.WidthEdit1.Text);
         SecondFieldMin := StrToInt(Form1.WidthEdit1.Text);
         SecondFieldMax := StrToInt(Form1.WidthEdit1.Text) + StrToInt(Form1.WidthEdit2.Text);
          //Двигаем курсор
          GetCursorPos(foo);
          if (foo.X > FirstFieldMin) and (foo.X < FirstFieldMax) then
            begin
              setcursorpos(StrToInt(Form1.ScreenCenter2.Text), StrToInt(Form1.HeightEdit2.Text) div 2);
            end;
         if (foo.X > SecondFieldMin) and (foo.X < SecondFieldMax) then
            begin
              setcursorpos(StrToInt(Form1.ScreenCenter1.Text), StrToInt(Form1.HeightEdit1.Text) div 2);
            end;
        end;
      if Form1.BorderCheck2.Checked = true then
        begin
          //Определяем границы
         FirstFieldMin := 0-StrToInt(Form1.WidthEdit1.Text);
         FirstFieldMax := 0;
         SecondFieldMin := 0;
         SecondFieldMax := 0 + StrToInt(Form1.WidthEdit2.Text);
         //Двигаем
         GetCursorPos(foo);
          if (foo.X > FirstFieldMin) and (foo.X < FirstFieldMax) then
            begin
              setcursorpos(StrToInt(Form1.ScreenCenter2.Text), StrToInt(Form1.HeightEdit2.Text) div 2);
            end;
         if (foo.X > SecondFieldMin) and (foo.X < SecondFieldMax) then
            begin
              setcursorpos(StrToInt(Form1.ScreenCenter1.Text), StrToInt(Form1.HeightEdit1.Text) div 2);
            end;
        end;
  end;
  //Если мониторов три
  if Screen.MonitorCount = 3 then
    begin
      if Form1.BorderCheck1.Checked = true then
        begin
          //Определяем границы
          FirstFieldMin := 0;
          FirstFieldMax := StrToInt(Form1.WidthEdit1.Text);
          SecondFieldMin := StrToInt(Form1.WidthEdit1.Text);
          SecondFieldMax := StrToInt(Form1.WidthEdit1.Text) + StrToInt(Form1.WidthEdit2.Text);
          ThirdFieldMin := StrToInt(Form1.WidthEdit1.Text) + StrToInt(Form1.WidthEdit2.Text);
          ThirdFieldMax := StrToInt(Form1.WidthEdit1.Text) + StrToInt(Form1.WidthEdit2.Text) + StrToInt(Form1.WidthEdit3.Text);
          //Двигаем
         GetCursorPos(foo);
          if (foo.X > FirstFieldMin) and (foo.X < FirstFieldMax) then
            begin
              setcursorpos(StrToInt(Form1.ScreenCenter2.Text), StrToInt(Form1.HeightEdit2.Text) div 2);
            end;
         if (foo.X > SecondFieldMin) and (foo.X < SecondFieldMax) then
            begin
              setcursorpos(StrToInt(Form1.ScreenCenter3.Text), StrToInt(Form1.HeightEdit3.Text) div 2);
            end;
         if (foo.X > ThirdFieldMin) and (foo.X < ThirdFieldMax) then
            begin
              setcursorpos(StrToInt(Form1.ScreenCenter1.Text), StrToInt(Form1.HeightEdit1.Text) div 2);
            end;
        end;
      if Form1.BorderCheck2.Checked = true then
        begin
          //Определяем границы
          FirstFieldMin := 0 - StrToInt(Form1.WidthEdit1.Text);
          FirstFieldMax := 0;
          SecondFieldMin := 0;
          SecondFieldMax := StrToInt(Form1.WidthEdit2.Text);
          ThirdFieldMin := StrToInt(Form1.WidthEdit2.Text);
          ThirdFieldMax := StrToInt(Form1.WidthEdit2.Text) + StrToInt(Form1.WidthEdit3.Text);
          //Двигаем
         GetCursorPos(foo);
          if (foo.X > FirstFieldMin) and (foo.X < FirstFieldMax) then
            begin
              setcursorpos(StrToInt(Form1.ScreenCenter2.Text), StrToInt(Form1.HeightEdit2.Text) div 2);
            end;
         if (foo.X > SecondFieldMin) and (foo.X < SecondFieldMax) then
            begin
              setcursorpos(StrToInt(Form1.ScreenCenter3.Text), StrToInt(Form1.HeightEdit3.Text) div 2);
            end;
         if (foo.X > ThirdFieldMin) and (foo.X < ThirdFieldMax) then
            begin
              setcursorpos(StrToInt(Form1.ScreenCenter1.Text), StrToInt(Form1.HeightEdit1.Text) div 2);
            end;
        end;
      if Form1.BorderCheck3.Checked = true then
        begin
          //Определяем границы
          FirstFieldMin := 0 - StrToInt(Form1.WidthEdit1.Text) - StrToInt(Form1.WidthEdit2.Text);
          FirstFieldMax := 0 - StrToInt(Form1.WidthEdit2.Text);
          SecondFieldMin := 0 - StrToInt(Form1.WidthEdit2.Text);
          SecondFieldMax := 0;
          ThirdFieldMin := 0;
          ThirdFieldMax := 0 + StrToInt(Form1.WidthEdit3.Text);
         //Двигаем
         GetCursorPos(foo);
          if (foo.X > FirstFieldMin) and (foo.X < FirstFieldMax) then
            begin
              setcursorpos(StrToInt(Form1.ScreenCenter2.Text), StrToInt(Form1.HeightEdit2.Text) div 2);
            end;
         if (foo.X > SecondFieldMin) and (foo.X < SecondFieldMax) then
            begin
              setcursorpos(StrToInt(Form1.ScreenCenter3.Text), StrToInt(Form1.HeightEdit3.Text) div 2);
            end;
         if (foo.X > ThirdFieldMin) and (foo.X < ThirdFieldMax) then
            begin
              setcursorpos(StrToInt(Form1.ScreenCenter1.Text), StrToInt(Form1.HeightEdit1.Text) div 2);
            end;
        end;
        if (Form1.BorderCheck1.Checked = false) and (Form1.BorderCheck2.Checked = false)
          and (Form1.BorderCheck3.Checked = false) then
          begin
            //Определяем границы
            FirstFieldMin := 0 - StrToInt(Form1.WidthEdit1.Text) - StrToInt(Form1.WidthEdit2.Text) - StrToInt(Form1.WidthEdit3.Text);
            FirstFieldMax := 0 - StrToInt(Form1.WidthEdit3.Text) - StrToInt(Form1.WidthEdit2.Text);
            SecondFieldMin := 0 - StrToInt(Form1.WidthEdit3.Text) - StrToInt(Form1.WidthEdit2.Text);;
            SecondFieldMax := 0 - StrToInt(Form1.WidthEdit3.Text);
            ThirdFieldMin := 0 - StrToInt(Form1.WidthEdit3.Text);
            ThirdFieldMax := 0;
            //Двигаем
         GetCursorPos(foo);
          if (foo.X > FirstFieldMin) and (foo.X < FirstFieldMax) then
            begin
              setcursorpos(StrToInt(Form1.ScreenCenter2.Text), StrToInt(Form1.HeightEdit2.Text) div 2);
            end;
         if (foo.X > SecondFieldMin) and (foo.X < SecondFieldMax) then
            begin
              setcursorpos(StrToInt(Form1.ScreenCenter3.Text), StrToInt(Form1.HeightEdit3.Text) div 2);
            end;
         if (foo.X > ThirdFieldMin) and (foo.X < ThirdFieldMax) then
            begin
              setcursorpos(StrToInt(Form1.ScreenCenter1.Text), StrToInt(Form1.HeightEdit1.Text) div 2);
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
var
  i, y: Integer;
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
  //Работаем с ini файлом
  pathINI:=extractfilepath(application.ExeName)+'\config.ini';
  if FileExists(pathINI) then //проверяем есть ли файл INI
   begin
     sIniFile := TIniFile.Create(pathINI);
     Form1.HeightEdit1.Text := sIniFile.ReadString('PARAMETERS', 'HeightEdit1', '0');
     Form1.HeightEdit2.Text := sIniFile.ReadString('PARAMETERS', 'HeightEdit2', '0');
     Form1.HeightEdit3.Text := sIniFile.ReadString('PARAMETERS', 'HeightEdit3', '0');
     Form1.WidthEdit1.Text := sIniFile.ReadString('PARAMETERS', 'WidthEdit1', '0');
     Form1.WidthEdit2.Text := sIniFile.ReadString('PARAMETERS', 'WidthEdit2', '0');
     Form1.WidthEdit3.Text := sIniFile.ReadString('PARAMETERS', 'WidthEdit3', '0');
     Form1.BorderCheck1.Checked := sIniFile.ReadBool('PARAMETERS', 'BorderCheck1', false);
     Form1.BorderCheck2.Checked := sIniFile.ReadBool('PARAMETERS', 'BorderCheck2', false);
     Form1.BorderCheck3.Checked := sIniFile.ReadBool('PARAMETERS', 'BorderCheck3', false);
     Form1.ScreenCenter1.Text := sIniFile.ReadString('PARAMETERS', 'ScreenCenter1', '0');
     Form1.ScreenCenter2.Text := sIniFile.ReadString('PARAMETERS', 'ScreenCenter2', '0');
     Form1.ScreenCenter3.Text := sIniFile.ReadString('PARAMETERS', 'ScreenCenter3', '0');
     sIniFile.Free;
   end else showmessage('Файл config.ini не найден!');
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  //Скрываем из панели задач
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TForm1.hot_key(var Message: TMessage);
begin
  //Обработчик нажатия хоткея
  //Если стоит галка: показываем координаты по хоткею
  if Form1.visualizeCheckBox.Checked = true then
    begin
      GetCursorPos(foo);
      ShowMessage('Текущие координаты: ' + IntToStr(foo.X) + ' x ' + IntToStr(foo.Y));
    end else //Если нет - чекаем курсор
    begin
        cursorSet;
    end;
end;

end.
