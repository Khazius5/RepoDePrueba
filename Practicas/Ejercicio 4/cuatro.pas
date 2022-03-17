{Realizar un programa que presente un menú con opciones para:
a. Crear un archivo de registros no ordenados de empleados y completarlo con
datos ingresados desde teclado. De cada empleado se registra: número de
empleado, apellido, nombre, edad y DNI. Algunos empleados se ingresan con
DNI 00. La carga finaliza cuando se ingresa el String ‘fin’ como apellido.
b. Abrir el archivo anteriormente generado y
i. Listar en pantalla los datos de empleados que tengan un nombre o apellido
determinado.
ii. Listar en pantalla los empleados de a uno por línea.
iii. Listar en pantalla empleados mayores de 70 años, próximos a jubilarse.
NOTA: El nombre del archivo a crear o utilizar debe ser proporcionado por el usuario una
única vez.a
}

Program cuatro;
Type 
    empleado = record
        nro_empleado:integer;
        apellido:string;
        nombre:string;
        edad:integer;
        DNI:string;
    end;

    arch_empleados =  file of empleado;


procedure Leer_empleado(var e:empleado);
begin
    writeln('Ingrese apellido del empleado');
    readln(e.apellido);

    if(e.apellido <> 'fin' ) then begin
        writeln('Ingrese numero de empleado');
        readln(e.nro_empleado);

        writeln('Ingrese nombre del empleado');
        readln(e.nombre);

        writeln('Ingrese edad del empleado');
        readln(e.edad);      
    
        writeln('Ingrese dni del empleado');
        readln(e.DNI);
    end;
end;

procedure cargar_archivo(var a:arch_empleados);
var
    e:empleado;
begin
    Rewrite(a);
    Leer_empleado(e);
    while ( e.apellido <> 'fin') do begin
      write(a,e);
      Leer_empleado(e);
    end;
    Close(a);
end;

procedure mostrar_registro(e:empleado);
    begin
    writeln('');
    writeln('Nombre del empleado:', e.nombre);
    writeln('Apellido del empleado:', e.apellido);
    writeln('Numero de empleado:', e.nro_empleado);
    writeln('Edad del empleado:', e.edad);
    writeln('Dni del empleado:', e.DNI);
    writeln('');
    end;

{Listar en pantalla los datos de empleados que tengan un nombre o apellido determinado}
procedure listar_cadena_especifica(var a :arch_empleados; cadena:string);
    var
        e:empleado;
    begin
    writeln('Datos de los empleados con el nombre o apellido:', cadena);
    Reset(a);
    while not Eof(a) do begin
        read(a,e);
        if ((e.nombre = cadena) OR (e.apellido = cadena)) then 
        mostrar_registro(e);
    end;
    Close(a);
end;

{Listar en pantalla los empleados de a uno por línea.}
procedure listar_empleados(var a :arch_empleados);
    var
        e:empleado;
    begin
    Reset(a);
    while not Eof(a) do begin
        read(a,e);
        writeln('');
        mostrar_registro(e);
        writeln('');
    end;
    Close(a);
end;

{Listar en pantalla empleados mayores de 70 años, próximos a jubilarse.}
procedure listar_proximos_jubilarse(var a: arch_empleados);
    var
        e:empleado;
    begin
    writeln('Datos de los empleados proximos a jubilarse:');
    Reset(a);
    while not Eof(a) do begin
        read(a,e);
        if (e.edad > 70)then 
        mostrar_registro(e);
    end;
    Close(a);
end;
{Añadir una o más empleados al final del archivo con sus datos ingresados por teclado.}
procedure Agregar_empleado (var a:arch_empleados);
    var
        e:empleado;
        i,cantEmp:integer;
    begin
        i:=0;
        Reset(a);
        Seek(a,FileSize(a));
        WriteLn('Cuantos empleados quiere agregar?');
        Readln(cantEmp);
        if (cantEmp > 0) then begin
          Leer_empleado(e);
          Write(a,e);
          i:=i + 1;
        end;
        while (cantEmp < i) do
            begin
            Leer_empleado(e);
            Write(a,e);
            i:= i + 1;
            end;
end;

{Modificar edad a una o más empleados.}
//procedure Modi

var
    archivo:arch_empleados;
    nombre_arch:string;
    opcion:integer;
begin
    writeln('Ingrese el nombre del archivo a crear');
    readln(nombre_arch);
    writeln('Ingrese una opcion (1.4) o 0 para finalizar el programa');
    readln(opcion);
    Assign(archivo,nombre_arch);

    while(opcion <> 0) do begin
      case opcion of
        1 : cargar_archivo(archivo);
        2 : listar_empleados(archivo);
        3 : listar_cadena_especifica(archivo,'cella');
        4 : listar_proximos_jubilarse(archivo);
        5 : Agregar_empleado(archivo);
      else
        WriteLn('La opcion indicada no existe');
      end;

      writeln('Ingrese una opcion nuevamente');
      readln(opcion);
    end;    
end.
