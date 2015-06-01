module Robot (robotName, mkRobot, resetName) 
where

import Data.IORef 
import System.Random 

type Name  = String
type Robot = IORef Name

mkRobot :: IO Robot
mkRobot = genName >>= newIORef 

robotName :: Robot -> IO Name
robotName = readIORef

resetName :: Robot -> IO ()
resetName robot = genName >>= writeIORef robot 

genName :: IO Name
genName = mapM randomRIO [char, char, num, num, num]
  where char = ('A', 'Z')
        num  = ('0', '9')

