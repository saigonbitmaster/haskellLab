{--
Haskell syntax uses indentation and new line to define code block
indentation:
Every clause must start at the same level of indentation. 
All expressions in the same group must have their starting character be exactly aligned.

We can use curly braces and semicolons as delimiters instead of indentation but it is not fully supported:
let {x = 3; z = 5} in x + z
--}

x = 100
func :: IO ()
func = do print x
main = do
        --use indentation
        func
        let 
            x = 3 
            z = 5  
            in print (x + z)
        -- use {} ; syntax    
        let {x = 100; z = 100} in print (z +z)
        print (x + y) where x = 1; y = 2 
        
