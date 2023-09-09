{Implementar un programa que contenga:
a. Un modulo que lea informacion de alumnos de Taller de Programacion y los almacene en
una estructura de datos. De cada alumno se lee legajo, DNI, anio de ingreso y los codigos y
notas de los finales rendidos. La estructura generada debe ser eficiente para la busqueda por
numero de legajo. La lectura de los alumnos finaliza con legajo 0 y para cada alumno el ingreso
de las materias finaliza con el codigo de materia -1.
b. Un modulo que reciba la estructura generada en a. y retorne los DNI y ano de ingreso de
aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parametro.
c. Un modulo que reciba la estructura generada en a. y retorne el legajo mas grande.
d. Un modulo que reciba la estructura generada en a. y retorne el DNI mas grande.
e. Un modulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.
f. Un modulo que reciba la estructura generada en a. y retorne el legajo y el promedio del
alumno con mayor promedio.
g. Un modulo que reciba la estructura generada en a. y un valor entero. Este modulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}

program ejercicio3;
type

arbol=^nodo;
lista = ^nodo2;

alumnos = record
    legajo:integer;
    DNI:integer;
    anioIngreso:integer;
    codigosFinal:lista;
end;

nodo = record
    dato : alumnos;
    hi:arbol;
    hd:arbol;
end;

materias = record
    codigoMateria:integer;
    NotaFinalMateria: real;
end;

nodo2 = record
    datoLista: materias;
    sig:lista;
end;

procedure agregarAdelante(var l:lista; regLista:materias);
var
nuevo:lista;
begin
new(nuevo);
nuevo^.datoLista:=RegLista;
nuevo^.sig:=L;
L:=nuevo;
end;

procedure leerRegNotas(var regLista:materias);
begin
	writeln('Escriba codigo de materia: ');
    readln(regLista.codigoMateria);
    if (regLista.codigoMateria<>-1) then 
          begin
            writeln('Escriba nota de materia: ');
            readln(regLista.NotaFinalMateria);
          end;
end;

procedure crearListaNotas(var l:lista);
var
regLista:materias;
begin	
	leerRegNotas(regLista);
          while(regLista.codigomateria<>-1) do 
				begin
					agregarAdelante(l,regLista); ///genera lista
					leerRegNotas(regLista);
				end;
end;

procedure leerRegAlumnos (var regAlu:alumnos);
var 
l:lista;
begin	
	l:=nil; /// inicializo l:=l para cada alumno que tiene una lista dentro de us registro con las notas.
	writeln('Escriba legajo: '); readln(regAlu.legajo);
    if(regAlu.legajo<>0) then
        begin
            writeln('Escriba DNI/año de ingreso: ');
            readln(regAlu.DNI);readln(regAlu.anioIngreso);
            crearListaNotas(l); ////////// arma la lista de materias/nota dentro del registro.
            regAlu.codigosFinal:=l; /// guardo la lista en el registro!!!!!
            writeln('/////////////////////// ');	
			writeln('Datos del alumno leidos ');
			writeln('/////////////////////// ');
		end;
end;

procedure armarArbol(var a:arbol; regAlu:alumnos);
begin
	if (a=nil) then
		begin
			new(a);
			a^.dato:=regAlu;
			a^.hi:=nil;
			a^.hd:=nil;
		end
	else
	if (regAlu.legajo <= a^.dato.legajo) then armarArbol(a^.hi,regAlu)
	else armarArbol(a^.hd,regAlu);
end;


procedure arbolConRegistro(var a:arbol; var regAlu:alumnos); ////se leen todos los registros(se crea la lista y se arma el arbol.
begin
	leerRegAlumnos(regAlu);
	while (regAlu.legajo<>0) do 
		begin
			armarArbol(a,regAlu);
			leerRegAlumnos(regAlu);
		end;
end;

procedure recorrerArbol(a:arbol);
begin
	if(a<>nil) then 
		begin
		recorrerArbol(a^.hi);
		writeln(a^.dato.legajo);
		recorrerArbol(a^.hd);
		end;
end;

{procedure datosSegunCorte(a:arbol, var corte:integer);
begin
	writeln('Escriba valor para leer datos de alumno con legajo menor a dicho valor: ');
	readln(corte);
	if (a<>nil) and (a^.dato.legajo <= corte) then
		begin
			/////////// armar una lista para retornar dni y año de ingreso?
		end;
end;}

procedure retornarLegajoMax(a:arbol; var legajoMax:integer);
begin
	if (a<>nil) then 	
		begin
			if(legajoMax <= a^.dato.legajo) then legajoMax:=a^.dato.legajo;
			retornarLegajoMax(a^.hi,legajoMax);
			retornarLegajoMax(a^.hd,legajoMax);
		end;

end;

procedure retornarDNImax(a:arbol; var DNImax:integer);
begin
	if (a<>nil) then 	
		begin
			if(DNImax <= a^.dato.DNI) then DNImax:=a^.dato.DNI;
			retornarDNImax(a^.hi,DNImax);
			retornarDNImax(a^.hd,DNImax);
		end;

end;

procedure legajoImpar(a:arbol; var contadorLegajoImpar:integer);
begin
	if (a<>nil) then 	
		begin
			if((a^.dato.legajo mod 2)  <> 0) then contadorLegajoImpar:=contadorLegajoImpar + 1;
			legajoImpar(a^.hi,contadorLegajoImpar);
			legajoImpar(a^.hd,contadorLegajoImpar);
		end;

end;

procedure recorrerLista(l:lista; var promedio:real); // usar auxiliar para no perder referencia de la lista.
var
sumaNotas:real;contadorLista:real; auxiliar:lista;
begin
	sumaNotas:=0;
	contadorLista:=0;
	auxiliar:=l;
	while(auxiliar<>nil) do 
		begin
			sumaNotas:=sumaNotas + l^.datoLista.NotaFinalMateria;
			contadorLista:= contadorLista + 1;
			auxiliar:=auxiliar^.sig;
		end;
	promedio:=(sumaNotas/contadorLista);
end;

procedure mejorPromedio(a: arbol; var promMax: real; var legajoMaxProm: integer);
var
  promedio: real;
begin
  if (a <> nil) then
  begin
    recorrerLista(a^.dato.codigosFinal, promedio); // Pasa la lista de materias del alumno
    if (promMax <= promedio) then
    begin
      promMax := promedio;
      legajoMaxProm := a^.dato.legajo;
    end;
    mejorPromedio(a^.hi, promMax, legajoMaxProm);
    mejorPromedio(a^.hd, promMax, legajoMaxProm);
  end;
end;

var
a:arbol;regAlu:alumnos;DNImax,LegajoMax, contadorLegajoImpar,legajoMaxProm:integer; promMax:real;
begin
a:=nil;
DNImax:=0;
LegajoMax:=0;
contadorLegajoImpar:=0;
promMax:=0;
arbolConRegistro(a,regAlu);
//recorrerArbol(a); //prueba de creacion de arbol
retornarLegajoMax(a,LegajoMax);
retornarDNImax(a,DNImax);
{writeln('legajo mayor: ');
writeln(legajomax);
writeln('DNI mayor: ');
writeln(dnimax);}
legajoImpar(a,contadorLegajoImpar);
//writeln('Contador cantidad legajo impar: ', contadorLegajoImpar);
mejorPromedio(a,promMax,legajoMaxProm);
writeln('Mejor promedio: ', promMax);
writeln('Legajo mejor promedio: : ', legajoMaxProm);
end.
