tin{-
Das erste Haskell Script
-}

size :: Integer
size = (4 - 3) * 2

-- Gibt den doppelten Wert zurück
times2 :: Integer -> Integer
times2 x = 2 * x                -- (t2)

-- times2 (times2 4)
-- times2 (2 * 4)
-- times2 (8)
-- 2 * 8 ~> 16

-- Quadriert den Wert
square :: Integer -> Integer
square x = x * x                -- (sqr)

-- square (times2 3)
-- square (2 * 3)
-- square 6
-- 6 * 6 ~> 36

-- Pythagoras a^2 + b^2 = c^2
pyth :: Integer -> Integer -> Integer
pyth a b = square a + square b  -- (py)

-- pyth 1 2
-- pyth (square 1) (square 2)
-- pyth (1 * 1) (2 * 2)
-- pyth (1) (4)
-- 1 + 4 ~> 5
