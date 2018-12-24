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
         dato:=temperatura.read;
        
         
         datoDisponible:=False;
         --Text_IO.Put_Line("Leyendo temperatura...");
      end leer;
      
      procedure Timer(event:in out Ada.Real_Time.Timing_Events.Timing_Event) is
      begin
         --obtener el dato y cargarlo en leyendo
         datoDisponible:=True;
         nextTime:=nextTime+entradaPeriodo;
         Ada.Real_Time.Timing_Events.Set_Handler(entradaJitterControl, nextTime, Timer'Access);
      end Timer;
   end SensorTemp;
   
   

end SensorTemperatura;
