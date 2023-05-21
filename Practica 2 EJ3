{
Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta
con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida
por el camión (medida en kilómetros).
a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.
c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez.
}


program Hello;
    const
        dimf=200;
    type
        registroViajes = record
            dia:integer;monto:real;distancia:real; end;
        Vviajes = array [1..dimf] of registroViajes;
        VcontDia = array [1..31] of integer;
        
    procedure LeerReg (var reg:registroViajes);
        begin
            writeln('escriba distancia'); readln(reg.distancia);
            if (reg.distancia<>0) then begin
                writeln('Escriba dia/monto');readln(reg.dia);readln(reg.monto);
            end;
        end;
            
procedure LeerVec(var V:Vviajes;var dimL:integer; var reg:registroViajes);
    begin
        LeerReg(reg);
        while ((reg.distancia<>0) and (dimL<dimf)) do begin
            dimL:=dimL+1; v[dimL]:=reg; LeerReg(reg);
        end;
    end;

procedure informar(var V:Vviajes;var dimL:integer; var montoProm:real; var diaM:integer; var distM:real; vdia:VcontDia);
    var
        i,j,f:integer;min:real;montoTotal:real;
    begin
        min:=9999;montoTotal:=0;
        for i:=1 to dimL do begin
            montoTotal:=montoTotal+v[i].monto;
            if(v[i].monto<min) then begin
                min:=v[i].monto;distM:=v[i].distancia;diaM:=v[i].dia;
            end;
            j:=0;
            while (v[i].dia<>j) do begin
                j:=j+1; 
                if (v[i].dia=j) then vdia[j]:=vdia[j]+1;
            end;
        end;
        for f:=1 to 31 do begin
            writeln('cantidad de viajes del dia: ',f, 'son: ', vdia[f]);
        end;
        montoProm:=(montoTotal/dimL);
        end;
            
procedure Eliminar (var v:Vviajes; var dimL:integer; var controlVF:boolean);
    var
    t,k:integer;
    begin
        for k:=1 to dimL do begin
            if(v[k].distancia=100) then begin
                for t:=k to (dimL-1) do v[t]:=v[t+1];
            end;
            controlVF:=TRUE;dimL:=dimL-1;
        end;
    end;
    
var
    v:Vviajes;dimL:integer;montoProm:real;distM:real;diaM:integer;vdia:VcontDia;controlVF:boolean;reg:registroViajes;z:integer;
begin
    for z:=1 to 31 do vdia[z]:=0;
    
    dimL:=0;
    LeerVec(v,dimL,reg);
    informar(v,dimL,montoProm,diaM,distM,vdia);
    Eliminar(v,dimL,controlVF);
    writeln('monto prom:', montoProm, 'diam: ',diaM, 'dism: ',distM);
end.
