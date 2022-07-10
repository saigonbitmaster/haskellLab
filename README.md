Haskell concepts:
- everything is with type: functions, values ...
- every functions are math expressions

links to learn:
https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/intro.html


#functor, applicative, monad
A functor is a data type that implements the Functor typeclass.
An applicative is a data type that implements the Applicative typeclass.
A monad is a data type that implements the Monad typeclass.
A Maybe implements all three, so it is a functor, an applicative, and a monad.


Haskell is a widely used purely functional language. Functional programming is based on mathematical functions. 
#add module to app: cardanoLab.cabal add mtl module. then when run cabal run or build it will install mtl
build-depends:    base ^>=4.14.3.0, mtl

#import 
use as to different the duplicate name of the module, both Text and Lazy has pack function so if not use as it will cause an error.
import Data.Text as MyText
import Data.ByteString.Lazy  


a = Data.Text.pack "abc" --full package name
b = MyText.pack "abc"    -- package alias

#tools
Prelude> :l main.hs -- load hs file
*Main> :break 2 -- break point

#syntax 
indentation - thut dau dong
curly braces and semicolons as delimiters. - {} & ;

curly braces and semicolons as delimiters:
let {x = 3; z = 5} in x + z

indentation
Every clause must start at the same level of indentation. 
All expressions in the same group must have their starting character be exactly aligned.
let 
    x = 3 
    z = 5  
    in print (x + z) 

main = do
        let 
                x = 3 
                z = 5  
                in print (x + z)

        let {x = 100; z = 100} in print (z +z)

        let 
                x = 3 
                z = 5  
                in print (x + z) 

all let must be at the same level of indentation
all expressions in the same LET group must have their starting character lower level than LET to identify it belong to let instead of DO

#strange (???)

func1 a b = a + b;
func2 a b = return (a - b);

main = do {
  a <- func2 2 1; --ok
  let b = func1 2 1; --error
  print a;
}

Can you reassign variables in Haskell?
You can't. Once a variable has a value, it has that value forever

Expressions in Haskell are immutable. They cannot change after they are evaluated.

below will not work:
g1 a b = do
   let z = 1
   if a == b then z = 0 else z = 2
   return z

#variables and constant
in root or inside where notation code block:
x = 1
inside do block 
let x = 1
#define a function, function name start with none capital character
aa :: Int -> Int    -- function arguments, return type declaration
aa a = a + 1        -- function definition
a = aa 10           -- function execution

#use tuple type to destructure arguments:
func1 :: (Int, Int, Int) -> IO Int
func1 (a, b, c) = do  
  let d =  a + b + c
  return d

#if and case

func1 :: (Int, Int, Int) -> IO Int
func1 (a, b, c) = do  
  if a == 1 
    then print "a = 1"
    else 
      if a == 2
        then print "a is not 1"
        else print "a is not 1 or 2"
  case b of 
    1 -> return 1
    2 -> return 2
    otherwise -> return 3
  --assign value with case  
  let d = case c of   
        1 -> 1 --indentation must lower than d
        otherwise -> 2
  return d

main = do 
  b <- func1 (3,2,3)
  print b

#guard, evaluate arguments

myFunc1 :: Int -> Int 
myFunc1 x | x == 0 = 1 
          | x /= 0 = x * x

myFunc2 :: Int -> Int -> Int
myFunc2 x y
 | x < y = 1
 | x == y = 2
 | x > y =3


#symbol
>> 
a >> b >> c >> d 
equivalent to: 
do  a
    b
    c
    d


>>= and =<< are operator to get the return value
a >>= (b >>= (c >>= d))
equivalent to: 
do r1 <- a
   r2 <- b r1
   r3 <- c r2
   d r3

=<< is simply >>= with its arguments reversed


func1 a = return a 
func3 a = return (a + 1)

func2 a = func1 a >>= func3
--func2 1 = 2


func4 a = func1 =<< func3 a
--func4 1 = 2

>>= and =<< works only with function that return so below example will not work:
func1 a = a
b = return 1 >>= func1

dot operator
Prelude> :t (.)
(.) :: (b -> c) -> (a -> b) -> a -> c

Thus (.) is the compose operator.
In math, we might write the composition of functions, f(x) and g(x), that is, f(g(x)), as (f . g)(x)

example:
func1 a = a + 1
func2 a = a + 2
func3 a = a + 20

c1 = func1 . func2 . func3
c3 a = func1 (func2 (func3 a))  --c3 ~ c1

c2 = c1 1 --24



#define, assign var inside a function
myFunc a = b where
     x :: Int    --define type of x, optional    
     x = a + 100 --assign value inside "where"
     b = x

main = do 
     let c = myFunc 1
     print c


myFunc a = do
     let x = a + 100 --assign value inside "do"
     return x

main = do 
     c <- myFunc 1
     print c

#return by where and by do with return
myFunc :: Int -> String -> String -> (Int, String, String)
myFunc number street town = (a,b,c) where a = number; b = street; c = town 

--sayHello :: Int -> String -> String -> (Int, String, String)
sayHello number street town = do return (number, street, town)

main = do 
       let c = myFunc 1 "a" "b" --use "=" to assign value return from where notation
       d <- sayHello 1 "a" "b"  --use "<-" to assign value return from do with return, or action e.g getLine
       print (c, d) --((1,"a","b"),(1,"a","b")) 

#understand return in haskell
#different between return <- and = 
'return' return a IO data type class (an action)
= return a value     

funcA :: Int -> Int
funcA a = a + 1
funcAReturn = funcA 1

funcB :: Int -> IO (Int) --implement by return anIntValue
funcB a = return (a + 1)
funcBReturn = funcB 1

main = do
         let d = funcAReturn
         e <- funcBReturn
         print (d, e)

#data types
#define custom type, type start with capital character A, B, function start with normal character
data SixSidedDie = S1 | S2 | S3 | S4 | S5 | S6 | S100
instance Show SixSidedDie where 
       show S1 = "one"
       show S2 = "two"
       show S3 = "three"
       show S4 = "four" 
       show S5 = "five" 
       show S6 = "six"
       show S100 = "100"

myFunc :: SixSidedDie -> SixSidedDie
myFunc arg =  S1

main = do 
       let c = myFunc S100
       print c -- one

#none implement show

data TwoSidedDie = One | Two
showNumber :: TwoSidedDie -> String 
showNumber One = "one"
showNumber Two = "two"

main = do 
          print (showNumber Two)

#no instance error, add an instance for new data
No instance for (ToJSON Person) arising from a use of ‘encode’. add below instance to fix

instance ToJSON Person
instance FromJSON Person

constraint type (ép kiểu)
(+) :: (Num a) => a -> a -> a

quick assign type for a value
let a = 5 :: Float

type convert:
main = do 
  let a = 1
      b = "2" 
  print (a + read b)
  print (show a ++ b)

#type variable
myFunc :: Int -> a -> a --a can be Int, Char, String
myFunc a b = b --ok
--myFunc a b = b + a --No OK because Int and a are not the same type
c = myFunc 1 12
c1 = myFunc 1 "a"


myFunc :: a -> a -> a
myFunc a b = a + b -- no Ok because a is not number type so + will not work

#operator as type. In haskell everything is type: value, operator, function
Prelude> :t (>)
(>) :: Ord a => a -> a -> Bool
can be read as: 
  (>) is an Ord instance which accept 02 Ord type arguments.
  The (>) is function that accepts 02 Ord type arguments then return BOOL
(>) 2 1 --true, this works because Int implement Ord

#forall, implicitly and explicitly type bound 
g :: b -> b
equivalent to:
g :: forall b. (b -> b)

f  :: forall a b. a -> b -> b         -- OK, `a` and `b` are explicitly bound
g  :: forall a. a -> forall b. b -> b -- OK, `a` and `b` are explicitly bound
h  :: forall a. a -> b -> b           -- Rejected, `b` is not in scope
i :: a -> b -> b             -- `a` and `b` are implicitly quantified
j :: a -> forall b. b -> b   -- `a` is implicitly quantified
k :: (forall a. a -> b -> b) -- `b` is implicitly quantified
type L :: forall a -> b -> b -- `b` is implicitly quantified


#recursive
doGuessing num = do
   putStrLn "Enter your guess:"
   guess <- getLine
   if (read guess) < num
     then do putStrLn "Too low!"
             doGuessing num
     else if (read guess) > num
            then do putStrLn "Too high!"
                    doGuessing num
            else putStrLn "You Win!"

main = doGuessing 10

#Control structures: if, guard, case



--guard expression
guardFunc :: Char -> String
guardFunc c
   | c >= 'a' && c <= 'z' = "Lower case"
   | c >= 'A' && c <= 'Z' = "Upper case"
   | otherwise            = "Not an ASCII letter"

g x y = (if x == 0 then 1 else sin x / x) * y


lastNonZero a = go a (length a-1)
  where
    go a l | l >= 0 && a !! l == 0 = go a (l-1)
           | l < 0  = Nothing
           | otherwise = Just (a !! l)

f x = case x of
        0 -> 18
        1 -> 15
        2 -> 12
        _ -> 12 - x
{- 
f 0 = 18
f 1 = 15
f 2 = 12
f x = 12 - x

 -}

data Colour = Black | White | RGB Int Int Int

describeBlackOrWhite :: Colour -> String
describeBlackOrWhite c =
  "This colour is"
  ++ case c of
       Black           -> " black"
       White           -> " white"
       RGB 0 0 0       -> " black"
       RGB 255 255 255 -> " white"
       _               -> "... uh... something else"
  ++ ", yeah?"

--Controlling actions, revisited
doGuessing num = do
  putStrLn "Enter your guess:"
  guess <- getLine
  case compare (read guess) num of
    LT -> do putStrLn "Too low!"
             doGuessing num
    GT -> do putStrLn "Too high!"
             doGuessing num
    EQ -> putStrLn "You Win!"

-- Return in haskell does not exit function, below will return 3
getX = do 
          return 1
          return 2
          return 3

{-- 
-- . $ 
--https://stackoverflow.com/questions/940382/what-is-the-difference-between-dot-and-dollar-sign?rq=1
http://learnyouahaskell.com/higher-order-functions#function-application


($) calls the function which is its left-hand argument on the value which is its right-hand argument.
(.) composes the function which is its left-hand argument on the function which is its right-hand argument. 

--}

f :: Int -> Maybe Int
f 0 = Nothing
f x = Just x

case maybeVal of
    Nothing   -> "There is nothing!"
    Just val  -> "There is a value, and it is " ++ (show val)

main = do 
     let x = f 100
     let y = f 0
     print x
     print y
     print (show (1 + 1))
     print (show $1 + 1)
     print $ show (1 + 1)
     print $ show $ 1 + 1
     print . show $ 1 + 1

f $ g $ h x  =  f (g (h x))

#Higher order component 
subFunc a = a + 1

myFunc :: (Int -> Int) -> Int
myFunc fn = 2 + fn 10

main = do 
     let x = myFunc subFunc
     print x -- 13 

-- Anonymous function - function without name
-- lambda function \ (\argument -> result) argumentValue
lambdaFunc x = (\x -> x + 10) x
x = lambdaFunc 10000 --100010

--inline function
y = (\x -> x + 1) 1 + (\x -> x * 2) 1

--multi argument lambda
x = (\y z -> z + y) 100 100 

--return closure
f x = (\x -> x + y)
x = f 100 100 --200

--with do notation
foo = (\x -> do 
                let y = 100
                print (x + y) ) 1

-- composing function
composedFunc :: Int -> Int
composedFunc x = x * 2

--let x = (composedFunc . subFunc) 10 -- subFunc 10 to be a argument of composedFunc 
-- (composedFunc . subFunc) 10 =  composedFunc (subFunc 10)

--function inside function
test a = go a where
                   go a = 1



--in keyword
foo = let greeting = "hello" in print (greeting ++ " world")

--types

-- custom type
data MyType = MyTypeCon Float Float Float  --MyTpeCon is data constructor
surface :: MyType -> Float   
surface (MyTypeCon _ _ r) = pi * r ^ 2   
myData = MyTypeCon 10 20 10
myTypeResult = surface myData -- surface (MyTypeCon 10 20 10)


--Tuple type
tupleData = ("Will","Kurt")
tupleFunc (a, b) = a
tupleResult = tupleFunc tupleData

--type & new type
type Name = String
name :: Name
name = "name"

newtype FirstName = FirstName Name
myFirstName :: FirstName -> String
myFirstName (FirstName s) = s
firstName = myFirstName (FirstName "firstName") 


left = Left "foo" :: Either String Int
right = Right 3 :: Either String Int

--object type
data Person = Person { name :: String, age :: Int, address :: String }
person :: Person
person = Person { name = "", age = 1, address = ""}
nameValue = name person --get an object value
ageValue = age person

main = do 
        print (tupleResult, myTypeResult, name, firstName, left, right) 


--object data type
{-# LANGUAGE RankNTypes #-}

length :: forall a. [a] -> Int
length a =  1

data Person = Person { name :: String, age :: Int, address :: String } deriving (Show, Eq)
person :: Person
person = Person { name = "", age = 1, address = ""}

main = print person

-- type with arguments
{-# LANGUAGE RankNTypes #-}

type Discard a = (Num a) => a -> a

f :: Discard a
f x = x + 100000

y = f 1
main = print y
==
type class
What are typeclasses?
Typeclasses define a set of functions that can have different implementations depending on the type of data they are given. 

class BasicEq a where
    isEqual :: a -> a -> Bool

instance BasicEq Bool where
    isEqual True  True  = True
    isEqual False False = True
    isEqual _     _     = False


{-# LANGUAGE FlexibleInstances #-}

class Listable a where
  toList :: a -> String

-- implement function toList
instance Listable String where
  toList a =  "hello" ++ " " ++ a
-- use type class

main = print ( toList "Thang")

--type class for number variable

{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE RankNTypes #-}

class YesNo a where
  yesNo :: a  -> String

instance YesNo Int where 
  yesNo a =  "String"

var :: Int
var = 1

main = print (yesNo var)

#json type class
http://book.realworldhaskell.org/read/using-typeclasses.html
result :: JValue
result = JObject [
  ("query", JString "awkward squad haskell"),
  ("estimatedCount", JNumber 3920),
  ("moreResults", JBool True),
  ("results", JArray [
     JObject [
      ("title", JString "Simon Peyton Jones: papers"),
      ("snippet", JString "Tackling the awkward ..."),
      ("url", JString "http://.../marktoberdorf/")
     ]])
  ]


#Template haskell
Template Haskell has two main areas of application: 
 - Haskell code generation at compile-time - the meta program , not real haskell code it is used to generate code
 - Embed of domain specific languages.

To run a meta program like curryN at compile-time, enclose it with Template Haskell's splice operator $ by writing  $(curryN 3)

To understand template
  - AST
  - Q monad

How template haskell works:
- [| and |] are used to get the abstract syntax tree for the enclosed expression
- ‘splice’ brackets $( and ) are used to convert from the abstract syntax tree back into Haskell.

In short: Quotation -> AST syntax code -> haskell code

run template from terminal:
$ ghci -XTemplateHaskell
Prelude> :m + Language.Haskell.TH
Prelude Language.Haskell.TH>

generate and run AST code in haskell file:
b ::Q Exp
b = runQ [e| Just x |] -- generate AST code: AppE (ConE GHC.Maybe.Just) (UnboundVarE x)
a = $(return (InfixE (Just (LitE (IntegerL 1))) (VarE (mkName "+")) (Just (LitE (IntegerL 2))))) --run AST code

haskell template must run through the import not directly

Language extension and module for template haskell:
  {-# LANGUAGE TemplateHaskell #-}
  import Language.Haskell.TH

example main.hs is haskell file, Printf.hs is template file:
main.hs
module Main where
import Printf (pr)

{-# LANGUAGE TemplateHaskell #-}

--run template: ghc --make -XTemplateHaskell main.hs -o main
-- main = putStrLn ( $(pr "hello") )

main = putStrLn ( $(pr "hello") )


#printf.hs 
{- Printf.hs -}
module Printf where

import Language.Haskell.TH
import Control.Monad

data Format = D | S | L String

parse :: String -> [Format]
parse s   = [ L s ]

gen :: [Format] -> Q Exp
gen [L s] = stringE s


pr :: String -> Q Exp
pr s = gen (parse s)

#ghc --make -XTemplateHaskell main.hs -o main
#./main

Template Quotations:
Thing produced	Quotation syntax	  Type
Declaration	    [d| … |]	          Q [Dec]
Expression	    [e| … |]	          Q Exp
Typed expression	[|| … ||]	        Q (TExp a)
Type	          [t| … |]	          Q Type
Pattern	        [p| … |]	          Q Pat



--run AST code direct in haskell code

{-# LANGUAGE TemplateHaskell #-}
import Language.Haskell.TH

main = do 
  let a = $(return (InfixE (Just (LitE (IntegerL 1))) (VarE (mkName "+")) (Just (LitE (IntegerL 2))))) --AST code
  print a --3

--run code: runhaskell test.hs
#PLUTUS
