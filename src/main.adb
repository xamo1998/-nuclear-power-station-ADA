with Text_IO;
with Ada.Real_Time;
with Ada.Real_Time.Timing_Events;
with System;
use Ada.Real_Time;
use Ada.Real_Time.Timing_Events;
with SensorTemperatura;
use SensorTemperatura;
with ActuadorRefrigerante;
use ActuadorRefrigerante;
with monitorTemperatura;
use monitorTemperatura;
procedure Main is

   tempReactor:TemperaturaReactor;

   task type Calentar;
   task type Coordinador(entrada:access SensorTemp);

   task body Calentar is
   begin
      loop
         tempReactor.increment;
        -- Text_IO.Put_Line(Integer'Image(tempReactor.read));
         delay 2.0;
         end loop;
   end Calentar;


   task body Coordinador is
      datoEntrada: Integer;
   begin
      loop
         entrada.leer(datoEntrada, tempReactor);
         Text_IO.Put_Line(Integer'Image(datoEntrada));
      end loop;
   end Coordinador;

   sensor: aliased SensorTemp;
   --sensor2: aliased SensorTemp;
   --sensor3: aliased SensorTemp;
   control:Coordinador(sensor'Access);
   --control2:Coordinador(sensor2'Access);
   --control3:Coordinador(sensor3'Access);
   calentador: Calentar;
begin
   sensor.iniciar;

   --sensor2.iniciar;
   --sensor3.iniciar;
   null;
end Main;
