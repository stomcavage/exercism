module DNA (count, nucleotideCounts) where

import qualified Data.Map.Strict as M

validateNucleotide :: Char -> Bool
validateNucleotide n  
    | n `elem` "ATCG" = True
    | otherwise       = error $ "invalid nucleotide '" ++ [n] ++ "'"

count :: Char -> String -> Int
count n dna 
    | all validateNucleotide (n:dna) = length $ filter (== n) dna

nucleotideCounts :: String -> M.Map Char Int
nucleotideCounts dna = M.fromList [(n, count n dna) | n <- "ATCG"]
