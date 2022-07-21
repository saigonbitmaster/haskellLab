{-- 
example: https://hackage.haskell.org/package/cryptonite-0.30/docs/Crypto-Tutorial.html
sign: https://hackage.haskell.org/package/ed25519-0.0.5.0/docs/Crypto-Sign-Ed25519.html
hash: https://hackage.haskell.org/package/cryptonite-0.30/docs/Crypto-Hash.html
--}

import Crypto.Sign.Ed25519 as S
import Crypto.Hash as H
import Data.ByteString (ByteString)
import qualified Data.ByteString.Char8 as B


hashFunc :: ByteString -> IO ()
hashFunc msg = do
    print $ "  sha1(" ++ show msg ++ ") = " ++ show (H.hashWith SHA1   msg)
    print $ "sha256(" ++ show msg ++ ") = " ++ show (H.hashWith SHA256 msg)


signFunc :: ByteString -> IO Bool
signFunc stringToSign = do    
                    (pk, sk) <- createKeypair                   --create public and secret keys
                    let signedMessage = sign sk stringToSign    --sign a message with secret key 
                    print signedMessage                         --print signedMessage 
                    return (verify pk signedMessage)            --use public key to verify the message is signed by secrete key
                    

main = do 
        let msg = B.pack "Hello, world"
        hashFunc msg
        signFunc msg >>= print