
= Folds, folds, folds :) =

In diesem Arbeitsblatt lösen Sie die fold-Aufgaben vergangener Prüfungen:

1) Definieren Sie eine Funktion countChar, die die Anzahl Vorkommnisse eines Chars in
einem String zählt. Die Funktion muss mit foldr implementiert werden.


> countChar :: Char -> String -> Int
> countChar c s = foldr (\x cnt -> if x == c then cnt+1 else cnt) 0 s



> test_countChar = countChar 'a' "abcaa" == 3

2) Definieren Sie die Funktion exists um in einer Liste nach einem Element zu suchen, das
eine Bedingung erfüllt. Auch diese Funktion muss mit foldr implementiert werden.

> exists :: (a -> Bool) -> [a] -> Bool
> exists f = foldr (\x b -> f x || b) False

> test_exists1 = exists even [1,2,3] == True
> test_exists2 = exists (<3) [5,6,7] == False



3) Bank

Gegeben ist folgende Definition eines Bankkontos:

> data Account = Account String [Mutation]
> data Mutation = Deposit Int  -- Betrag einzahlen
>               | Withdraw Int -- Betrag abheben

In dieser Repräsentation eines Kontos (Account) wird neben der Kontonummer (String) nicht
der aktuelle Kontostand gespeichert, sondern die ganze Historie der Mutationen ([Mutation]).

Gegeben sind folgende Kontos:

> a2 = Account "KROENI-CAYMAN" [Deposit 20000]
> a3 = Account "KROENI-CAYMAN" [Withdraw 500,Deposit 20000]

Definieren Sie die Funktion balance, die den aktuellen Kontostand zurückgibt. Ein neu
erstelltes Konto hat den Kontostand 0. Sie müssen entweder foldl oder foldr zur Implementierung
verwenden.
Hinweis: Das erste Argument für die fold Funktion muss nicht zwingend als Lambdausdruck
geschrieben werden sondern kann auch separat deklariert werden.

> balance :: Account -> Int
> balance (Account _ ms) = foldr bal 0 ms
>                      where bal :: Mutation -> Int -> Int
>                            bal (Deposit d) saldo = saldo + d
>                            bal (Withdraw w) saldo = saldo - w

> test_balance1 = balance a2 == 20000
> test_balance2 = balance a3 == 19500


4) Messwerte aufbereiten

Gesucht ist die Funktion cleanData, die von ihrem Argument vom Typ [Double]
  - die negativen Werte entfernt
  - alle übrigen Werte mit der Funktion round rundet (round :: Double -> Int)

Implementieren Sie die Funktion cleanData mit foldr:

> cleanData :: [Double] -> [Int]
> cleanData ds = foldr (\r rs -> (round r) : rs) [] (foldr reduce [] ds)
>                where reduce :: Double -> [Double] -> [Double]
>                      reduce d ds = if d >= 0.0 then d : ds else ds

> test_cleanData = cleanData [2.71, -3.57, 4.18, -1.01] == [3, 4]

test_cleanData = cleanData [2.71, -3.57, 4.18, -1.01] == [3, 4]



5) Finanzströme

Gesucht ist die Funktion processMoney. Die Funktion processMoney:
  - entfernt alle Tuples mit der Currency EUR
  - rundet die Beträge mit der Funktion round (round :: Double -> Int) auf den nächsten Int Wert


> data Currency = EUR | CHF deriving Eq

> processMoney :: [(Double,Currency)] -> [Int]
> processMoney = foldr chf []
>               where chf :: (Double, Currency) -> [Int] -> [Int]
>                     chf (_, EUR) cs = cs
>                     chf (c, CHF) cs = (round c) : cs

> test_processMoney = processMoney [(100.1,CHF), (-150.2,CHF), (12.9,EUR), (35.8,CHF)] == [100,-150,36]
