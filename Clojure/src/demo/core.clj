(ns demo.core
  (:require [clojure.repl :refer :all] [clojure.set :refer :all] #_[clojure.data.json :refer :all])
  (:gen-class))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println "Hello, World!"))


;; Evaluating expressions

"Hello world!"

19

:somename

(+ 1 2)

(+ 1 2 3 4 5 6 8 9 8)


(str "foo" "bar" "baz" "f")

(println "hello world!")

"hello world"

(doc +)




;; Data Structures

'(1 2 3 4)

[+ - /]

(:joe {:joe "secret123" :teresa "99flkjadf"})

#{1 2 3}

(union #{1} #{2})




;; Macros

(def myName 9000098)
myName

(fn [x y]
  (if (> x y)
    x
    y))

;; (def myFunc (fn [x y]
;;               (if (> x y)
;;                 x
;;                 y)))



(defn myFunc [x y]
  (if (> x y)
    x
    y))

(myFunc 10 45)


(defn bar
  "this is the doc string"
  []
  "this is bar")

(bar)
(doc bar)


(defn two
  ([] "no args")
  ([x] "one arg")
  ([x y] "two args"))


(two 2 4)


(for [x [1 2 3] y ["foo" "bar" "baz"]
      :when (= (count y) x)]
  [x y])



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













(slurp "https://www.york.ac.uk/teaching/cws/wws/webpage1.html")



(macroexpand (defn func [] "foo"))



