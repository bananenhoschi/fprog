module PictureASCII where
import Data.Char

--------------------------------------------------------------------------------
-- 1) ASCII Pictures
--------------------------------------------------------------------------------
-- A Picture is a list of strings.
type Picture = [String]

-- An example picture. Design a nicer one.
lambda :: Picture
lambda = [
 "                   ",
 "     ####          ",
 "       ###         ",
 "        ###        ",
 "        ####       ",
 "       ## ###      ",
 "      ##   ###     ",
 "    ###     ###    ",
 "                   "]

-- Run 'main' to see an example.
main :: IO ()
main = printPicture lambda

-- Prints the given picture to stdout.
printPicture :: Picture -> IO ()
printPicture p = putStr (unlines p)

-- a) Mirrors the given picture horizontally.
flipH :: Picture -> Picture
flipH p = reverse p

-- b) Mirrors the given picture vertically.
-- hint = "Wrqr Mrvyr zhff frcneng hztrxrueg jreqra."
flipV :: Picture -> Picture
flipV p = map reverse p

-- c) Takes two pictures and puts the first above the second.
-- hint = "Qnf fbyygra Fvr nhpu buar Uvysr uvaxevrtra."
above :: Picture -> Picture -> Picture
above p1 p2 = p1 ++ p2

-- d) Takes two pictures and puts the first left of the second.
-- hint = "Irejraqra Fvr qvr Shaxgvba mvcJvgu hz wr mjrv Mrvyra mh xbaxngravrera."
beside :: Picture -> Picture -> Picture
beside p1 p2 = zipWith (++) p1 p2


-- Inverts the 'color' of the given picture.
invert :: Picture -> Picture
invert = map $ map flip
          where flip ' ' = '#'
                flip '#' = ' '
                flip x = x

invert' :: Picture -> Picture
invert' = map (map flip)
          where flip ' ' = '#'
                flip '#' = ' '
                flip x = x


--------------------------------------------------------------------------------
-- 2) Functions on Lists
-- hint = "\65533oreyrtra Fvr fvpu mhrefg qvr Fvtanghe"
--------------------------------------------------------------------------------
-- a) Append an element at the end.

append :: a -> [a] -> [a]
append a as = as ++ [a]

-- b) Reverse all but the first and the last element.

rev :: [a] -> [a]
rev as = head as : (reverse (tail (init as)) ++ [last as])

-- with a pattern and functions combined match:

rev' :: [a] -> [a]
rev' (a:as) = a : ((reverse (init as)) ++ [last as])


-- c) Insert an element at a given position.

insertAt :: a -> Int -> [a] -> [a]
insertAt a n as = take n as ++ [a] ++ drop n as


-- Functions to decode hints.
-- Usage: decodeHint "Mhrefg anpuqraxra, qnaa Gvccf nafpunhra =)"
decodeHint :: String -> String
decodeHint = map rot13
  where rot13 c
         | toLower c >= 'a' && toLower c <= 'm' = chr (ord c + 13)
         | toLower c >= 'n' && toLower c <= 'z' = chr (ord c - 13)
         | otherwise = c
