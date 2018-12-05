import Data.Char


-- a.)
inc = (+1)

f' = filter (even) (map inc [1..4])

f'' = filter even $ map inc [1..4]

test_f = f'' == f'


-- b.)

sum' = sum (filter even [1,2,3])
sum'' = sum $ filter even [1..3]

test_sum = sum' == sum''

map' = map even (map inc (filter (>2) [1,2,3]))
map'' = map even $ map inc $ filter (>2) [1..3]

test_map = map' == map''

map''' = map toUpper (filter (not.isSpace) "abc def")
map'''' = map toUpper $ filter (not.isSpace) "abc def"

test_map'' = map''' == map''''

-- c.)

fs = [(+1), (*3), (/2)]
ns = [1,2,3]

zipp = zipWith ($) fs ns
