module Phone (areaCode, number, prettyPrint) where

import Data.Char

type Phone = String

areaCode :: Phone -> String
areaCode p = take 3 $ number p

number :: String -> Phone
number str = case length phone of
        10 -> phone
        11 | head phone == '1' -> tail phone
        _  -> "0000000000"
    where phone = filter isDigit str

prettyPrint :: Phone -> String
prettyPrint p = "(" ++ areaCode phone ++ ") " ++ prefix ++ "-" ++ line
    where phone = number p
          (prefix, line) = splitAt 3 $ drop 3 phone

