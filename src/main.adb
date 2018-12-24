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

         delay 7.0;
         end loop;
   end Calentar;


   task body Coordinador is
      datoEntrada: Integer;
   begin
      loop
         entrada.leer(datoEntrada,reactor );
         if datoEntrada>1750 then
            Text_IO.Put_Line("Error temperatura mayor de 1750---->"&Integer'Image(numReactor));
            salida.enfriar(reactor);
         elsif datoEntrada>=1500 then
            salida.enfriar(reactor);
         end if;

         Text_IO.Put_Line("Temp Reactor: "&Integer'Image(numReactor)&Integer'Image(datoEntrada));
      end loop;
   end Coordinador;

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


begin
   sensor1.iniciar;
   sensor2.iniciar;
   sensor3.iniciar;
   actuador1.iniciar;
   actuador2.iniciar;
   actuador3.iniciar;

   null;
end Main;
