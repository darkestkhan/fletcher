------------------------------------------------------------------------------
-- EMAIL: <darkestkhan@gmail.com>                                           --
-- License: ISC License (see COPYING file)                                  --
--                                                                          --
--                    Copyright (C) 2017 darkestkhan                        --
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

-- Only first part of fletcher is done. Sum_1 is stored in first byte, Sum_2 in second byte
-- of Fletcher_16_Sum
package Fletcher_16 is

  type Fletcher_16_Sum is mod 2**16;

  generic
    type T (<>) is limited private;
  function Compute_Fletcher_16_Sum_G (Input : aliased T) return Fletcher_16_Sum
  with Pre => Input'Size mod 8 = 0;

end Fletcher_16;
