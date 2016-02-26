# Fibonacci as a Service

Just a simple language benchmark with a naive implementation of Fibonacci served via HTTP.

```haskell
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)
```

# Results

| Language | Framework      | Requests/sec  | Total requests | Avg Latency | Memory footprint |
| -------- |----------------|---------------|----------------|-------------|------------------|
| Haskell  | Apiary         | **69,056**    | **2,076,808**  | 2.33ms      | 30MB             |
| Haskell  | Spock          | 57,416        | 1,724,062      | 2.57ms      | 28MB             |
| Haskell  | Simple         | 56,104        | 1,684,709      | 2.70ms      | 28MB             |
| Haskell  | Scotty         | 50,048        | 1,502,738      | 2.90ms      | **26MB**         |
| Java     | Spark          | 47,061        | 1,412,082      | **1.38ms**  |                  |
| Haskell  | Snap           | 23,756        | 715,166        | 7.11ms      | 33MB             |
| Node.JS  | Express        | 22,696        | 683,177        | 3.15ms      |                  |
| Node.JS  | Restify        | 21,296        | 641,021        | 3.27ms      |                  |
| Elixir   | Phoenix        | 18,624        | 559,225        | 5.90ms      |                  |
| Haskell  | Happstack Lite | 7,888         | 237,474        | 8.11ms      | 34MB             |
| Ruby     | Roda           | 7,537         | 22,6137        | 2.12ms      |                  |
| Ruby     | Sinatra        | 2,667         | 80,134         | 5.99ms      |                  |
| Ruby     | Rails          | 2,334         | 70,108         | 6.86ms      |                  |

# Methodology

The tests were run on a Retina Macbook Pro i5@2.6GHz and 8GB RAM using [wrk](https://github.com/wg/wrk):

    $ wrk -c 64 -d 30s http://localhost:4000/10
