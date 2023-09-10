program ejercicio2;
type

arbol=^nodo;
arbol2=^nodo2;
lista=^nodoLista;

prestamoArbol = record
	ISBN:integer;
	numSocio:integer;
	dia:integer;
	mes:integer;
	cantDiasPrestamo:integer;
end;

prestamoArbol2 = record
	ISBN:integer;
	listaReg:lista;
end;

prestamoLista = record
	numSocio:integer;
	dia:integer;
	mes:integer;
	cantDiasPrestamo:integer;
end;

nodo = record
	datos:prestamoArbol;
	hi:arbol;
	hd:arbol;
end;

nodo2 = record
	datos2:prestamoArbol2;
	hi:arbol2;
	hd:arbol2;
end;

nodoLista = record
	datosLista:prestamoLista;
	sig:lista;
end;

procedure leerReg(var reg:prestamoArbol; var regLista:prestamoLista);
begin
	writeln('Escriba ISBN: '); readln(reg.ISBN);
	if (reg.ISBN<>-1) then
		begin
			writeln('Escriba numero socio: '); readln(reg.numSocio);
			regLista.numSocio:=reg.numSocio;
			writeln('Escriba dia: '); readln(reg.dia);
			regLista.dia:=reg.dia;
			writeln('Escriba mes: '); readln(reg.mes); 
			regLista.mes:=reg.mes;
			writeln('Escriba cantiadad de dias de prestamo: '); readln(reg.cantDiasPrestamo);
			regLista.cantDiasPrestamo:=reg.cantDiasPrestamo;
		end;
end;

procedure armarArbol(var a:arbol; reg:prestamoArbol); 
begin
	if(a=nil) then
		begin
			new(a);
			a^.datos:=reg;
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
		if (reg.ISBN <= a^.datos.ISBN) then armarArbol(a^.hi,reg) ///guarda si es = ???????????
		else armarArbol(a^.hd,reg);
end;

/////////////////// ARMADO ARBOL 2 (CON LISTA)	
procedure	agregarAdelante(var l:lista; reg:prestamoLista);
var
nuevo:lista;
begin
	new(nuevo);
	nuevo^.datosLista:=reg;
	nuevo^.sig:=l;
	l:=nuevo;
end;


procedure armarArbol2(var a2:arbol2; regLista:prestamoLista; reg:prestamoArbol; var l:lista);
begin
	if (a2=nil) then
		begin
			new(a2);
			a2^.datos2.ISBN:=reg.ISBN;
			a2^.datos2.listaReg := nil; // Inicializar la listaReg
			agregarAdelante(a2^.datos2.listaReg,regLista); //// No olvidar: en cada nodo agregar la lista
			a2^.hi:=nil;
			a2^.hd:=nil;
		end
		else
		if (reg.ISBN = a2^.datos2.ISBN) then 
			begin
				agregarAdelante(a2^.datos2.listaReg,regLista);
			end
		else 
		if (reg.ISBN < a2^.datos2.ISBN) then armarArbol2(a2^.hi,regLista,reg,l)
		else armarArbol2(a2^.hd,regLista,reg,l);
end;







/////////////////
procedure crearLosArboles(var a:arbol; var a2:arbol2; var reg:prestamoArbol; var regLista:PrestamoLista);
var
l:lista;
begin
	leerReg(reg,regLista);
	while(reg.ISBN<>-1) do 
		begin
			armarArbol(a,reg);
			armarArbol2(a2,regLista,reg,l);
			leerReg(reg,regLista);
		end;
end;


///// prueba de creacion de arbol
procedure imprimirArbol(a:arbol);
begin
	if(a<>nil) then
		begin
			imprimirArbol(a^.hi);
			writeln('//////////');
			writeln(a^.datos.ISBN);
			writeln('//////////');
			imprimirArbol(a^.hd);
		end;
end;

procedure imprimirArbol2(a2:arbol2);
begin
	if(a2<>nil) then
		begin
			imprimirArbol2(a2^.hi);
			writeln('//////////');
			writeln(a2^.datos2.ISBN);
			writeln('//////////');
			imprimirArbol2(a2^.hd);
		end;
end;
///// prueba de creacion de arbol

procedure maxISBN(a:arbol; var ISBNmayor:integer);
begin
	if(a<>nil) then
		begin
			maxISBN(a^.hd,ISBNmayor);
			if(ISBNmayor < a^.datos.ISBN) then ISBNmayor:=a^.datos.ISBN;	
		end;
end;

procedure minISBN(a2:arbol2; var ISBNmenor:integer);
begin
	if(a2<>nil) then
		begin
			minISBN(a2^.hi,ISBNmenor);
			if (a2^.datos2.ISBN < ISBNmenor) then ISBNmenor:=a2^.datos2.ISBN;
		end;
end;

/////////////////////////////////// modulos de busqueda de cantdad de prestamos por numero de socio.

procedure cantidadDePrestamosDeSocio(a:arbol; numeroSocio:integer; var cantPrestamos:integer);
begin
	if (a<>nil) then
		begin
			if(numeroSocio = a^.datos.numSocio) then cantPrestamos:= cantPrestamos + 1;
			cantidadDePrestamosDeSocio(a^.hi,numeroSocio,cantPrestamos);
			cantidadDePrestamosDeSocio(a^.hd,numeroSocio,cantPrestamos);
		end;
end;



procedure recorrerLista(l:lista; numeroSocio:integer; var cantPrestamos2:integer);
var
auxiliar:lista;
begin
	auxiliar:=l;
	while (auxiliar<>nil) do  
		begin
			if(auxiliar^.datosLista.numSocio = numeroSocio) then cantPrestamos2:=cantPrestamos2 + 1;
		auxiliar:=auxiliar^.sig;
		end;
end;


procedure cantidadDePrestamosDeSocio2(a2:arbol2; numeroSocio:integer ;var cantPrestamos2:integer);
begin
	if (a2<>nil) then 	
		begin
			recorrerLista(a2^.datos2.listaReg,numeroSocio,CantPrestamos2);
			cantidadDePrestamosDeSocio2(a2^.hi,numeroSocio,cantPrestamos2);
			cantidadDePrestamosDeSocio2(a2^.hd,numeroSocio,cantPrestamos2);
		end;
end;

/////////// imprimir contenido de lista
procedure recorrerListaImprimir (l:lista);
var
aux:lista;
begin
	aux:=l;
	while (aux<>nil) do 
		begin
		writeln('numero socio: ', l^.datosLista.numSocio);
		writeln('Dia: ', l^.datosLista.dia);
		writeln('mes: ', l^.datosLista.mes);
		writeln('Cantidad de dias del prestamo: ', l^.datosLista.cantdiasprestamo);
		aux:=aux^.sig;
		end;
end;

procedure imprimirLista(a2:arbol2);
begin
	if(a2<>nil) then
		begin
			recorrerListaImprimir(a2^.datos2.listaReg);
			imprimirLista(a2^.hi);
			imprimirLista(a2^.hd);
		end;
end;


var

a:arbol;reg:prestamoArbol;regLista:prestamoLista;
a2:arbol2;ISBNmayor,ISBNmenor,numeroSocio,cantPrestamos2,cantPrestamos:integer;
begin
a:=nil;
a2:=nil;
cantPrestamos:=0;
cantPrestamos2:=0;
ISBNmayor:=0;
ISBNmenor:=9999;
crearLosArboles(a,a2,REG,regLista);
imprimirArbol(a);
writeln('**********');
writeln('ARBOL 2');
writeln('**********');
imprimirArbol2(a2);
maxISBN(a,ISBNmayor);
writeln('==========');
writeln('ISBN mayor: ', ISBNmayor);
writeln('==========');
minISBN(A2,ISBNmenor);
writeln('ISBN menor: ', ISBNmenor);
writeln('==========');
writeln('Ingrese numero de socio para saber cantidad de prestamos tomados: '); readln(numeroSocio);
cantidadDePrestamosDeSocio(a,numeroSocio,cantPrestamos);
writeln('Cantidad de prestamos:', cantPrestamos);
writeln('==========');
cantidadDePrestamosDeSocio2(a2,numeroSocio,cantPrestamos2);
writeln('Cantidad de prestamos2:', cantPrestamos2);
writeln('==========');
imprimirLista(a2);
end.
