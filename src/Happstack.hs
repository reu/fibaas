import Fibonacci
import Happstack.Lite

main :: IO ()
main = do
  let config = defaultServerConfig { port = 4000 }
  serve (Just config) $
    path $ \(number) ->
      ok . toResponse . show . fib $ number
