{--
this to collect the strange facts of haskell versus other languages
- return in haskell will not terminate the function
- can not reassign variable value

--}


func :: IO Int
--this function will return 20, haskell will not terminate function at first return statement
func = do 
        return 10
        return 20

-- with where notation, the variable declare will hoist to top of function                
func1 = do 
                let x2 = 2 in print  x2  -- print 2
                print x2                 -- print 4
                let x2 = 3
                print x2 where x2 = 4    -- print 3

--can not reassign a variable value
func2 = do 
        let x = 1
        -- below will cause error
        --let x = 2
        --x = 2 
        print x

--this function reassign value for x so it will cause an error
{- 
func2 :: IO ()
func2 = do 
          let x = 1
          x = 2
          print x
 -}
main = do 
        a <- func
        print a