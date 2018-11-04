letsNest :: Int -> Int
letsNest x = let
               c = let b = 6
                   in (x + b)
             in
               let d = 4
               in c + d

letsShadow :: Int -> Int
letsShadow x = let a = 5
               in
                 let a = 6
                 in a + x

cuboid :: Float -> Float -> Float -> Float
cuboid l w h = (2 * baseArea) + (2 * sideArea) + (2 * frontArea)
            where frontArea = l * h
                  sideArea = w * h
                  baseArea = w * l

cuboid' :: Float -> Float -> Float -> Float
cuboid' l w h = let
  frontArea = l * h
  sideArea = w * h
  baseArea = w * l
  in (2 * baseArea) + (2 * sideArea) + (2 * frontArea)
