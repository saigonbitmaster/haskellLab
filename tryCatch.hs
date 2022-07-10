import Control.Exception 

--use try
--try :: Exception e => IO a -> IO (Either e a)
func = do 
        result <- try (evaluate (5 `div` 1))  :: IO (Either SomeException Int) 
        case result of 
            Left ex   -> putStrLn $ "Caught exception: " ++ show ex 
            Right val -> putStrLn $ "The answer was: " ++ show val 

main = do 
        result <- try (evaluate (5 `div` 5))  :: IO (Either SomeException Int) 
        case result of 
            Left ex   -> putStrLn $ "Caught exception: " ++ show ex 
            Right val -> putStrLn $ "The answer was: " ++ show val 

--catch
import Control.Exception

catchAny :: IO a -> (SomeException -> IO a) -> IO a
catchAny = Control.Exception.catch

dangerous :: IO Int
dangerous = error "Fool you!"

main :: IO ()
main = do
    result <- catchAny dangerous $ \e -> do
        putStrLn $ "Got an exception: " ++ show e
        putStrLn "Returning dummy value of -1"
        return (-1)
    print result