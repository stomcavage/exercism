module ETL (transform) where

import Data.Char (toLower)
import qualified Data.Map as M

transform :: M.Map Int [String] -> M.Map String Int 
transform inputMap = M.fromList $ foldr transform [] $ M.toList inputMap
    where transform (key, vals) = (++) [(map toLower v, key) | v <- vals] 

