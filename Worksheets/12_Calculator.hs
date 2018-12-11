import Control.Monad
main = do putStrLn "Volle Kanne Hoschi!"
          forever loop

loop = do putStrLn "Was isch dims 1 Zahl?"
          first <- getLine
          let n1 = read first :: Int
          putStrLn "Und ems 2 Zahl?"
          second <- getLine
          let n2 = read second :: Int
          putStrLn "Und mit was wosch ems verwurschtelen? (+,-,*)"
          op <- getLine
          let f = operator op
          let msg = first ++ op ++ second ++ " = " ++ show (f n1 n2) ++ " du Gurke"
          putStrLn msg

operator :: String -> (Int -> Int -> Int)
operator "+" = (+)
operator "-" = (-)
operator "*" = (*)
