(ns word-count
  (:require [clojure.string :as s]))

(defn word-count [phrase]
  (frequencies (s/split (s/lower-case (s/replace phrase #"\p{Punct}" "")) #"\s+")))

