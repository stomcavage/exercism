module Strain where

import Data.List

keep :: (a -> Bool) -> [a] -> [a]
keep _ [] = []
keep predicate (x:xs)
    | predicate x = x : keep predicate xs
    | otherwise   = keep predicate xs

discard :: (a -> Bool) -> [a] -> [a]
discard predicate = keep $ not . predicate 
