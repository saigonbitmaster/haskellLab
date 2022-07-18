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