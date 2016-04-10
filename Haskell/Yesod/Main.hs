import Data.Text (pack, Text)
import Network.Wai.Handler.Warp
import Yesod

data Fibaas = Fibaas

mkYesod "Fibaas" [parseRoutes|
/#Int FibR GET
|]

instance Yesod Fibaas where
  makeSessionBackend _ = return Nothing
  shouldLog _ _ _ = False
  yesodMiddleware = id

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

getFibR :: Int -> Handler Text
getFibR number = return . pack . show $ fib number

main :: IO ()
main = do
  app <- toWaiAppPlain Fibaas
  run 4000 $ app
