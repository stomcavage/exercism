module Bob where

import Data.Char

responseFor :: String -> String
responseFor stmt 
    | silent    = "Fine. Be that way!"
    | shout     = "Whoa, chill out!"
    | question  = "Sure."
    | otherwise = "Whatever."
        where silent   = all isSpace stmt
              question = last stmt == '?'
              shout    = all isUpper letters && not (null letters) 
              letters  = filter isAlpha stmt
    
