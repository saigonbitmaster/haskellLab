{--Type, typeClass, data, newtype 
--Builtin types: Int Float Double Bool Char  
--Type class: can be see as an operator
-- EQ Ord Show Read Enum Bounded Num Integral Floating 
unit type () has only one value () use for some case that type does not contain information
main = do
  x <- putStrLn "Hello"
  case x of
   () -> putStrLn "The only value..."

-- https://wiki.haskell.org/Type#:~:text=The%20other%20two%20ways%20one,you%20to%20provide%20new%20constructors.
-- TYpe and data constructor https://gist.github.com/adomokos/593852ab3c70f3b135301c3d4e755b92

type and data are different
data allows you to introduce a new algebraic data type
type just makes a type synonym.

Grasping the difference between newtype T a = T a and data T a = T a
builtin types
https://www.haskell.org/onlinereport/haskell2010/haskellch6.html

--}

{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE FlexibleInstances #-}

--constructors 
data Color = Red | Green | Blue --Color is type, Red, Green, Blue are constructors
data Color1 = RGB Int Int Int -- equivalent to: RGB :: Int -> Int -> Int -> Color1


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
data Person = Person { name1 :: String, age :: Int, address :: String }
person :: Person
person = Person { name1 = "", age = 1, address = ""}

a1 :: Maybe Int -> Maybe Int
a1 (Just x) = Just 1
a = a1 (Just 1) --print Just 1

--generic declaration types
func :: (Num a) => a -> a -> a --a will sub type of NUm type class
func a b = a + b
funcValue = func 1 2 --3 Int


--type with argument
type TypeWithArg a = (Num a) => a -> a
f :: TypeWithArg a
f x = x + 1
y = f 1 --101 

--type class

--declare
class YesNo a where
  yesNo :: a  -> String
--implement
instance YesNo Int where 
  yesNo a =  "String"
--use
var :: Int
var = 1
value = yesNo var

--data with type argument
data Foo a b = Bar a b deriving (Eq, Show) --a b are types not value
x :: Foo [Char] Integer
x = Bar "Hello" 10 

--do expression with multi data type arguments:
data MyData a b = MyData a b 
func5 ::  MyData Int Int -> Int --specify type declaration
func5 (MyData a b) = a + b      --define a function
b = func5 (MyData 1 2) --3      --call function


--different type newtype and data type???
--data has single constructor or multiple constructors
--newtype has single constructor. 
--type is just an alias for synonym
type AType = String
newtype ANewType = MyNewType String deriving (Show)
data AData = AData String

atype :: AType; atype = "atype"
anewtype :: ANewType; anewtype = MyNewType "anewtype"
adata :: AData; adata = AData "adata"

main = do 
        print (tupleResult, myTypeResult, name, firstName, left, right, a, y, show x)