
{-# LANGUAGE TemplateHaskell #-}
import Language.Haskell.TH

main = do
  let a = 10
  let a1 = $(runQ [| 1000 * a |]) --3 runQ direct in haskell file
  print (show a1)