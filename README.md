# Fibonacci as a Service

Just a simple language benchmark with a naive implementation of Fibonacci served via HTTP.

```haskell
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)
```

# Results

| Framework      | Requests/sec  | Total requests | Avg Latency | Memory footprint |
|----------------|---------------|----------------|-------------|------------------|
| Apiary         | **69,056**    | **2,076,808**  | **2.33ms**  | 30MB             |
| Spock          | 57,416        | 1,724,062      | 2.57ms      | 28MB             |
| Simple         | 56,104        | 1,684,709      | 2.70ms      | 28MB             |
| Scotty         | 50,048        | 1,502,738      | 2.90ms      | **26MB**         |
| Snap           | 23,756        | 715,166        | 7.11ms      | 33MB             |
| Happstack Lite | 7,888         | 237,474        | 8.11ms      | 34MB             |

# Running

Following are the WEB frameworks we are benchmarking:

* [Apiary](https://github.com/philopon/apiary)
* [Happstack Lite](https://github.com/Happstack/happstack-lite)
* [Scotty](https://github.com/scotty-web/scotty)
* [Simple](https://github.com/alevy/simple)
* [Snap](https://github.com/snapframework/snap)
* [Spock](https://github.com/agrafix/Spock)

All the exectuables are built with maximum optimization, concurrency support, and a increased GC allocation size, as the GHC default's (512 Kb) is pretty unrealistic for production servers. Consult the `fibaas.cabal` file for details.

The tests were run on a Retina Macbook Pro i5@2.6GHz and 8GB RAM using [wrk](https://github.com/wg/wrk):

    $ wrk -c 64 -d 30s http://localhost:4000/10
