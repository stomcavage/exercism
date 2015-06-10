module Beer (sing, verse)
where

import Data.List

verse :: Int -> String
verse n = firstLine n ++ "\n" ++ secondLine n ++ "\n"

firstLine :: Int -> String
firstLine 0 = "No more bottles of beer on the wall, no more bottles of beer."
firstLine 1 = "1 bottle of beer on the wall, 1 bottle of beer."
firstLine n = show n ++ " bottles of beer on the wall, " ++ show n ++ " bottles of beer."

secondLine :: Int -> String
secondLine 0 = "Go to the store and buy some more, 99 bottles of beer on the wall."
secondLine 1 = "Take it down and pass it around, no more bottles of beer on the wall."
secondLine 2 = "Take one down and pass it around, 1 bottle of beer on the wall."
secondLine n = "Take one down and pass it around, " ++ show (n - 1) ++ " bottles of beer on the wall."

sing :: Int -> Int -> String
sing start end = unlines $ map verse selected
  where selected = unfoldr (\n -> if n < end then Nothing else Just (n, n - 1)) start

