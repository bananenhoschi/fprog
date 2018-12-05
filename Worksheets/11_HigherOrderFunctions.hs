data Student = Student { email :: String, grade :: Float }

transform :: (a -> b) -> [a] -> [b]
transform _ [] = []
transform f (a:as) = (f a) : (transform f as)

squares :: [Int] -> [Int]
squares = transform (^2)

emails :: [Student] -> [String]
emails = transform email

--------------------

keep :: (a -> Bool) -> [a] -> [a]
keep _ [] = []
keep f (a:as) | f a = a : keep f as
              | otherwise = keep f as

goodS :: [Student] -> [Student]
goodS = keep (\s -> grade s > 5)

evens :: [Int] -> [Int]
evens = keep even

--------------------

aggregate :: (a -> a -> a) -> a -> [a] -> a
aggregate f d [] = d
aggregate f d (a:as) = f a (aggregate f d as)

sum' :: [Int] -> Int
sum' = aggregate (+) 0


prod :: [Int] -> Int
prod = aggregate (*) 1

or' :: [Bool] -> Bool
or' = aggregate (||) False

and' :: [Bool] -> Bool
and' = aggregate (&&) True


-- import Data.Monoid (Sum)
