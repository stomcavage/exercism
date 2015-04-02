(ns anagram
  (:require [clojure.string :as s]))

(defn- anagram? [lower-word sorted-word candidate]
  (let [lower-candidate (s/lower-case candidate)
        sorted-candidate (sort lower-candidate)]
    (and
      (not (= lower-word lower-candidate))
      (= sorted-word sorted-candidate))))

(defn anagrams-for [word candidates]
  (let [lower-word (s/lower-case word)
        sorted-word (sort lower-word)]
    (filter #(anagram? lower-word sorted-word %) candidates)))
