
with System;
with Ada.Real_Time;
use Ada.Real_Time;
with Ada.Real_Time.Timing_Events;
use Ada.Real_Time;
with Text_IO;
with monitorTemperatura;
use monitorTemperatura;
package ActuadorRefrigerante is

   type ActuadorDato is new Integer;
   protected type ActuadorEnfriar is

      pragma Interrupt_Priority(System.Interrupt_Priority'Last);
      procedure iniciar;
      procedure parar;
      procedure enfriar(temperatura: access TemperaturaReactor);
      procedure Timer(event: in out Ada.Real_Time.Timing_Events.Timing_Event);
   private
      nextTime:Ada.Real_Time.Time;
      enfriando:ActuadorDato;
      compuerta:Boolean:=False;
               salidaJitterControl:Ada.Real_Time.Timing_Events.Timing_Event;
     --300ms -40 ms del output jitter
      salidaPeriodo:Ada.Real_Time.Time_Span:=Ada.Real_Time.Milliseconds(1000);

   end ActuadorEnfriar;

end ActuadorRefrigerante;
