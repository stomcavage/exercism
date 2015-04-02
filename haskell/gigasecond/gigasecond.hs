module Gigasecond where

import Data.Time.Calendar (Day, addDays)

fromDay :: Day -> Day
fromDay = addDays $ gigasecond `div` secondsInDay  where
            gigasecond = 10^9
            secondsInDay = 60 * 60 * 24
