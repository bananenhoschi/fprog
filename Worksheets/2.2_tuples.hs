type Person = (String, String, Int)

name :: Person -> String
name (n, _, _) = n

phone :: Person -> String
phone (_,p,_) = p

age :: Person -> Int
age (_,_,a) = a

teacher :: Person
teacher = ("Daniel Kröni", "056 202 78 17", 38)

me :: Person
me = ("Carlo Baumann", "079 800 74 91", 29)

first :: (a,a,b) -> a
first (a,_,_) = a

second :: (a,a,b) -> a
second (_,a,_) = a

third :: (a,a,b) -> b
third (_,_,b) = b
