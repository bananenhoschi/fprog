-- 1. Implementieren Sie eine Funktion switchFirstTwo
switchFirstTwo :: [a] -> [a]
switchFirstTwo (x:y:xs) = y : x : xs
switchFirstTwo xs = xs
