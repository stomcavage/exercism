(ns rna-transcription)

(defn transcribe [nucleotide]
  (case nucleotide
    \G \C
    \C \G
    \T \A
    \A \U
    (throw (AssertionError.))))

(defn to-rna [dna]
  (clojure.string/join (map transcribe dna)))
