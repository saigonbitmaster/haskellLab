{- Printf.hs -}
module Printf where

import Language.Haskell.TH


subFunc a b = a + b

myFunc :: Int -> Int -> Q Exp
myFunc a b = [| subFunc a b |] --call function in haskell code: a = $(myFunc 100 200)


myFunc1 :: Q Exp
myFunc1 = [| \a b -> a + b |]  -- call function in haskell code: a = $myFunc 100 200


myExp :: Q Exp
myExp = runQ [| 1 + 2 |]       --runQ will generate AST code 


--runQ :: Quasi m => Q a -> m a
{-- 
module Main where
import Printf

{-# LANGUAGE TemplateHaskell #-}
import Language.Haskell.TH

--run template: ghc --make -XTemplateHaskell main.hs -o main
-- run script:  runhaskell -XTemplateHaskell main.hs
-- main = putStrLn ( $(pr "hello") )
a = $myFunc1 100 200
b = $(myFunc 100 200)
c = $myExp

main = do
  putStrLn (show a)
  let a1 = $(runQ(runQ [| 1 + 2 |])) --3 runQ direct in haskell file
  putStrLn (show c) --3
  putStrLn (show b)
--}