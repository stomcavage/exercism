(ns point-mutations)

(defn hamming-distance [strand1 strand2]
  (if (= (count strand1) (count strand2)) 
    (count (filter true? (map not= strand1 strand2)))
    nil))
