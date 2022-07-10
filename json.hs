{-- 
cabal install --lib aeson


--}

{-# LANGUAGE DeriveGeneric #-} --use for deriving generic
{-# LANGUAGE OverloadedStrings #-} --use for quick object data creation
import GHC.Generics
import Data.Text as MyText
import Data.Aeson
import Data.ByteString.Lazy    

--define JSON type data
data Person = Person { firstName :: Text
                     , lastName  :: Text
                     , age       :: Int 
                     } deriving (Show, Generic)

--implement ToJSON and FromJSON for Person so can use encode and decode functions
instance ToJSON Person
instance FromJSON Person

encodeNewPerson :: Text -> Text -> Int -> ByteString
encodeNewPerson first last age = encode $ Person first last age

--MyText.pack "string" to create Text type from string
jsonData = Person (MyText.pack "abc") (MyText.pack "abc") 30
--Person {firstName = "abc", lastName = "abc", age = 30}
byeString = encodeNewPerson (MyText.pack "abc") (MyText.pack "abc") 30
--"{\"age\":30,\"firstName\":\"abc\",\"lastName\":\"abc\"}"

quickObject = Data.Aeson.object [ "key" .= (5 :: Integer), "somethingElse" .= (2 :: Integer) ] :: Value

main = do
   print jsonData
   print byeString
   print quickObject