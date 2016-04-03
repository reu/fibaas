(ns fib.core
  (:require [org.httpkit.server :as h]
            [bidi.ring :refer (make-handler)]
            [ring.util.response :as res]
            [clojure.string :as s])
  (:gen-class))

(defn fib [n]
  (case n
    0 0
    1 1
    (+ (fib (- n 1)) (fib (- n 2)))))

(defn fib-handler [{:keys [route-params]}]
  (let [number (read-string (:number route-params))]
    (res/response (str (fib number)))))

(defn -main [& args]
  (h/run-server (make-handler ["/", {[:number] fib-handler}])
                {:port 4000}))
