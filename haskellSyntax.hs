{--
Haskell syntax uses indentation and new line to define code block
indentation:
Every clause must start at the same level of indentation. 
All expressions in the same group must have their starting character be exactly aligned.

We can use curly braces and semicolons as delimiters instead of indentation but it is not fully supported:
let {x = 3; z = 5} in x + z
--}

-- define a function:
-- functionName :: argumentType -> argumentType -> returnType
-- functionName x y = return x + y
-- return type: IO () = Do some IO e.g print, IO Int = return a Int Value
func :: Int -> IO ()
func x = do print x

-- Anonymous function - function without name
-- lambda function \ (\argument -> result) argumentValue
lambdaFunc x = (\y -> y + 10) x -- apply the lambda function \y -> y + 10 with argument y = x then return y + 10 (x + 10)
x1 = lambdaFunc 1 --11

-- variable scope
x2 = 1      -- can use x2 in anywhere within the file
scopeFunc1 = do
                print x2                -- 1
                let x2 = 2 in print  x2 -- 2
                let x2 = 3              
                print x2                -- 3
-- with where notation, the variable declare will hoist to top of function                
scopeFunc = do 
                let x2 = 2 in print  x2  -- print 2
                print x2                 -- print 4
                let x2 = 3
                print x2 where x2 = 4    -- print 3


main = do
        --use indentation
        scopeFunc
        print x1
        func 1
        let 
            x = 3 
            z = 5  
            in print (x + z)
        -- use ; instead of new line
        let x = 1; y =20
        -- use {} ; syntax    
        let {x = 100; z = 100} in print (z +z)
        print (x + y) where x = 1; y = 2