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


-- a) Gegeben ist der Typ Op der für arithmetische Operationen steht
data Op = Add | Sub
-- Definieren Sie die Funktion calc :: Op -> Int -> Int -> Int Der erste Parameter bestimmt mit welcher Operation der zweite und der dritte Parameter verknüpft werden:
-- Bsp: calc Add 2 3 ~> 5

calc :: Op -> Int -> Int -> Int
calc Add a b = a + b
calc Sub a b = a - b


-- In dieser Aufgabe implementieren Sie eine einfache McDonalds Kasse.
-- In unserer Filiale werden nur zwei Menus angeboten: BigMac und CheeseRoyal.
-- Die Menus gibt es jeweils in zwei unterschiedlichen Grössen: Small und Large.
-- Überlegen Sie, wie der Typ einer Bestellung (Order) abgebildet werden könnte
-- und implementieren Sie dann die Funktion price :: Order -> Int, die den Preis
-- einer Bestellung berechnet. Ein BigMac Menu kostet 10 CHF und ein CheeseRoyal
-- Menu kostet 11 CHF. Die gegebenen Preise gelten für die kleinen Menus, die
-- grossen Menus kosten jeweils zwei CHF mehr.

data Menu = BigMac | CheeseRoyal
data Size = Small | Large

type Order = (Menu, Size)

order :: Order -> Int
order (BigMac, Small) = 10
order (CheeseRoyal, Small) = 11
order (BigMac, Large) = 12
order (CheeseRoyal, Large) = 13
