{$MODE OBJFPC} (*Директива позволяющая использовать классы в Pascal*)
uses crt,sysutils;

type
 Mass = array[1..5] of integer; (*Массив оценок*)
 Student = class (*Задав ключевое слово class, мы показали компилятору, что на данном этапе будет описываться класс*)
			_ID,_Name,_SecondName,_Gender: string; (*Эти поля - атрибуты нашего будущего объекта*)
			_AvrMark: integer;
			_ArrayofMarks: Mass;
			constructor Create(ID,Name,SecondName,Gender:string); (*Описываем конструктор*)
			procedure FindAvrMark(); (*Описываем процедуру нахождения среднего балла*)
			procedure FindArrOfMarks(FileName:string);(*Процедура поиска оценок в текстовом файле по id студента*)
			procedure ShowInf();(*Процедура вывода информации о студенте*)
	end;



constructor Student.Create(ID,Name,SecondName,Gender:string);(*Реализация конструктора*)
begin
	_ID:=ID;(*На этапе создания объекта, атрибутам будут присвается передаваемые значения*)
	_Name:=Name;(*_Name - Атрибут объекта, Name - Передаваемое значение во время его инициализиции*)
	_SecondName:=SecondName;
	_Gender:=Gender;
	_AvrMark:=-1;(*значение -1 говорит о том, средний балл ещё не вычислен*)
end;

procedure Student.FindAvrMark();(*Реализация процедуры нахождения среднего балла*)
var sum,i:integer;
begin
for i:=1 to 5 do sum:=sum+_ArrayofMarks[i];
_AvrMark:= round(sum/5);
end;


procedure Student.FindArrOfMarks(FileName:string);(*Передаём имя файла,содержащего информацию об оценках*)
var txtfile:TextFile;
	str: string;
	i:integer;
begin
	AssignFile(txtfile, FileName); (*Связываем переменную с названием текстового файла*)
	reset(txtfile);(*Открываем файл для чтения*)
	while not eof(txtfile) do (*eof-end of file, условие проверки конца файла*)
		begin
		  readln(txtfile, str);(*Считываем стоку*)
		  if pos(_ID,str) = 1 then(*Если id студента - совпадает с id в файле,то...*)
			begin
			str:=copy(str, pos('-',str)+1, length(str)-length(_ID)-1);
			(*Из строки в файле копируем оценки в строковую переменную*)
			break;(*Т.к. необходимую информацию мы получили выходим из цикла*)
			end;
		  str:='';(*Если же строка не подходящая, обнуляем переменую и переходим к следующей*)
		end;
	CloseFile(txtfile);(*Закрываем файл*)
	for i:=1 to 5 do _ArrayofMarks[i]:=StrToInt(str[i]);
	(*StrToInt-функция модуля sysutils преобразовывающая строку в число*)
	FindAvrMark();(*Вызываем процедуру поиска среднего балла*)
end;

procedure Student.ShowInf();(*Процедура вывода информации о студенте*)
var i:integer;
begin
write(
      'ID-',_ID:3,
	  '||NAME-',_Name:5,
	  '||SECONDNAME-',_SecondName:8,
	  '||GENDER-',_Gender:6,
	  '||AVRMARK-',_AvrMark:2,
	  '||ALLMARKS-'
	  );
for i:=1 to 5 do write(_ArrayofMarks[i]);
writeln();
end;

var	student_1,student_2: Student;(*определим два экземпляра класса Student*)
	i:integer;
BEGIN
clrscr;
writeln;
student_1:=Student.Create('1','Ivan','Ivanov','Male');
(*Вызываем конструктор объекта принимающий параметры ID,Name,SecondName,Gender*)
student_1.FindArrOfMarks('marks.txt');
(*Вызовем метод поиска оценок в файле, в данном случае в файле marks.txt*)
student_1.ShowInf();
(*Выведем информацию*)
student_2:=Student.Create('8','Vera','Sidorova','Female');
student_2.FindArrOfMarks('marks.txt');
student_2.ShowInf();
readln();
END.
















