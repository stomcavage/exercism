module Roman (numerals)
where

import Data.Array

type Arabic = Int
type Roman  = String

romanOnes :: Array Int Roman
romanOnes = listArray (0, 9) ["", "I", "II", "III", "IV", "V", 
                              "VI", "VII", "VIII", "IX"]

romanTens :: Array Int Roman
romanTens = listArray (0, 9) ["", "X", "XX", "XXX", "XL", "L", 
                              "LX", "LXX", "LXXX", "XC"]

romanHundreds :: Array Int Roman
romanHundreds = listArray (0, 9) ["", "C", "CC", "CCC", "CD", "D", 
                                  "DC", "DCC", "DCCC", "CM"]

romanThousands :: Array Int Roman
romanThousands = listArray (0, 9) ["", "M", "MM", "MMM"]

numerals :: Arabic -> Roman
numerals n = (romanThousands ! quotThousands) ++ 
             (romanHundreds  ! quotHundreds) ++
             (romanTens      ! quotTens) ++
             (romanOnes      ! remTens)
  where (quotThousands, remThousands) = n `quotRem` 1000
        (quotHundreds, remHundreds)   = remThousands `quotRem` 100
        (quotTens, remTens)           = remHundreds `quotRem` 10

