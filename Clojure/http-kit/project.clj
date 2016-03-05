(defproject fib "0.1.0-SNAPSHOT"
  :description "Fibonacci in Clojure + http-kit"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.8.0"]
                 [http-kit "2.1.19"]]
  :main ^:skip-aot fib.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
