package body SensorTemperatura is
   protected body SensorTemp is
      procedure iniciar is
      begin
         datoDisponible:=False;
         nextTime:=Clock+entradaPeriodo;
         Ada.Real_Time.Timing_Events.Set_Handler(entradaJitterControl, nextTime, Timer'Access);
      end iniciar;
      
      entry leer(dato: out Integer; temperatura: access TemperaturaReactor)
        when datoDisponible is
      begin
         dato:=-1;
         select
            delay 0.1;
         then abort
            dato:=temperatura.read;
         end select;
         if dato = -1 then
            Text_IO.Put_Line("Sensor ha tardado mas de 0.1");
         end if;
         
         datoDisponible:=False;
      end leer;
      
      procedure Timer(event:in out Ada.Real_Time.Timing_Events.Timing_Event) is
      begin
         datoDisponible:=True;
         nextTime:=nextTime+entradaPeriodo;
         Ada.Real_Time.Timing_Events.Set_Handler(entradaJitterControl, nextTime, Timer'Access);
      end Timer;
   end SensorTemp;
   
   

end SensorTemperatura;
