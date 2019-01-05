package body monitorTemperatura is

    protected body TemperaturaReactor is
      function read return Integer is 
      begin   
         return temperatura;
      end read;
      
      procedure increment is
      begin
         temperatura:=temperatura+150;
      end increment;
      
      procedure decrement is
      begin
         temperatura:=temperatura-50;
      end decrement;
      
      
      
      end TemperaturaReactor;

end monitorTemperatura;
