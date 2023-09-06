{Escribir un programa que:
a. Implemente un modulo que lea informacion de socios de un club y las almacene en un arbol
binario de busqueda. De cada socio se lee numero de socio, nombre y edad. La lectura finaliza
con el numero de socio 0 y el arbol debe quedar ordenado por numero de socio.
b. Una vez generado el arbol, realice modulos independientes que reciban el arbol como
parametro y que:
i. Informe el numero de socio mas grande. Debe invocar a un modulo recursivo que
retorne dicho valor.
ii. Informe los datos del socio con el numero de socio mas chico. Debe invocar a un modulo
recursivo que retorne dicho socio.
iii. Informe el numero de socio con mayor edad. Debe invocar a un modulo recursivo que
retorne dicho valor.
iv. Aumente en 1 la edad de todos los socios.
v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a
un modulo recursivo que reciba el valor leido y retorne verdadero o falso.
vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a
un modulo recursivo que reciba el nombre leido y retorne verdadero o falso.
vii. Informe la cantidad de socios. Debe invocar a un modulo recursivo que retorne dicha
cantidad.
viii. Informe el promedio de edad de los socios. Debe invocar al modulo recursivo del inciso
vii e invocar a un modulo recursivo que retorne la suma de las edades de los socios.
xi. Informe los numeros de socio en orden creciente.
x. Informe los numeros de socio pares en orden decreciente.}

program ejercicio3Practica3;
type
	arbol = ^nodo;
	socios = record
		numero:integer;
		nombre:string;
		edad: integer;
	end;
	
	nodo = record
		dato: socios;
		HI: arbol;
		HD: arbol;
		end;
		
procedure leerDatos(var reg:socios);
begin
	writeln('Escriba numero de socio: '); readln(reg.numero);
	if( reg.numero <> 0) then 	
		begin
			writeln('Escriba nombre y edad del socio: '); readln(reg.nombre);readln(reg.edad);
		end;
end;

procedure armarArbol(var a:arbol; reg:socios);

begin
		if (a=nil) then
			begin
				new(a);
				a^.dato:= reg;
				a^.hi:=nil;
				a^.hd:=nil;
			end
			else
			if(reg.numero < a^.dato.numero) then armarArbol(a^.hi,reg)
			else armarArbol(a^.hd,reg);
end;

procedure leerSocios(var a:arbol);
var
reg:socios;
begin
	leerDatos(reg);
	writeln('se leyo los datos: ');
	while(reg.numero<>0) do 
		begin
			armarArbol(a,reg);
			leerDatos(reg);
		end;
end;
////// punto b
procedure InformarSocioMasGrande(a:arbol; var numSocioMax:integer);
begin
	if (a<>nil) then
		begin
			numSocioMax:= a^.dato.numero;
			InformarSocioMasGrande(a^.hd, numSocioMax);
			
			
			end;
end;
/// punto c
procedure InfDatosNumSocioMenor(a:arbol; var numMin:integer; var datosSocioNumMin:socios);
begin
	if (a<>nil) then
		begin
			datosSocioNumMin:= a^.dato;
			InfDatosNumSocioMenor(a^.hi, numMin,datosSocioNumMin); //// ????
			end;
end;
/// punto d
procedure InfSocioEdadMax(a:arbol; var edadMax:integer; var NumSocioMaxEdad:integer);
begin
	if (a<>nil) then
		begin
			if (a^.dato.edad > edadMax) then	NumSocioMaxEdad:= a^.dato.numero;
			InfSocioEdadMax(a^.hi, edadMax,NumSocioMaxEdad);
			InfSocioEdadMax(a^.hd, edadMax,NumSocioMaxEdad);
			end;
end;
/////////
procedure aumentarEdad(var a:arbol);
begin
	if (a<>nil) then
		begin
			aumentarEdad(a^.hi);
			a^.dato.edad:=a^.dato.edad + 1;
			aumentarEdad(a^.hd);
		end;
end;

procedure busquedaDeSocio(a:arbol; numeroDeSocio:integer; var SocioEncontrado:boolean);
begin
	if (a<>nil) then
		begin
			if(numeroDeSocio=a^.dato.numero) then SocioEncontrado:=TRUE;
			busquedaDeSocio(a^.hi,numeroDeSocio,SocioEncontrado);		
			busquedaDeSocio(a^.hd,numeroDeSocio,SocioEncontrado);
		end;
end;

procedure busquedaDeSocioPorNombre(a:arbol; nombreDeSocio:string; var nombreSocioEncontrado:boolean);
begin
	if (a<>nil) then
		begin
			if(nombreDeSocio=a^.dato.nombre) then nombreSocioEncontrado:=TRUE
			else nombreSocioEncontrado:=FALSE;
			busquedaDeSocioPorNombre(a^.hi,nombreDeSocio,nombreSocioEncontrado);	
			busquedaDeSocioPorNombre(a^.hd,nombreDeSocio,nombreSocioEncontrado);
		end;
end;
///////////
procedure contarCantidadSocios(a:arbol; var cantidadSocios:integer);
begin
	if(a<>nil) then
		begin
			cantidadSocios:=cantidadSocios + 1;
			contarCantidadSocios(a^.hi,cantidadSocios);
			contarCantidadSocios(a^.hd,cantidadSocios);
		end;
end;

procedure promedioEdad(a:arbol; var promEdad:real; var contador:integer);

begin
	if(a<>nil) then
		begin
			contador:=contador+1;
			promEdad:=promEdad + a^.dato.edad;
			promedioEdad(a^.hi,promEdad,contador);
			promedioEdad(a^.hd,promEdad,contador);
			promEdad:=(promEdad/contador);
		end;
end;

procedure sumaEdades(a:arbol; var sumEdades:integer);
begin
	if(a<>nil) then
		begin
			sumEdades:=sumEdades + a^.dato.edad;
			sumaEdades(a^.hi,sumEdades);
			sumaEdades(a^.hd,sumEdades);
		end;
end;

procedure InformarSociosAscendente(a:arbol);
begin
	if (a<>nil)then	
		begin
		InformarSociosAscendente(a^.hi);
		writeln(a^.dato.numero);
		InformarSociosAscendente(a^.hd);
		end;
end;

procedure InformarSociosDescendente(a:arbol);
begin
	
	if (a<>nil)then	
		begin
		InformarSociosDescendente(a^.hd);
		writeln(a^.dato.numero);
		InformarSociosDescendente(a^.hi);
		end;
end;



var
a:arbol; numSocioMax,edadMax,numMin,NumSocioMaxEdad,numeroDeSocio,cantidadSocios,contador,sumEdades:integer; datosSocioNumMin:socios; nombreSocioEncontrado,SocioEncontrado:boolean; nombreDeSocio:string;
promEdad:real;

BEGIN
numSocioMax:=0;
NumSocioMaxEdad:=0;
a:=nil;
cantidadSocios:=0;
promEdad:=0;
contador:=0;
leerSocios(a);
InformarSocioMasGrande(a,numSocioMax);
writeln('Numero de socio mas grande: ', numSocioMax);
writeln('//////////////////////////');
InfDatosNumSocioMenor(a,numMin,datosSocioNumMin); 
writeln('Datos del socio con numero menos: ', datosSocioNumMin.numero, ' ',datosSocioNumMin.nombre, ' ', datosSocioNumMin.edad);
writeln('//////////////////////////');
InfSocioEdadMax(a,edadMax,NumSocioMaxEdad);
writeln('Numero de socio de mayor edad: ', NumSocioMaxEdad);
writeln('//////////////////////////');
aumentarEdad(a);
writeln('Escriba numero de socio que desea buscar: '); readln(numeroDeSocio);
busquedaDeSocio(a,numeroDeSocio,SocioEncontrado);
if(socioEncontrado=True) then writeln('Socio con numero: ', numeroDeSocio, ' encontrado')
else write('Socio con numero: ', numeroDeSocio, 'NO encontrado');
writeln('//////////////////////////');
writeln('Escriba nombre de socio que desea buscar: '); readln(nombreDeSocio);
busquedaDeSocioPorNombre(a,nombreDeSocio,nombreSocioEncontrado);
if(nombreSocioEncontrado= TRUE) then writeln('Socio con nombre: ',nombreDeSocio, ' Encontrado') 
else writeln('SOCIO CON ESE NOMBRE NO ENCONTRADO... ');
writeln('//////////////////////////');
contarCantidadSocios(a,cantidadSocios);
writeln('cantidad TOTAL de socios: ', cantidadSocios);
writeln('//////////////////////////');
promedioEdad(a,promEdad,contador);
writeln('Promedio edad de socios: ', promEdad);
writeln('//////////////////////////');
sumaEdades(a,sumEdades);
writeln('Suma de edades: : ', sumEdades);
writeln('//////////////////////////');
InformarSociosAscendente(a);
writeln('//////////////////////////');
InformarSociosDescendente(a); 
	
END.
