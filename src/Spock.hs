import Fibonacci
import Web.Spock.Simple
import Data.Text (pack)

main :: IO ()
main = runSpock 4000 $ spockT id $
  get "/:number" $ do
    Just number <- param "number"
    text . pack . show . fib $ number
