{$mode objfpc}
uses crt;
type
TName = string[15];
TAddress = string[35];
TPerson = class // класс
private
	FName: TName; // значение свойства Name
	FAddress: TAddress; // значение свойства Address
public
	Constructor Create(Name:Tname);
	Procedure Show;
	Function GetName: TName;
	Function GetAddress: TAddress;
	Procedure SetAddress(NewAddress:TAddress);
end;


Constructor TPerson.Create(Name:TName);	// конструктор объекта TPerson
begin
FName:=Name;
end;			// метод получения значения свойства Name

Function TPerson.GetName():TName;
begin
Result:=FName;
end;		// метод получения значения свойства Address

Function TPerson.GetAddress():TAddress;
begin
Result:=FAddress;
end;		// метод изменения значения свойства Address

Procedure TPerson.SetAddress(NewAddress:TAddress);
begin
if FAddress ='' then FAddress := NewAddress;
end;

Procedure TPerson.Show();
Begin
writeln(GetName());
writeln(GetAddress());
end;

Var student:TPerson;
BEGIN
clrscr;
writeln;
writeln;
student := TPerson.Create('Ivanov');
//student.Address := 'Minsk,yl. Nezavisimosti 38';
student.SetAddress('Minsk,yl.Nezavisimosti 38');
student.show();
readln();

END.
