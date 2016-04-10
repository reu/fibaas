import Web.Simple
import Web.Frank
import Network.Wai.Handler.Warp
import Data.ByteString.Lazy.Char8 (pack)
import Data.ByteString.Char8 (unpack)

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

main :: IO ()
main = run 4000 $ controllerApp () $
    get "/:number" $ do
        param <- queryParam' "number"
        let number = read $ unpack param :: Int in
            respond $ ok "text/plain" $ pack . show $ fib number
