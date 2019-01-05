package body ActuadorRefrigerante is
protected body ActuadorEnfriar is
      procedure iniciar is
      begin
         null;
         --he comentado en el main esperar los 260ms
         nextTime:=Clock+salidaPeriodo;
         --Ada.Real_Time.Timing_Events.Set_Handler(salidaJitterControl, nextTime, Timer'Access);
      end iniciar;
      

      procedure enfriar(temperatura: access TemperaturaReactor) is
      begin
  
         temperatura.decrement;
         nextTime:=Clock+salidaPeriodo;
         Ada.Real_Time.Timing_Events.Set_Handler(salidaJitterControl, nextTime, Timer'Access);

      end enfriar;

      procedure Timer(event:in out Ada.Real_Time.Timing_Events.Timing_Event) is
      begin
         --escribir dato escribiendo
         nextTime:=nextTime+salidaPeriodo;
         Ada.Real_Time.Timing_Events.Set_Handler(salidaJitterControl, nextTime, Timer'Access);
      end Timer;
   end ActuadorEnfriar;
   

end ActuadorRefrigerante;
