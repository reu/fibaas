import Fibonacci
import Web.Scotty
import Data.Text.Lazy (pack)

main :: IO ()
main = scotty 4000 $
  get "/:number" $ do
    number <- param "number"
    text . pack . show . fib $ number
