{$MODE OBJFPC}
type
	FirstClass = class
		Atr_1:integer;
		Atr_2:string;
		Atr_3:real;
		procedure first();
		function second():integer;
	end; (*Конец описание класса*)
	
procedure FirstClass.first();
begin
end;

function FirstClass.second():integer;
begin
end;

Var obj_1 : FirstClass;
BEGIN
obj_1:=FirstClass.Create();
END.
	
	
	