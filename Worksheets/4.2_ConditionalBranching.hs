-- Aufgabe: Variationen von bedingter Ausführung
max1 :: Int -> Int -> Int
max1 x y | x > y = x
         | otherwise = y

max2 :: Int -> Int -> Int
max2 x y = if x > y then x else y

max3 :: Int -> Int -> Int
max3 x y = case x > y of
  True -> x
  otherwise -> y

max4 :: Int -> Int -> Int
max4 x y = ifelse (x > y) x y

ifelse :: Bool -> Int -> Int -> Int
ifelse True x _ = x
ifelse False _ y = y
