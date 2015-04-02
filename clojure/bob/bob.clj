(ns bob)

(defn silence? [phrase] 
  (clojure.string/blank? phrase))

(defn shout? [phrase] 
  (and
    (= phrase (clojure.string/upper-case phrase))
    (not (nil? (re-find #"[A-Z]" phrase)))))

(defn question? [phrase] 
  (not (nil? (re-find #"\?$" phrase))))

(defn response-for [phrase]
    (cond
      (silence? phrase) "Fine. Be that way!"
      (shout? phrase) "Whoa, chill out!"
      (question? phrase) "Sure."
      :else "Whatever."))
