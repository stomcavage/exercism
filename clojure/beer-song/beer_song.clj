(ns beer-song
  (:require [clojure.string :as s]))

(defn- bottle-desc [n]
  (cond
    (> n 1) (format "%d bottles of beer" n)
    (= n 1) "1 bottle of beer"
    (= n 0) "no more bottles of beer"))

(defn- bottle-action [n]
  (cond
    (> n 1) "Take one down and pass it around"
    (= n 1) "Take it down and pass it around"
    (= n 0) "Go to the store and buy some more"))

(defn verse [n]
  (let [next-n (cond
                 (> n 0) (dec n)
                 :else   99)]
    (format "%s on the wall, %s.\n%s, %s on the wall.\n"
      (s/capitalize (bottle-desc n))
      (bottle-desc n)
      (bottle-action n)
      (bottle-desc next-n))))

(defn sing 
  ([start] 
    (sing start 0))
  ([start stop] 
    (s/join "\n" (map verse (reverse (range stop (inc start)))))))
