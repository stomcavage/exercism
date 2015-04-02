module SpaceAge where

data Planet = Mercury 
            | Venus 
            | Earth 
            | Mars 
            | Jupiter 
            | Saturn 
            | Neptune 
            | Uranus
            
ageOn :: Planet -> Int -> Float 
ageOn planet secs = fromIntegral secs / (yearsPerOrbit * secsPerYear) 
        where secsPerYear = 60 * 60 * 24 * 365.25
              yearsPerOrbit = case planet of
                    Mercury -> 0.2408467  
                    Venus   -> 0.61519726 
                    Earth   -> 1.0
                    Mars    -> 1.8808158 
                    Jupiter -> 11.862615 
                    Saturn  -> 29.447498 
                    Uranus  -> 84.016846 
                    Neptune -> 164.79132 
