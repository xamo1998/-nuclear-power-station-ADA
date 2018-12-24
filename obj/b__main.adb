pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E076 : Short_Integer; pragma Import (Ada, E076, "system__os_lib_E");
   E017 : Short_Integer; pragma Import (Ada, E017, "system__soft_links_E");
   E029 : Short_Integer; pragma Import (Ada, E029, "system__exception_table_E");
   E072 : Short_Integer; pragma Import (Ada, E072, "ada__io_exceptions_E");
   E056 : Short_Integer; pragma Import (Ada, E056, "ada__strings_E");
   E044 : Short_Integer; pragma Import (Ada, E044, "ada__containers_E");
   E031 : Short_Integer; pragma Import (Ada, E031, "system__exceptions_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "interfaces__c_E");
   E058 : Short_Integer; pragma Import (Ada, E058, "ada__strings__maps_E");
   E062 : Short_Integer; pragma Import (Ada, E062, "ada__strings__maps__constants_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__soft_links__initialize_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "system__object_reader_E");
   E051 : Short_Integer; pragma Import (Ada, E051, "system__dwarf_lines_E");
   E043 : Short_Integer; pragma Import (Ada, E043, "system__traceback__symbolic_E");
   E204 : Short_Integer; pragma Import (Ada, E204, "ada__numerics_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "ada__tags_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "ada__streams_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "interfaces__c__strings_E");
   E203 : Short_Integer; pragma Import (Ada, E203, "system__file_control_block_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "system__finalization_root_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "ada__finalization_E");
   E202 : Short_Integer; pragma Import (Ada, E202, "system__file_io_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "system__storage_pools_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "system__finalization_masters_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "system__storage_pools__subpools_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "system__task_info_E");
   E009 : Short_Integer; pragma Import (Ada, E009, "ada__calendar_E");
   E007 : Short_Integer; pragma Import (Ada, E007, "ada__calendar__delays_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "ada__real_time_E");
   E198 : Short_Integer; pragma Import (Ada, E198, "ada__text_io_E");
   E210 : Short_Integer; pragma Import (Ada, E210, "system__random_seed_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "system__tasking__initialization_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "system__tasking__protected_objects_E");
   E185 : Short_Integer; pragma Import (Ada, E185, "system__tasking__protected_objects__entries_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "system__tasking__queuing_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "system__tasking__stages_E");
   E148 : Short_Integer; pragma Import (Ada, E148, "ada__real_time__timing_events_E");
   E195 : Short_Integer; pragma Import (Ada, E195, "monitortemperatura_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "actuadorrefrigerante_E");
   E206 : Short_Integer; pragma Import (Ada, E206, "sensortemperatura_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      declare
         procedure F1;
         pragma Import (Ada, F1, "ada__real_time__timing_events__finalize_body");
      begin
         E148 := E148 - 1;
         F1;
      end;
      declare
         procedure F2;
         pragma Import (Ada, F2, "ada__real_time__timing_events__finalize_spec");
      begin
         F2;
      end;
      E185 := E185 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F3;
      end;
      E198 := E198 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "ada__text_io__finalize_spec");
      begin
         F4;
      end;
      E169 := E169 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "system__storage_pools__subpools__finalize_spec");
      begin
         F5;
      end;
      E161 := E161 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "system__finalization_masters__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "system__file_io__finalize_body");
      begin
         E202 := E202 - 1;
         F7;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, True, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, False, False, True, True, False, False, 
           True, False, False, True, True, True, True, False, 
           False, False, False, False, True, True, False, True, 
           True, False, True, True, True, True, False, False, 
           False, False, False, True, True, True, True, False, 
           True, False, True, True, False, True, False, True, 
           False, False, False, True, False, True, False, False, 
           False, True, False, True, False, True, True, True, 
           False, False, True, False, True, True, True, False, 
           True, True, False, True, True, True, True, False, 
           False, True, False, False, False, True, False, False, 
           True, False, True, False),
         Count => (0, 0, 0, 1, 0, 0, 2, 0, 3, 0),
         Unknown => (False, False, False, False, False, False, True, False, True, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E029 := E029 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E072 := E072 + 1;
      Ada.Strings'Elab_Spec;
      E056 := E056 + 1;
      Ada.Containers'Elab_Spec;
      E044 := E044 + 1;
      System.Exceptions'Elab_Spec;
      E031 := E031 + 1;
      Interfaces.C'Elab_Spec;
      System.Os_Lib'Elab_Body;
      E076 := E076 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E062 := E062 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E025 := E025 + 1;
      E017 := E017 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      E051 := E051 + 1;
      E082 := E082 + 1;
      E058 := E058 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E043 := E043 + 1;
      E084 := E084 + 1;
      Ada.Numerics'Elab_Spec;
      E204 := E204 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E108 := E108 + 1;
      Ada.Streams'Elab_Spec;
      E153 := E153 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E124 := E124 + 1;
      System.File_Control_Block'Elab_Spec;
      E203 := E203 + 1;
      System.Finalization_Root'Elab_Spec;
      E155 := E155 + 1;
      Ada.Finalization'Elab_Spec;
      E151 := E151 + 1;
      System.File_Io'Elab_Body;
      E202 := E202 + 1;
      System.Storage_Pools'Elab_Spec;
      E165 := E165 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E161 := E161 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E169 := E169 + 1;
      System.Task_Info'Elab_Spec;
      E134 := E134 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E009 := E009 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E007 := E007 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E146 := E146 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E198 := E198 + 1;
      System.Random_Seed'Elab_Body;
      E210 := E210 + 1;
      System.Tasking.Initialization'Elab_Body;
      E179 := E179 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E116 := E116 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E185 := E185 + 1;
      System.Tasking.Queuing'Elab_Body;
      E183 := E183 + 1;
      System.Tasking.Stages'Elab_Body;
      E175 := E175 + 1;
      Ada.Real_Time.Timing_Events'Elab_Spec;
      Ada.Real_Time.Timing_Events'Elab_Body;
      E148 := E148 + 1;
      E195 := E195 + 1;
      E005 := E005 + 1;
      E206 := E206 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   E:\Documents\GithubProjects\-nuclear-power-station-ADA\obj\monitortemperatura.o
   --   E:\Documents\GithubProjects\-nuclear-power-station-ADA\obj\actuadorrefrigerante.o
   --   E:\Documents\GithubProjects\-nuclear-power-station-ADA\obj\sensortemperatura.o
   --   E:\Documents\GithubProjects\-nuclear-power-station-ADA\obj\main.o
   --   -LE:\Documents\GithubProjects\-nuclear-power-station-ADA\obj\
   --   -LE:\Documents\GithubProjects\-nuclear-power-station-ADA\obj\
   --   -LE:/programs/ada/lib/gcc/x86_64-pc-mingw32/7.3.1/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
   --   -Xlinker
   --   --stack=0x200000,0x1000
   --   -mthreads
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
