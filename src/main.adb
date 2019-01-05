with Text_IO;
with Ada.Real_Time;
with Ada.Real_Time.Timing_Events;
with System;
with Ada.Numerics.Discrete_Random;
use Ada.Real_Time;
use Ada.Real_Time.Timing_Events;
with SensorTemperatura;
use SensorTemperatura;
with ActuadorRefrigerante;
use ActuadorRefrigerante;
with monitorTemperatura;
use monitorTemperatura;
procedure Main is
   subtype aleatorioReactor is Integer range 1..3;
   package Aleatorio is new Ada.Numerics.Discrete_Random(aleatorioReactor);
      seed : Aleatorio.Generator;
   tempReactor1: aliased TemperaturaReactor;
   tempReactor2:aliased TemperaturaReactor;
   tempReactor3:aliased TemperaturaReactor;

   task type Calentar;
   task type Coordinador(numReactor: Integer; reactor:access TemperaturaReactor;entrada:access SensorTemp; salida:access ActuadorEnfriar);
   task type comprobar(numReactor: Integer; temperatura_reactor: Integer; reactor:access TemperaturaReactor; salida:access ActuadorEnfriar; enfriandose:access Integer);

   task body Calentar is

      random: aleatorioReactor;
   begin
      loop
         Aleatorio.reset(seed);
         random:=Aleatorio.Random(seed);
         Text_IO.Put_Line("Calentando Reactor: "&Integer'Image(random));
         if random=1 then
            tempReactor1.increment;
         elsif random=2 then
            tempReactor2.increment;
         elsif random=3 then
           tempReactor3.increment;
         end if;

         delay 2.0;
         end loop;
   end Calentar;



   task body Coordinador is
      datoEntrada: Integer;
      type comprueba is access comprobar;
      compruebaTarea:comprueba;
      enfriandose: aliased Integer;
   begin
      enfriandose:=0;
      datoEntrada:=-1;
      loop
         entrada.leer(datoEntrada,reactor);
         Text_IO.Put_Line("Temp Reactor: "&Integer'Image(numReactor)&Integer'Image(datoEntrada));


         if datoEntrada<1500 then
            enfriandose:=0;
         end if;


         if (datoEntrada>1500) and (enfriandose=0) then
            enfriandose:=1;
            compruebaTarea:=new comprobar(numReactor, datoEntrada, reactor, salida,enfriandose'Access);
         end if;
         datoEntrada:=-1;
      end loop;


   end Coordinador;

   task body comprobar is
      iteraciones:Integer;
   begin
      iteraciones:=(temperatura_reactor-1500)/50;
         if temperatura_reactor>1750 then
            Text_IO.Put_Line("Error temperatura mayor de 1750---->"&Integer'Image(numReactor));
         select
            delay 0.1;
         then abort
            salida.enfriar(reactor);
         end select;
         iteraciones:=iteraciones-1;
         while iteraciones>0 loop
               salida.enfriar(reactor);
            iteraciones:=iteraciones-1;
            delay 1.0;
            end loop;

         elsif temperatura_reactor>1500 then
            select
            delay 0.1;
         then abort
            salida.enfriar(reactor);
         end select;
         iteraciones:=iteraciones-1;
         while iteraciones>0 loop
               salida.enfriar(reactor);
            iteraciones:=iteraciones-1;
            delay 1.0;
            end loop;

      end if;
      enfriandose.all:=0;
      null;
   end comprobar;

   sensor1: aliased SensorTemp;
   actuador1: aliased ActuadorEnfriar;
   actuador2: aliased ActuadorEnfriar;
   actuador3: aliased ActuadorEnfriar;
   sensor2: aliased SensorTemp;
   sensor3: aliased SensorTemp;
   control1:Coordinador(1,tempReactor1'Access,sensor1'Access, actuador1'Access);
   control2:Coordinador(2,tempReactor2'Access,sensor2'Access, actuador2'Access);
   control3:Coordinador(3,tempReactor3'Access,sensor3'Access, actuador3'Access);
   calentador: Calentar;
   --alarma:Alarma;


begin
   sensor1.iniciar;
   sensor2.iniciar;
   sensor3.iniciar;
   actuador1.iniciar;
   actuador2.iniciar;
   actuador3.iniciar;

   null;
end Main;
