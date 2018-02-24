  program First_attempt;
  {$APPTYPE CONSOLE}
  uses
    SysUtils;
  const n = 1000;
  Type Trec = record
    num: integer;
    str: String[12];
    f: boolean;               
    end;
  TM = array[1..n] of Trec;
  var M:TM;
  numbi:Integer;
  kek:Real;
  i,inputnum,ifint,count:integer;
  numin,inputStr:String;

    procedure Str_sort(var A:TM);
  var i,j: integer;
  var hold: Trec;
  begin
  for i:=2 to n do 
    begin
      hold:=A[i];
      j:=i;
      while	 ((J>1) and (A[j-1].str>hold.str) ) do
      begin		
      A[j]:=A[j-1];
      dec(j);
      end;
    A[j]:=hold;

    end;
  end;



  procedure writearray(A:TM);
  var i:integer  ;
  begin
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
  var i,j : integer;
  hold :Trec;
  begin
  for i:=2 to n do
    begin
      hold:=A[i];
      j:=i;
      while	 ((J>1) and (A[j-1].num>hold.num) ) do
      begin
      A[j]:=A[j-1];
      dec(j);
      end;
    A[j]:=hold;
  end;
  end;

  procedure Boolean_count(var M:TM);
  var i:integer;
  begin
  count:=0;
  for i:=1 to n do
    begin
    with M[i] do
      begin
      if f = true then
      inc(count);
      F:=false;
    end;
  end;
  write('Number of fails: ');
  writeln(count);
  end;

  function binary_str (str:String; var A:TM): Integer;
  var i:integer;
  var left,right,mid,see:integer;
  begin
  left:=1;
  right:=n;
  see:=0;
  while left<=right do
  begin
  mid:=left+(right-left) div 2;
  A[mid].f:=true;
  if (str<A[mid].str) then right:=mid-1
  else if (str>A[mid].str) then left:= mid+1
  else if (str=A[mid].str)  then
    begin
    see:=mid;
    left:=right+1;
    end;
  end;
    if see = 0 then
    begin
      writeln('Not found');
      result:=-1;
    end
    else
    result:=see;
  end;

  function binary_num (num:integer; var A:TM): integer;
  var i:integer;
  var left,right,mid,see:integer;
  begin
  left:=1;
  right:=n;
  see:=0;
  while left<=right do
  begin
  mid:=left+(right-left) div 2;
  A[mid].f:=true;
  if (num<A[mid].num) then right:=mid-1
  else if (num>A[mid].num) then left:= mid+1
  else  if num=A[mid].num  then
    begin
    see:=mid;
    left:=right+1;
    end;
  end;
  if see = 0 then
    begin
     Writeln('Not found');
     result:=0
    end
    else
    result:=see;
  end;
  Begin
  Randomize;
  for i:=1 to n do
    begin
    with M[i] do
      begin
      num:=random(200)+1;
      str:='my_test_' + IntTostr(i);
      f:=false;
      end;
    end;
  //Writearray(M);
  Str_sort(M);
  //Writearray(M);
  readln(inputstr);
  writeln('Element index: ' + IntToStr(binary_str(inputstr,M)));
  Boolean_count(M);
  //writearray(M);
  num_sort(M);
  //writearray(M);
  readln(numin);
  Val(numin,inputnum,ifint);
  if((ifint)=0) then
  begin
    inputnum:=StrToInt(numin);
    numbi:=binary_num(inputnum,M);
  end
    else 
    begin 
    writeln('Wrong Input');
    Readln;
    end;
  while M[numbi].num = inputnum  do
  Dec(numbi);
  inc(numbi);
  while M[numbi].num = inputnum do
   begin
     M[numbi].f:=True;
     write(M[numbi].num);
     write(#$9);
     write(M[numbi].str);
     write(#$9);
     writeln(M[numbi].f);
     inc(numbi);
   end;
  //writearray(M);
  Boolean_count(M);
  readln;
  end.

