{-- 

. $: composed function
>>= =<<
<$> functor operator
<*> applicative operator
>>= monad operator

>> 
a >> b >> c >> d 
equivalent to: 
do  a
    b
    c
    d


>>= and =<< are operator to pass a return value as an argument to another function
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

>>= and =<< works only with function that return value

\ is use for lambda function
(\y -> y + 10) x

--}


func1 a = return ( a + 1)
func3 a = return (a * 2)

-- pass return value to a function as argument
func2 a = func1 a >>= func3
--func2 1 = 3

func4 a = func1 =<< func3 a
--func4 1 = 3

main = do 
          func2 1 >>= print
          func4 1 >>= print
          print 1 >> print 2 >> print 3 --print 1 2 3