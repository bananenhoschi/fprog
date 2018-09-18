import Data.List (sortOn)

data Book = Book { author :: String, title :: String } deriving Show

shelf :: [Book]
shelf = [Book "A" "A1", Book "A" "A2", Book "B" "B1"]

booksByAuthor :: String -> [Book] -> [Book]
booksByAuthor name books = filter (\b -> author b == name) books

sortByTitle :: [Book] -> [Book]
sortByTitle books = sortOn title books

main :: IO ()
main = putStr (show booksByA)
 where booksByA = sortByTitle (booksByAuthor "A" shelf)