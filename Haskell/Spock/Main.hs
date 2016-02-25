import Web.Spock.Simple
import Data.Text (pack)

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

main :: IO ()
main = runSpock 4000 $ spockT id $
  get "/:number" $ do
    Just number <- param "number"
    text . pack . show . fib $ number
