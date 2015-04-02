module DNA where

toRNA :: [Char] -> [Char]
toRNA [] = []
toRNA (x:xs)
    | x == 'G' = 'C' : toRNA xs
    | x == 'C' = 'G' : toRNA xs
    | x == 'T' = 'A' : toRNA xs
    | x == 'A' = 'U' : toRNA xs