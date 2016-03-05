# Fibonacci as a Service

Just a simple language benchmark with a naive implementation of Fibonacci served via HTTP.

```haskell
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)
```

# Results

## The most performant from each language

| Language | Framework           | Requests/sec  | Total requests | Avg Latency |
| -------- |---------------------|---------------|----------------|-------------|
| Haskell  | Apiary              | **69,056**    | **2,076,808**  | 2.33ms      |
| Go       | Gin                 | 55,943        | 1,679,347      | **1.17ms**  |
| Java     | Spark               | 47,061        | 1,412,082      | 1.38ms      |
| Clojure  | Compjure + HTTP Kit | 38,902        | 1,170,991      | 1.66ms      |
| Elixir   | Sugar               | 22,813        | 685,273        | 3.83ms      |
| Node.JS  | Express             | 22,696        | 683,177        | 3.15ms      |
| Ruby     | Roda                | 7,537         | 22,6137        | 2.12ms      |

## Full ranking

| Language | Framework           | Requests/sec  | Total requests | Avg Latency |
| -------- |---------------------|---------------|----------------|-------------|
| Haskell  | Apiary              | **69,056**    | **2,076,808**  | 2.33ms      |
| Haskell  | Spock               | 57,416        | 1,724,062      | 2.57ms      |
| Haskell  | Simple              | 56,104        | 1,684,709      | 2.70ms      |
| Go       | Gin                 | 55,943        | 1,679,347      | **1.17ms**  |
| Haskell  | Scotty              | 50,048        | 1,502,738      | 2.90ms      |
| Go       | Pat                 | 48,128        | 1,447,483      | 2.43ms      |
| Java     | Spark               | 47,061        | 1,412,082      | 1.38ms      |
| Go       | Gorilla             | 46,729        | 1,402,482      | 2.77ms      |
| Clojure  | Compjure + HTTP Kit | 38,902        | 1,170,991      | 1.66ms      |
| Haskell  | Snap                | 23,756        | 715,166        | 7.11ms      |
| Elixir   | Sugar               | 22,813        | 685,273        | 3.83ms      |
| Node.JS  | Express             | 22,696        | 683,177        | 3.15ms      |
| Java     | Jersey              | 22,506        | 677,301        | 2.45ms      |
| Node.JS  | Restify             | 21,296        | 641,021        | 3.27ms      |
| Elixir   | Phoenix             | 18,624        | 559,225        | 5.90ms      |
| Haskell  | Happstack Lite      | 7,888         | 237,474        | 8.11ms      |
| Ruby     | Roda                | 7,537         | 22,6137        | 2.12ms      |
| Ruby     | Cuba                | 5,246         | 15,7422        | 3.04ms      |
| Ruby     | NYNY                | 3,671         | 11,0173        | 4.35ms      |
| Ruby     | Sinatra             | 2,667         | 80,134         | 5.99ms      |
| Ruby     | Rails               | 2,334         | 70,108         | 6.86ms      |

## Per language ranking

Alphabetical order

### Elixir

| Framework      | Requests/sec  | Total requests | Avg Latency |
|----------------|---------------|----------------|-------------|
| Sugar          | 22,813        | 685,273        | 3.83ms      |
| Phoenix        | 18,624        | 559,225        | 5.90ms      |

### Go

| Framework      | Requests/sec  | Total requests | Avg Latency |
|----------------|---------------|----------------|-------------|
| Gin            | 55,943        | 1,679,347      | 1.17ms      |
| Pat            | 48,128        | 1,447,483      | 2.43ms      |
| Gorilla        | 46,729        | 1,402,482      | 2.77ms      |

### Haskell

| Framework      | Requests/sec  | Total requests | Avg Latency | Memory footprint |
|----------------|---------------|----------------|-------------|------------------|
| Apiary         | 69,056        | 2,076,808      | 2.33ms      | 30MB             |
| Spock          | 57,416        | 1,724,062      | 2.57ms      | 28MB             |
| Simple         | 56,104        | 1,684,709      | 2.70ms      | 28MB             |
| Scotty         | 50,048        | 1,502,738      | 2.90ms      | 26MB             |
| Snap           | 23,756        | 715,166        | 7.11ms      | 33MB             |
| Happstack Lite | 7,888         | 237,474        | 8.11ms      | 34MB             |

### Java

| Framework      | Requests/sec  | Total requests | Avg Latency |
|----------------|---------------|----------------|-------------|
| Spark          | 47,061        | 1,412,082      | 1.38ms      |
| Jersey         | 22,506        | 677,301        | 2.45ms      |

### Node.JS

| Framework      | Requests/sec  | Total requests | Avg Latency |
|----------------|---------------|----------------|-------------|
| Express        | 22,696        | 683,177        | 3.15ms      |
| Restify        | 21,296        | 641,021        | 3.27ms      |

### Ruby

| Framework      | Requests/sec  | Total requests | Avg Latency |
|----------------|---------------|----------------|-------------|
| Roda           | 7,537         | 22,6137        | 2.12ms      |
| Cuba           | 5,246         | 15,7422        | 3.04ms      |
| NYNY           | 3,671         | 11,0173        | 4.35ms      |
| Sinatra        | 2,667         | 80,134         | 5.99ms      |
| Rails          | 2,334         | 70,108         | 6.86ms      |

# Methodology

The tests were run on a Retina Macbook Pro i5@2.6GHz and 8GB RAM using [wrk](https://github.com/wg/wrk):

    $ wrk -c 64 -d 30s http://localhost:4000/10

# Thanks

- [Wagner Amaral](https://github.com/wamaral) for providing Clojure and Compjure applications
- [Daniel Konishi](https://github.com/dkonishi) for pointing out that Elixir tests should be made with `MIX_ENV=production`
