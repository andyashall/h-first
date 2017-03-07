module Lib
    ( someFunc
    ) where

someFunc :: IO ()
someFunc = do  
    foo <- putStrLn "Hello, what's your name?"  
    name <- getLine  
    putStrLn ("Hey " ++ name ++ ", you rock!") 
    anotherFunc 

anotherFunc = putStrLn "gat em"