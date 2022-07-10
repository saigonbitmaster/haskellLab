{-- 
https://www.haskell.org/tutorial/io.html
https://www.tutorialspoint.com/haskell/haskell_input_and_output.htm
https://www.schoolofhaskell.com/user/snoyberg/general-haskell/exceptions/catching-all-exceptions
https://www.tweag.io/blog/2020-04-16-exceptions-in-haskell/

IO
Exception
catch
try

--}


--object data type
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE ImpredicativeTypes #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE BinaryLiterals #-}

import GHC.Generics
import Data.Text as MyText
import Language.Haskell.TH
import Data.Typeable
import Data.Aeson
import Data.ByteString.Lazy   
import qualified Data.Text.IO as T
import qualified Data.ByteString.Char8 as C


--implement functor
data Person a = Person {name :: a, age :: a} deriving (Show, Eq)
instance Functor Person where 
  fmap f (Person v0 v1) = Person (f v0) (f v1)



instance Applicative Person where
    pure  = return 
    (<*>) = ap

ap (Person f _) (Person v0 v1) = Person (f v0) (f v1)

person :: Person Int
person = Person {name = 1, age = 2}

func :: Int -> Int
func x = x + 1

result = func <$> person --"Person {name = 2, age = 3}"

main = do
          print (show result) --"Person {name = 2, age = 3}"



-- Person f <*> Person a -> Person f(a)
{-- 
instance Applicative m where
    pure  = return
    (<*>) = ap
Recall that ap is defined by

ap mf mx = mf >>= \f -> x >>= f
Or, using do notation,

ap mf mx = do 
    { f <- mf
    ; x <- mx
    ; return (f x)
    }

applicative <*> to apply a function wrapped in a context to a value wrapped in a context.
<*> is applicative operator
Prelude> Just (+3) <*> Just 2
Just 5
--}          