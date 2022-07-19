{--
-- This is haskell file to use template HT
--run template: ghc --make -XTemplateHaskell main.hs -o main
-- run script:  runhaskell -XTemplateHaskell main.hs
-- main = putStrLn ( $(pr "hello") )
--}
module Main where
import TemplateHT

{-# LANGUAGE TemplateHaskell #-}
import Language.Haskell.TH

a = $myFunc1 100 200
b = $(myFunc 100 200)
c = $myExp

main = do
  putStrLn (show a)
  let a1 = $(runQ(runQ [| 1 + 2 |])) --3
  putStrLn (show c) --3
  putStrLn (show b)