{Realizar un algoritmo que cree un archivo de números enteros no ordenados y permita
incorporar datos al archivo. Los números son ingresados desde teclado. El nombre del
archivo debe ser proporcionado por el usuario desde teclado. La carga finaliza cuando
se ingrese el número 30000, que no debe incorporarse al archivo.}

program uno;
const
    CORTE = 30000;
type
    num = file of integer;
procedure CargarDatos (var enteros:num);
    var
        x:integer;
    begin
        reset(enteros);
        writeln('Ingrese el numero a cargar');
        readln(x);
        while (x <> CORTE) do
            begin
                write(enteros,x);
                writeln('Ingrese el numero a cargar');
                readln(x);
            end;
        close(enteros);
end;

procedure MenoresA (var enteros:num);
    var
        suma,i:integer;
    begin
        suma:=0;
        reset(enteros);
        while (not EOF (enteros)) do
            begin
                read(enteros,i);
                if (i > 1500) then 
                    suma:= suma +1;
            end;
        close(enteros);
end;

var
    nombreLocal:String;
    enteros:num;
begin
    WriteLn('Ingrese el nombre del archivo: ');
    ReadLn(nombreLocal);
    Assign(enteros,nombreLocal);
    Rewrite(enteros);
    CargarDatos(enteros);
    writeln('-----------------------------------------');
    MenoresA(enteros);
end.
