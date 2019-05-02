{$MODE OBJFPC}
uses crt,sysutils;

type
 Mass = array[1..5] of integer;
 Student = class
			_ID,_Name,_SecondName,_Gender: string;
			_AvrMark: integer;
			_ArrayofMarks: Mass;
			constructor Create(ID,Name,SecondName,Gender:string);
			procedure FindAvrMark();
			function GetID():string;
			procedure FindArrOfMarks(FileName:string);
			procedure ShowInf();
	end;

constructor Student.Create(ID,Name,SecondName,Gender:string);
begin
	_ID:=ID;
	_Name:=Name;
	_SecondName:=SecondName;
	_Gender:=Gender;
	_AvrMark:=-1;
end;

procedure Student.FindAvrMark();
var sum,i:integer;
begin
for i:=1 to 5 do sum:=sum+_ArrayofMarks[i];
_AvrMark:= round(sum/5);
end;

function Student.GetID():string;
begin
GetID:=_ID;
end;

procedure Student.FindArrOfMarks(FileName:string);
var txtfile:TextFile;
	str: string;
	i:integer;
	ID:string;
begin
	ID:=_ID;
	AssignFile(txtfile, FileName);
	reset(txtfile);
	while not eof(txtfile) do
		begin
		  readln(txtfile, str);
		  if pos(ID,str) = 1 then
			begin
			str:=copy(str, pos('-',str)+1, length(str)-length(ID)-1);
			break;
			end;
		  str:='';
		end;
	CloseFile(txtfile);
	for i:=1 to 5 do _ArrayofMarks[i]:=StrToInt(str[i]);
	FindAvrMark();
end;

procedure Student.ShowInf();
var i:integer;
begin
write('ID-',_ID:4,'||NAME-',_Name:5,'||SECONDNAME-',_SecondName:7,'||GENDER-',_Gender:6,'||AVRMARK-',_AvrMark:2,'||ALLMARKS-' );
for i:=1 to 5 do write(_ArrayofMarks[i]);
writeln();
end;

var	student_1,student_2: Student;
	i:integer;
BEGIN
clrscr;
student_1:=Student.Create('1','Ivan','Ivanov','Male');
student_1.FindArrOfMarks('marks.txt');
student_1.ShowInf();
student_2:=Student.Create('132','Ivan2','Ivanov2','Male');
student_2.FindArrOfMarks('marks.txt');
student_2.ShowInf();
readln();
END.
















