(ns fib.core
  (:require [org.httpkit.server :as h]
            [compojure.handler :as handler]
            [compojure.core :refer :all]
            [clojure.string :as s])
  (:gen-class))

(defn fib [n]
  (case n
    0 0
    1 1
    (+ (fib (- n 1)) (fib (- n 2)))))

(defroutes fib-routes
  (GET "/:num" [num]
    (let [n (read-string num)]
      (str (fib n)))))

(defn -main [& args]
  (h/run-server (handler/site #'fib-routes)
                {:port 4000}))
