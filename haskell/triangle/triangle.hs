module Triangle (TriangleType(..), triangleType)
where

data TriangleType = Equilateral | Isosceles | Scalene | Illogical
  deriving (Show, Eq)

triangleType :: Int -> Int -> Int -> TriangleType
triangleType a b c 
  | isValid && equilateral a b c = Equilateral
  | isValid && isosceles a b c   = Isosceles
  | isValid && scalene a b c     = Scalene
  | otherwise                    = Illogical
  where isValid = valid a b c

valid :: Int -> Int -> Int -> Bool
valid a b c  
  | a == 0 || b + c <= a = False
  | b == 0 || a + c <= b = False
  | c == 0 || a + b <= c = False
  | otherwise            = True

equilateral :: Int -> Int -> Int -> Bool
equilateral a b c = a == b && b == c

scalene :: Int -> Int -> Int -> Bool
scalene a b c = a /= b && b /= c

isosceles :: Int -> Int -> Int -> Bool
isosceles a b c
  | a == b && a /= c = True
  | b == c && b /= a = True
  | c == a && c /= b = True
  | otherwise        = False
