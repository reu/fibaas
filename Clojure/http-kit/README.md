# Clojure + http-kit

# Build

`lein uberjar`

# Run

```
java -jar target/uberjar/fib-0.1.0-SNAPSHOT-standalone.jar
wrk -c 64 -d 30s http://localhost:8080/10
```
