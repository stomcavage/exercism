(ns phone-number)

(def number [phone]
  (let [phoneNum (filter (not (re-find #"\d") phone))])
    (print phoneNum))

(def area-code [phone]
  (take 3 (number phone)))

(def pretty-print [phone]
  (area-code phone))
