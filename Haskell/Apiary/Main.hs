import Web.Apiary
import Network.Wai.Handler.Warp

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

main :: IO ()
main =
    runApiary (run 4000) def $
        [capture|/number::Int|] . method GET . action $ do
            number <- param [key|number|]
            showing $ fib number
