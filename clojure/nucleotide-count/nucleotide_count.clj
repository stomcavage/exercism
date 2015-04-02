(ns nucleotide-count)

(def nucleotides "ATCG")

(defn count [nucleotide dna]
  (cond
    (some #{nucleotide} nucleotides) (clojure.core/count (filter #(= nucleotide %) dna))
    :else (throw (Exception. "invalid nucleotide"))))

(defn nucleotide-counts [dna]
  (zipmap nucleotides (map #(nucleotide-count/count % dna) nucleotides)))
  
