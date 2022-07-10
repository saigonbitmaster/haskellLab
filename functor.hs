{-- 
functor, applicative, monad

Maybe is data type that implemented functor, applicative and monad so below example will work.

Functors apply a function to a wrapped value, Maybe (Just) implemented functor already.
fmap is functor operator 
Prelude> fmap (+3) (Just 1)
Just 4

Prelude> (*2) <$> [1..3]
[2,4,6]

applicative <*> to apply a function wrapped in a context to a value wrapped in a context.
<*> is applicative operator
Prelude> Just (+3) <*> Just 2
Just 5

Monads apply a function that returns a wrapped value to a wrapped value. >>= is monad operator

Prelude> half x = if even x then Just (x `div` 2) else Nothing
Prelude> Just 3 >>= half --Just 3 is wrapped value, half is function return wrapped value
Nothing

--}

--functor operation
functorFunc ::  Int -> Int
functorFunc a = a

functorResult = functorFunc <$> [100, 200]
--functorResult = fmap functorFunc [100, 200]

--applicative operation
appFunc :: Int -> Int
appFunc a = a
appResult = Just (appFunc) <*> Just 2

--monad operation
monadFunc a = Just a
monadResult = Just 3 >>= monadFunc

main = print (functorResult, appResult, monadResult)
--runhaskell functor.hs

--implement functor for a data
data Person a = Person {name :: a, age :: a} deriving (Show, Eq)
instance Functor Person where 
  fmap f (Person v0 v1) = Person (f v0) (f v1)

person :: Person Int
person = Person {name = 1, age = 2}

--func with int will work with person datatype
func :: Int -> Int
func x = x + 1

result = func <$> person ----"Person {name = 2, age = 3}"


{--
--implement monad for a new type
data WhyNot a = Nah | Sure a
  deriving Show

instance Monad WhyNot where
   Sure x >>= k = k x
   Nah    >>= _ = Nah
   return x     = Sure x
   fail _       = Nah

safeRoot :: Double -> WhyNot Double
safeRoot x = 
    if x >= 0 then 
      return (sqrt x)
    else
      fail "Boo!"

test :: Double -> WhyNot Double
test x = do
   y <- safeRoot x
   z <- safeRoot (y - 4)
   w <- safeRoot z
   return w


main = do
    print $ test 9
    print $ test 400
--}