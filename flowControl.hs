{--
#runhaskell flow.hs 
if else
switch case 
can use if, switch to execute a function or return a value
recursive
--}

a = 1
b = 2 

flowFunc = do 
        if a == b then print 2 else print 3 --execute a function
        let c = if a == b then 4 else 5     --return a value
        case a of 
            1 -> print 1 
            2 -> print 2
        let d = case a of 
                            1 -> 1
                            2 -> 2    
        print (c, d)


main = do
          flowFunc

{-- 
--https://en.wikibooks.org/wiki/Haskell/Control_structures
--several ways of expressing a choice between different values
--if expression
ifFunc :: Int -> String
ifFunc c = if c >= 10
               then "Greater than 10"
           else 
               if c >= 5 && c < 10
                    then "Lesser 10 & greater 5"
               else "Lesser 5"


--guard expression as argument passing
guardFunc :: Int -> String
guardFunc c
   | c >= 10 = "Greater than 10"
   | c >= 5 = "Lesser 10 & greater 5"
   | otherwise = "Lesser 5"

--embed if expression
embedIf x y = (if x == 0 then 1 else sin x / x) * y

--case expression
caseFunc x = case x of
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

--case by data type expression
data Color = Black | White | RGB Int Int Int

caseByData :: Color -> String
caseByData c = case c of
       Black           -> " black"
       White           -> " white"
       RGB 0 0 0       -> " black"
       RGB 255 255 255 -> " white"
       _               -> "something else"

--Controlling actions, revisited
revisitedFunc num = do
     putStrLn "Enter your guess:"
     guess <- getLine
     case compare (read guess) num of
          LT -> do print "Too low!"
                   revisitedFunc num
          GT -> do print "Too high!"
                   revisitedFunc num
          EQ -> print "You Win!"

-- Return in haskell does not exit function, below will return 3
-- In this anonymous function, if we don't call it on main, it will cause error
getX = do 
       return 1
       return 2
       return 3

main = do
          let x1 = ifFunc 1
          let x2 = guardFunc 1
          let x3 = embedIf 1 2
          let x4 = caseFunc 1
          let x5 = caseByData Black
          x6 <- getX
          print (x1, x2, x3, x4, x5, x6)
          revisitedFunc 1
--}          