import Happstack.Lite

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

main :: IO ()
main = do
    let config = defaultServerConfig { port = 4000 }
    serve (Just config) $
        path $ \(number) ->
            ok . toResponse . show $ fib number
