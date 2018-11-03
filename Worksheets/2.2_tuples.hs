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
