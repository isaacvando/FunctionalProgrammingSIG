
;; this is so nice because function calls are lists
;; show evaluation up to cursor

(Math/abs
 (apply -
        (:d (zipmap
             [:a :b :c :d]
             (partition 2 [1 1 2 3 5 8 13 21])))))

(->> [1 1 2 3 5 8 13 21]
     (partition 2)
     (zipmap [:a :b :c :d])
     :d
     (map -)
     (Math/abs))
