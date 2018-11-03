-- a.) Implementieren Sie eine Funktion, welche nur dann True zurück gibt, falls alle drei Argumente gleich sind.
threeEquals :: Int -> Int -> Int -> Bool
threeEquals x y z = (x == y) && (y == z)

-- b.) welche nur dann True zurück gibt, falls alle vier Argumente gleich sind.
fourEquals :: Int -> Int -> Int -> Int -> Bool
fourEquals a b c d = (a == b) && (a == c) && (a == d)

fourEquals' :: Int -> Int -> Int -> Int -> Bool
fourEquals' a b c d = threeEquals a b c && threeEquals b c d

-- c.) Implementieren Sie eine Funktion, welche den Durchschnitt dreier Ints berechnet und als Double zurück gibt.
averageThree :: Int -> Int -> Int -> Double
averageThree a b c = fromIntegral (a + b + c) / 3

-- d.) Implementieren Sie die Funktion xor :: Bool -> Bool -> Bool die nur dann True zurück gibt, wenn die beiden Argumente unterschiedlich sind.
xor :: Bool -> Bool -> Bool
xor a b = a /= b
