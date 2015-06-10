module Meetup (Weekday(..), Schedule(..), meetupDay)
where

import Data.Time.Calendar
import Data.Time.Calendar.MonthDay
import Data.Time.Calendar.WeekDate

data Schedule = First | Second | Teenth | Third | Fourth | Last
  deriving (Eq)

data Weekday = 
  Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving (Show,Eq,Ord,Enum)

meetupDay :: Schedule -> Weekday -> Integer -> Int -> Day
meetupDay s w y m = nextMeetWeekday w firstDayOfSchedWeek
  where firstDayOfSchedWeek = 
          case s of
            First  -> firstDayOfMonth y m
            Second -> addDays 7    $ firstDayOfMonth y m
            Teenth -> addDays 12   $ firstDayOfMonth y m
            Third  -> addDays 14   $ firstDayOfMonth y m
            Fourth -> addDays 21   $ firstDayOfMonth y m
            Last   -> addDays (-6) $ lastDayOfMonth y m
  
firstDayOfMonth :: Integer -> Int -> Day
firstDayOfMonth y m = fromGregorian y m 1

lastDayOfMonth :: Integer -> Int -> Day
lastDayOfMonth y m = fromGregorian y m d
  where d = monthLength (isLeapYear y) m

nextMeetWeekday :: Weekday -> Day -> Day
nextMeetWeekday w d
  | dayToWeekday d == w = d
  | otherwise           = nextMeetWeekday w $ addDays 1 d

dayToWeekday :: Day -> Weekday
dayToWeekday d = toEnum $ weekdate - 1
  where (_, _, weekdate) = toWeekDate d

