
-- Anonymous function - function without name
-- lambda function \ (\argument -> result) argumentValue
lambdaFunc x = (\y -> y + 10) x -- apply the lambda function \y -> y + 10 with argument y = x then return y + 10 (x + 10)
x3 = lambdaFunc 10000 --100010

--inline function
y = (\x -> x + 1) 1 + (\x -> x * 2) 1 -- y = x + 1 + y = 1 with x, y = 1

--multi argument lambda
x1 = (\y z -> z + y) 100 100 

--return closure
f y = (\x -> x - y)  
x2 = f 200 100 -- -100

--with do notation
foo = (\x -> do 
                let y = 100
                print (x + y) ) 1

main = do
          print x3