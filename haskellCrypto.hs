import Crypto.Hash

import Data.ByteString (ByteString)
import qualified Data.ByteString.Char8 as B

exampleHashWith :: ByteString -> IO ()
exampleHashWith msg = do
    putStrLn $ "  sha1(" ++ show msg ++ ") = " ++ show (hashWith SHA1   msg)
    putStrLn $ "sha256(" ++ show msg ++ ") = " ++ show (hashWith SHA256 msg)


main = do 
          let msg = B.pack "Hello, world"
          exampleHashWith msg