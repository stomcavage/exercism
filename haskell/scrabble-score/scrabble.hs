module Scrabble (scoreLetter, scoreWord)
where

import Data.Char
import qualified Data.Map.Lazy as M

type Value = Int

type LetterValues = M.Map Char Value

scoreLetter :: Char -> Value
scoreLetter letter = letterValues M.! toUpper letter

scoreWord :: String -> Value
scoreWord word = sum $ map scoreLetter word

letterValues :: LetterValues
letterValues = M.fromList $ concat [ map (\c -> (c, n)) cs | (cs, n) <- values ]
  where values = [ ("AEIOULNRST", 1), 
                   ("DG",         2),
                   ("BCMP",       3),
                   ("FHVWY",      4),
                   ("K",          5),
                   ("JX",         8), 
                   ("QZ",        10) ]
  
