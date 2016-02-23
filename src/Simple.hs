import Fibonacci
import Web.Simple
import Web.Frank
import Network.Wai.Handler.Warp
import Data.ByteString.Lazy.Char8 (pack)
import Data.ByteString.Char8 (unpack)

main :: IO ()
main = run 4000 $ controllerApp () $
  get "/:number" $ do
    param <- queryParam' "number"
    let number = read $ unpack param :: Int in
      respond $ ok "text/plain" $ pack . show . fib $ number
