import Web.Scotty
import Data.Text.Lazy (pack)

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

main :: IO ()
main = scotty 4000 $
    get "/:number" $ do
        number <- param "number"
        text . pack . show $ fib number
