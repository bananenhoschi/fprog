-- 1. Conditional Syntax

compare1 :: (Ord a) => a -> a -> Ordering
compare1 x y = if x > y
  then GT
  else if x < y
    then LT
    else EQ


compare2 :: (Ord a) => a -> a -> Ordering
compare2 x y | x > y = GT
             | x < y = LT
             | otherwise = EQ

compare3 :: (Ord a) => a -> a -> Ordering
compare3 x y = case x > y of
  True -> GT
  otherwise -> case x < y of
    True -> LT
    otherwise -> EQ
