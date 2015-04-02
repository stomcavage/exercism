module School where

import Data.List
import qualified Data.Map.Lazy as Map

type GradeNum = Int
type Student  = String
type School   = Map.Map GradeNum [Student]

empty :: School
empty = Map.empty

add :: GradeNum -> Student -> School -> School
add gradeNum student = Map.insertWith (++) gradeNum [student] 

grade :: GradeNum -> School -> [Student]
grade = Map.findWithDefault [] 

sorted :: School -> [(GradeNum, [Student])]
sorted school = Map.toAscList $ Map.map sort school

