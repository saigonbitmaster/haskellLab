{--
this to collect the strange facts of haskell versus other languages
- return in haskell will not terminate the function
- can not reassign variable value

--}


func :: IO Int
--this function will return 20
func = do 
        return 10
        return 20

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