{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveAnyClass #-}

import GHC.Generics
import Data.Aeson
import Data.Text (Text)
import qualified Data.ByteString.Lazy as B

data Date = Date { date :: Text } deriving (Show, Generic)

data Post = Post { _id :: Text
                 , title :: Text
                 , url :: Text
                 , created :: Date
                 , subject :: Text
                 , summary :: Text
                 , content :: Text
                 , likes :: Int } deriving (Show, Generic)

instance FromJSON Post
instance ToJSON Post

instance FromJSON Date
instance ToJSON Date

jsonFile :: FilePath
jsonFile = "projects.json"

getJSON :: IO (B.ByteString)
getJSON = B.readFile jsonFile

main :: IO ()
main = do
	d <- (eitherDecode <$> getJSON) :: IO (Either String [Post])
        case d of
            Left err -> putStrLn err
            Right ps -> print ps