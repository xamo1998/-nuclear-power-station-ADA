package monitorTemperatura is

   protected type TemperaturaReactor is
      function read return Integer;
      procedure increment;
      --procedure decrement;
   private
      temperatura:Integer:=1850;
   end TemperaturaReactor;
   
        
end monitorTemperatura;
