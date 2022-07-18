-- composing function
-- . to define a composed function
-- $ to execute composed function 
func1 :: Int -> Int
func1 x = x * 2

func2 :: Int -> Int
func2 x = x

--(composedFunc . subFunc) 10 =  composedFunc (subFunc 10) = composedFunc $ subFunc 10 -- subFunc 10 to be a argument of composedFunc 

--declare a composed function to return a function
composedFunc :: Int -> Int
composedFunc = func1 . func2 

--execute composed function to return a value
x = (func1 . func2) 10
y = func1 $ func2 10
z = composedFunc 10

main = do 
          print (x, y, z) --(20, 20, 20)