{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE DataKinds #-}

import Fibonacci
import Web.Apiary
import Network.Wai.Handler.Warp

main :: IO ()
main =
  runApiary (run 4000) def $
    [capture|/number::Int|] . method GET . action $ do
      number <- param [key|number|]
      showing $ fib number
