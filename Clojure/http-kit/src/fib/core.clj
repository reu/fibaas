(ns fib.core
  (:require [org.httpkit.server :as h]
            [clojure.string :as s])
  (:gen-class))

(def infinite-fibs
  (map first
       (iterate (fn [[a b]] [b (+ a b)])
                [0 1])))

(def fib (partial nth infinite-fibs))

(defn app [req]
  ;; `Integer/parseInt` is a little faster than `read-string`
  (let [n (Integer/parseInt (s/replace (:uri req) "/" ""))]
    {:status  200
     :headers {"Content-Type" "text/html"}
     :body    (str "Clojure + http-kit<hr>fib(" n "): " (fib n))}))

(defn -main [& args]
  (h/run-server app {:port 8080}))
