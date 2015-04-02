module DNA where

hammingDistance :: [Char] -> [Char] -> Int
hammingDistance s1 s2 = sum $ map fromEnum $ zipWith (/=) s1 s2
