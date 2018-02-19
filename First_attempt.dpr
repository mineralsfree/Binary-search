program First_attempt;

{$APPTYPE CONSOLE}
uses
  SysUtils;

const n = 10;
Type Trec = record
	num: integer;
	str: String[12];
	f: boolean;
	end;
TM = array[1..n] of Trec;
var M:TM;
i,inputnum,count:integer;
inputStr:String;
procedure Str_sort(var A:TM);
var i,j: integer;
hold:string;
begin
for i:=2 to n do 
	begin
	with A[i] do
		begin
		hold:=str;
		j:=i;
		while	 ((J>1) and (A[j-1].str>hold) ) do
		begin		
		A[j].str:=A[j-1].str;
		dec(j);
		end;
	A[j].str:=hold;
	end;
end;
end;

function binary_str (str:String; var A:TM): integer;
var i:integer;
var left,right,mid:integer;
begin
left:=1;
right:=n;
while left<=right do
begin
mid:=left+(right-left) div 2;
A[mid].f:=true;
if (str<A[mid].str) then right:=mid-1 
else if (str>A[mid].str) then left:= mid+1
else begin result:=mid; exit; end;
end;
result:=-1;
end;


function binary_num (num:integer; var A:TM): integer;
var i:integer;
var left,right,mid:integer;
begin
left:=1;
right:=n;
while left<=right do
begin
mid:=left+(right-left) div 2;
A[mid].f:=true;
if (num<A[mid].num) then right:=mid-1 
else if (num>A[mid].num) then left:= mid+1
else begin result:=A[mid].num; exit; end;
end;
  writeln(-1)    ;
  Readln;
end;

procedure writearray(A:TM);
var i:integer  ;
begin
writeln;
writeln;
writeln('Field1'+#$9+ 'Field2'+#$9+#$9+'Field3');
  for I := 1 to n  do
  begin
	with M[i] do
	begin
		write(IntToStr(num)+ #$9 + str + #$9) ;
		writeln(f);
	end;
  end;
end;


procedure num_sort(var A:TM);
var i,j,hold: integer;
begin
for i:=2 to n do 
	begin
	with A[i] do
		begin
		hold:=num;
		j:=i;
		while	 ((J>1) and (A[j-1].num>hold) ) do
		begin		
		A[j].num:=A[j-1].num;
		dec(j);
		end;
	A[j].num:=hold;
	end;
end;
end;

procedure Boolean_count(M:TM);
var i:integer;
begin
for i:=1 to n do
	begin 
	with M[i] do
		begin
		if f = true then
		inc(count);
		F:=false;
	end;
end;
writeln(count);
end;

Begin
for i:=1 to n do
	begin
	with M[i] do
		begin
		num:=random(201);		
		str:='my_test' + IntTostr(i);
		f:=false;			
		end;
	end;
  Randomize;
//Writearray(M);
Str_sort(M);
//Writearray(M);
//read(inputstr);
//writeln(binary_str(inputstr,M));
//writearray(M);
//Boolean_count(M);
num_sort(M);
writearray(M);
read(inputnum);
writeln(binary_num(inputnum,M));
//writearray(M);
Boolean_count(M);

read(inputnum);
end.

