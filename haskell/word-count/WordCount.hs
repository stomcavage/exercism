module WordCount (wordCount) where

import Data.Char (isPunctuation, isSymbol, toLower)
import qualified Data.Map.Strict as Map (Map, fromListWith)

wordCount :: String -> Map.Map String Int
wordCount string = Map.fromListWith (+) ws
    where clean x 
              | isPunctuation x = ' '
              | isSymbol x      = ' '
              | otherwise       = toLower x
          ws = [ (w, 1) | w <- words $ map clean string ]
