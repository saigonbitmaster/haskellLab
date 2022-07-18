{- Printf.hs -}
module Printf where

{-# LANGUAGE TemplateHaskell #-}
import Language.Haskell.TH


subFunc a b = a + b

myFunc :: Int -> Int -> Q Exp
myFunc a b = [| subFunc a b |] --call function in haskell code: a = $(myFunc 100 200)

--quotation
myFunc1 :: Q Exp
myFunc1 = [| \a b -> a + b |]  -- call function in haskell code: a = $myFunc 100 200

--q monad
myExp :: Q Exp
myExp = runQ [| 1 + 2 |]

-- Haskell template can be done via Q monad or quote

{-- 
module Main where
import Printf

{-# LANGUAGE TemplateHaskell #-}
import Language.Haskell.TH

--combine template: ghc --make -XTemplateHaskell main.hs -o main
-- ./main
-- run from terminal: runhaskell -XTemplateHaskell main.hs
a = $myFunc1 100 200
b = $(myFunc 100 200)
c = $myExp

main = do
  putStrLn (show a)
  putStrLn (show b)
  print c --3
--}