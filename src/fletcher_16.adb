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
package body Fletcher_16 is

  type Byte is mod 256;
  for Byte'Size use 8;

  type Byte_Array is array (Natural range <>) of Byte;

  function Compute_Fletcher_16_Sum_G (Input : aliased T) return Fletcher_16_Sum is

    -- Potentially dangerous. 'Address may point to register which may make
    -- results "unpredictable"
    Input_Obj : Byte_Array (0 .. Input'Size / 8);
    for Input_Obj'Address use Input'Address;

    type Sum is mod 255;

    Sum_1, Sum_2 : Sum := 0;
  begin
    for E of Input_Obj loop
      Sum_1 := Sum_1 + Sum (E mod 255);
      Sum_2 := Sum_2 + Sum_1;
    end loop;
    return Fletcher_16_Sum (Sum_2 * 2**8 + Sum_1);
  end Compute_Fletcher_16_Sum_G;

end Fletcher_16;
