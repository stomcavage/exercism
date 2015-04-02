module SumOfMultiples where

import Data.List

sumOfMultiplesDefault :: Integer -> Integer
sumOfMultiplesDefault = sumOfMultiples [3, 5]

sumOfMultiples :: [Integer] -> Integer -> Integer 
sumOfMultiples xs y = sum $ nub $ filter (< y) [a * b | a <- [1..y], b <- xs]

multiplesOf :: Integer -> Integer -> [Integer]
multiplesOf number limit 
    | number > limit = [0]
    | otherwise      = takeWhile (< limit) $ map (* number) [1..limit]

