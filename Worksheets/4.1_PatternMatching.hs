-- 1. Implementieren Sie eine Funktion switchFirstTwo
switchFirstTwo :: [a] -> [a]
switchFirstTwo (x:y:xs) = y : x : xs
switchFirstTwo xs = xs

-- 2. Zweidimensionale Vektoren können als Paar von Ints repräsentiert werden.
type Vec = (Int, Int)

-- a.) Implementieren Sie die Funktion addVec um zwei Vektoren zu addieren. Lösen Sie auch diese Aufgabe mit Patternmatching.
addVec :: Vec -> Vec -> Vec
addVec (x1,y1) (x2,y2) = (x1 + x2, y1 + y2)

-- b.) Jetzt implementieren Sie eine optimierte Variante dieser Funktion indem bei 0 Komponenten erst gar keine Addition ausführt wird.
addVecOpt :: Vec -> Vec -> Vec
addVecOpt (x1,y1) (x2,y2) = ((addOpt x1 x2),(addOpt y1 y2))

addOpt :: Int  -> Int -> Int
addOpt 0 x = x
addOpt x 0 = x
addOpt x1 x2 = x1 + x2
