(defproject fib "0.1.0-SNAPSHOT"
  :description "Fibaas Bidi"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.8.0"]
                 [bidi "2.0.4"]
                 [javax.servlet/servlet-api "2.5"]
                 [http-kit "2.1.19"]]
  :main ^:skip-aot fib.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
