------------------------------------------------------------------------------
-- EMAIL: <darkestkhan@gmail.com>                                           --
-- License: ISC License (see COPYING file)                                  --
--                                                                          --
--                    Copyright (C) 2019 darkestkhan                        --
------------------------------------------------------------------------------
-- Permission to use, copy, modify, and/or distribute this software for any --
-- purpose with or without fee is hereby granted, provided that the above   --
-- copyright notice and this permission notice appear in all copies.        --
--                                                                          --
-- The software is provided "as is" and the author disclaims all warranties --
-- with regard to this software including all implied warranties of         --
-- merchantability and fitness. In no event shall the author be liable for  --
-- any special, direct, indirect, or consequential damages or any damages   --
-- whatsoever resulting from loss of use, data or profits, whether in an    --
-- action of contract, negligence or other tortious action, arising out of  --
-- or in connection with the use or performance of this software.           --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Fletcher_16;
procedure Test_Fletcher_16 is

  use type Fletcher_16.Fletcher_16_Sum;

  type Result_Check is
  record
    Input  : Unbounded_String;
    Output : Fletcher_16.Fletcher_16_Sum;
  end record;

  Test_Vector : constant array (Positive range <>) of Result_Check
    := ((To_Unbounded_String ("abcde"), 51440),
        (To_Unbounded_String ("abcdef"), 8279),
        (To_Unbounded_String ("abcdefgh"), 1575));

  function Compute_Fletcher_16_Sum is new Fletcher_16.Compute_Fletcher_16_Sum_G (String);

begin
  Ada.Text_IO.Set_Output (Ada.Text_IO.Standard_Error);

  for E of Test_Vector loop
    declare
      Sum: constant  Fletcher_16.Fletcher_16_Sum := Compute_Fletcher_16_Sum (To_String (E.Input));
    begin
      if Sum /= E.Output then
        Ada.Text_IO.Put_Line ("Mismatch between expected and actual result");
        Ada.Text_IO.Put_Line ("Expected : " & E.Output'Image);
        Ada.Text_IO.Put_Line ("Actual : " & Sum'Image);
      end if;
    end;
  end loop;
end Test_Fletcher_16;
