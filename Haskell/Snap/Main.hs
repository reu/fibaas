import Snap.Core
import Snap.Http.Server
import Data.ByteString.Char8 (pack, unpack)

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

fibHandler :: Snap ()
fibHandler = do
    Just param <- getParam "number"
    let number = read $ unpack param :: Int in
        writeBS . pack . show $ fib number

main :: IO ()
main = do
    let config = setPort 4000 $
                 setAccessLog ConfigNoLog $
                 setErrorLog ConfigNoLog
                 defaultConfig

    httpServe config $
        route [("/:number", fibHandler)]
