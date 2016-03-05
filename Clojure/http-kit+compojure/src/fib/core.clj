(ns fib.core
  (:require [org.httpkit.server :as h]
            [compojure.handler :as handler]
            [compojure.core :refer :all]
            [clojure.string :as s])
  (:gen-class))

(def infinite-fibs
  (map first
       (iterate (fn [[a b]] [b (+ a b)])
                [0 1])))

(def fib (partial nth infinite-fibs))

(defroutes fib-routes
  (GET "/:num" [num]
    (let [n (read-string num)]
      (str "Clojure + http-kit + compojure<hr>fib(" n "): " (fib n)))))

(defn -main [& args]
  (h/run-server (handler/site #'fib-routes)
                {:port 8080}))
