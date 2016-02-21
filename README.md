# Fibonacci as a Service

Just a simple language benchmark with a naive implementation of Fibonacci served via HTTP.

```haskell
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)
```

## Building

    $ cabal update
    $ cabal install --only-dependencies
    $ cabal configure
    $ cabal build

## Running

We are benchmarking two minimalist WEB frameworks: [Scotty](https://github.com/scotty-web/scotty) and [Spock](https://github.com/agrafix/Spock)

Both exectuables are built with maximum optimization, concurrency support, and a increased GC allocation size, as the GHC default's (512 Kb) is pretty unrealistic for production servers. Consult the `fibaas.cabal` file for details.

### Scotty

```haskell
import Fibonacci
import Web.Scotty
import Data.Text.Lazy (pack)

main :: IO ()
main = scotty 4000 $
  get "/:number" $ do
    number <- param "number"
    text . pack . show . fib $ number
```

    $ ./dist/build/fibaas-scotty/fibaas-scotty

### Spock

```haskell
import Fibonacci
import Web.Spock.Simple
import Data.Text (pack)

main :: IO ()
main = runSpock 4000 $ spockT id $
  get "/:number" $ do
    Just number <- param "number"
    text . pack . show . fib $ number
```

    $ ./dist/build/fibaas-spock/fibaas-spock

# Results

Running on a Retina Macbook Pro i5@2.6GHz and 8GB RAM using [wrk](https://github.com/wg/wrk):

    $ wrk -c 64 -d 30s http://localhost:4000/10

| Framework | Requests/sec | Total requests |
|-----------|--------------|----------------|
| Scotty    | 50048        | 1502738        |
| Spock     | 57416        | 1724062        |
