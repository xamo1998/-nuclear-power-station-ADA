with System;
with Ada.Real_Time;
use Ada.Real_Time;
with Ada.Real_Time.Timing_Events;
use Ada.Real_Time;
with Text_IO;
with monitorTemperatura;
use monitorTemperatura;
package SensorTemperatura is
   type Temperatura is new TemperaturaReactor;
   protected type SensorTemp is
      pragma Interrupt_Priority(System.Interrupt_Priority'Last);
      procedure iniciar;
      entry leer(dato: out Integer; temperatura: access TemperaturaReactor);
      procedure Timer(event: in out Ada.Real_Time.Timing_Events.Timing_Event);
   private
      nextTime:Ada.Real_Time.Time;
      --leyendo: Temperatura;
      datoDisponible: Boolean:=True;
      entradaJitterControl: Ada.Real_Time.Timing_Events.Timing_Event;
      --XXms -XXms del input jitter
      entradaPeriodo:Ada.Real_Time.Time_Span := Ada.Real_Time.Milliseconds(2000);
   end SensorTemp;
   

end SensorTemperatura;
