module Anagram (anagramsFor) where

import Data.Char (toLower)
import Data.List (sort)

anagramsFor :: String -> [String] -> [String]
anagramsFor word = filter isAnagram 
    where lWord = map toLower word
          sortedWord = sort lWord
          isAnagram test = 
            let lTest = map toLower test
            in lWord /= lTest && sortedWord == sort lTest
