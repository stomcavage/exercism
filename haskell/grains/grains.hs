module Grains where

square :: Int -> Integer
square power = 2^(power - 1)

total :: Integer 
total = sum $ map square [1..64]

