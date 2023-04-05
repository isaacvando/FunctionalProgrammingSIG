(ns demo.core
  (:require [clojure.repl :refer :all])
  (:gen-class))


(defn foo
  []
  10)

(foo)

"foo"

(Math/abs
 (apply -
        (:d (zipmap
             [:a :b :c :d]
             (partition 2 [1 1 2 3 5 8 13 21])))))

(->> [1 1 2 3 5 8 13 21]
     (partition 2)
     (zipmap [:a :b :c :d])
     :d
     (apply -)
     (Math/abs))

(doc apply)

(apply + 1 2 '(2 3 4 5))
