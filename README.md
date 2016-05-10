# Fibonacci as a Service

Just a simple language benchmark with a naive implementation of Fibonacci served via HTTP.

```haskell
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)
```

# Results

## Language ranking

| Language | Framework            | Requests/sec  | Total requests | Avg Latency  |
| -------- |----------------------|---------------|----------------|--------------|
| Haskell  | Apiary               | **69,056**    | **2,076,808**  | 2.33ms       |
| Scala    | Colossus             | 62,564        | 1,883,269      | 1.01ms       |
| Go       | Gin                  | 55,943        | 1,679,347      | 1.17ms       |
| Java     | Spark                | 47,061        | 1,412,082      | 1.38ms       |
| Clojure  | Bidi                 | 39,833        | 1,199,033      | 1.64ms       |
| Rust     | Iron                 | 38,921        | 1,167,751      | **685.06us** |
| Crystal  | Kemal                | 35,497        | 1,065,103      | 1.79ms       |
| Elixir   | Sugar                | 22,813        | 685,273        | 3.83ms       |
| Node.JS  | Express              | 22,696        | 683,177        | 3.15ms       |
| JRuby    | Roda                 | 21,572        | 647,576        | 2.89ms       |
| Python   | Wheezy Web           | 20,678        | 622,462        | 3.48ms       |
| Ruby     | Roda                 | 7,537         | 226,137        | 2.12ms       |

## Framework ranking

| Language | Framework            | Requests/sec  | Total requests | Avg Latency  |
| -------- |----------------------|---------------|----------------|--------------|
| Haskell  | Apiary               | **69,056**    | **2,076,808**  | 2.33ms       |
| Scala    | Colossus             | 62,564        | 1,883,269      | 1.01ms       |
| Haskell  | Spock                | 57,416        | 1,724,062      | 2.57ms       |
| Haskell  | Simple               | 56,104        | 1,684,709      | 2.70ms       |
| Scala    | http4s               | 55,982        | 1,680,049      | 1.98ms       |
| Go       | Gin                  | 55,943        | 1,679,347      | 1.17ms       |
| Haskell  | Yesod                | 55,090        | 1,653,803      | 1.80ms       |
| Scala    | Spray                | 51,003        | 1,534,841      | 2.23ms       |
| Haskell  | Scotty               | 50,048        | 1,502,738      | 2.90ms       |
| Go       | Pat                  | 48,128        | 1,447,483      | 2.43ms       |
| Scala    | Finatra              | 47,259        | 1,418,230      | 11.54ms      |
| Scala    | Finch                | 47,117        | 1,413,699      | 10.60ms      |
| Java     | Spark                | 47,061        | 1,412,082      | 1.38ms       |
| Go       | Gorilla              | 46,729        | 1,402,482      | 2.77ms       |
| Clojure  | Bidi                 | 39,833        | 1,199,033      | 1.64ms       |
| Rust     | Iron                 | 38,921        | 1,167,751      | **685.06us** |
| Clojure  | Compojure            | 38,902        | 1,170,991      | 1.66ms       |
| Crystal  | Kemal                | 35,497        | 1,065,103      | 1.79ms       |
| Scala    | Scalatra             | 29,830        | 897,903        | 1.74ms       |
| Java     | Jersey               | 27,185        | 816,312        | 3.72ms       |
| Haskell  | Snap                 | 23,756        | 715,166        | 7.11ms       |
| Scala    | Play                 | 23,121        | 695,310        | 3.27ms       |
| Elixir   | Sugar                | 22,813        | 685,273        | 3.83ms       |
| Node.JS  | Express              | 22,696        | 683,177        | 3.15ms       |
| JRuby    | Roda                 | 21,572        | 647,576        | 2.89ms       |
| Java     | RESTEasy             | 21,334        | 641,922        | 38.08ms      |
| Node.JS  | Restify              | 21,296        | 641,021        | 3.27ms       |
| Python   | Wheezy Web           | 20,678        | 622,462        | 3.48ms       |
| JRuby    | Cuba                 | 19,744        | 594,352        | 3.93ms       |
| Elixir   | Phoenix              | 18,624        | 559,225        | 5.90ms       |
| Python   | Pyramid              | 15,660        | 463,135        | 4.47ms       |
| Node.JS  | Koa                  | 13,787        | 413,737        | 5.00ms       |
| Scala    | Akka HTTP            | 13,141        | 394,707        | 14.47ms      |
| JRuby    | NYNY                 | 12,466        | 374,159        | 3.20ms       |
| JRuby    | Sinatra              | 8,683         | 260,598        | 11.79ms      |
| Python   | Flask                | 8,094         | 242,894        | 7.99ms       |
| Haskell  | Happstack Lite       | 7,888         | 237,474        | 8.11ms       |
| Python   | Django               | 7,549         | 226,516        | 8.54ms       |
| Ruby     | Roda                 | 7,537         | 226,137        | 2.12ms       |
| JRuby    | Rails                | 7,302         | 219,187        | 12.70ms      |
| Node.JS  | Hapi                 | 6,121         | 183,882        | 10.82ms      |
| Ruby     | Cuba                 | 5,246         | 157,422        | 3.04ms       |
| Ruby     | NYNY                 | 3,671         | 110,173        | 4.35ms       |
| Ruby     | Sinatra              | 2,667         | 80,134         | 5.99ms       |
| Ruby     | Rails                | 2,334         | 70,108         | 6.86ms       |

## Per language ranking

Alphabetical order

### Clojure

| Framework      | Requests/sec  | Total requests | Avg Latency |
|----------------|---------------|----------------|-------------|
| Bidi           | 39,833        | 1,199,033      | 1.64ms      |
| Compojure      | 38,902        | 1,170,991      | 1.66ms      |


### Crystal

| Framework      | Requests/sec  | Total requests | Avg Latency |
|----------------|---------------|----------------|-------------|
| Kemal          | 35,497        | 1,065,103      | 1.79ms      |

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

| Framework      | Requests/sec  | Total requests | Avg Latency |
|----------------|---------------|----------------|-------------|
| Apiary         | 69,056        | 2,076,808      | 2.33ms      |
| Spock          | 57,416        | 1,724,062      | 2.57ms      |
| Simple         | 56,104        | 1,684,709      | 2.70ms      |
| Yesod          | 55,090        | 1,653,803      | 1.80ms      |
| Scotty         | 50,048        | 1,502,738      | 2.90ms      |
| Snap           | 23,756        | 715,166        | 7.11ms      |
| Happstack Lite | 7,888         | 237,474        | 8.11ms      |

### Java

| Framework      | Requests/sec  | Total requests | Avg Latency |
|----------------|---------------|----------------|-------------|
| Spark          | 47,061        | 1,412,082      | 1.38ms      |
| Jersey         | 27,185        | 816,312        | 3.72ms      |
| RESTEasy       | 21,334        | 641,922        | 38.08ms     |

### JRuby

| Framework      | Requests/sec  | Total requests | Avg Latency |
|----------------|---------------|----------------|-------------|
| Roda           | 21,572        | 647,576        | 2.89ms      |
| Cuba           | 19,744        | 594,352        | 3.93ms      |
| NYNY           | 12,466        | 374,159        | 3.20ms      |
| Sinatra        | 8,683         | 260,598        | 11.79ms     |
| Rails          | 7,302         | 219,187        | 12.70ms     |

### Node.JS

| Framework      | Requests/sec  | Total requests | Avg Latency |
|----------------|---------------|----------------|-------------|
| Express        | 22,696        | 683,177        | 3.15ms      |
| Restify        | 21,296        | 641,021        | 3.27ms      |
| Koa            | 13,787        | 413,737        | 5.00ms      |
| Hapi           | 6,121         | 183,882        | 10.82ms     |

### Python

| Framework      | Requests/sec  | Total requests | Avg Latency |
|----------------|---------------|----------------|-------------|
| Wheezy Web     | 20,678        | 622,462        | 3.48ms      |
| Pyramid        | 15,660        | 463,135        | 4.47ms      |
| Flask          | 8,094         | 242,894        | 7.99ms      |
| Django         | 7,549         | 226,516        | 8.54ms      |

### Ruby

| Framework      | Requests/sec  | Total requests | Avg Latency |
|----------------|---------------|----------------|-------------|
| Roda           | 7,537         | 226,137        | 2.12ms      |
| Cuba           | 5,246         | 157,422        | 3.04ms      |
| NYNY           | 3,671         | 110,173        | 4.35ms      |
| Sinatra        | 2,667         | 80,134         | 5.99ms      |
| Rails          | 2,334         | 70,108         | 6.86ms      |

### Rust

| Framework      | Requests/sec  | Total requests | Avg Latency |
|----------------|---------------|----------------|-------------|
| Iron           | 38,921        | 1,167,751      | 685.06us    |

### Scala

| Framework      | Requests/sec  | Total requests | Avg Latency |
|----------------|---------------|----------------|-------------|
| Colossus       | 62,564        | 1,883,269      | 1.01ms      |
| http4s         | 55,982        | 1,680,049      | 1.98ms      |
| Spray          | 51,003        | 1,534,841      | 2.23ms      |
| Finatra        | 47,259        | 1,418,230      | 11.54ms     |
| Finch          | 47,117        | 1,413,699      | 10.60ms     |
| Scalatra       | 29,830        | 897,903        | 1.74ms      |
| Play           | 23,121        | 695,310        | 3.27ms      |
| Akka HTTP      | 13,141        | 394,707        | 14.47ms     |

# Methodology

The tests were run on a Retina Macbook Pro i5@2.6GHz and 8GB RAM using [wrk](https://github.com/wg/wrk):

    $ wrk -c 64 -d 30s http://localhost:4000/10

# Thanks

- [Wagner Amaral](https://github.com/wamaral) for providing Compjure (Clojure) and Iron (Rust) applications
- [Daniel Konishi](https://github.com/dkonishi) for pointing out that Elixir tests should be made with `MIX_ENV=production`
