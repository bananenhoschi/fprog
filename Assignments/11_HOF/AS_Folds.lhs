== Übung 11: Folds ==

> import Data.List (find)

In dieser Übung dreht sich (fast) alles um folds. Folds implementieren mächtige
Rekursionsmuster mit deren Hilfe Sie einige bekannte andere HOFs
implementieren können:

Aufgabe 1: Filter
Implementieren Sie die Funktion filter' mittels foldr:

> filter' :: (a -> Bool) -> [a] -> [a]
> filter' f = foldr (\x xs -> if f x then x : xs else xs) []

> test_filter = filter' (>3) [1..5] == [4,5]

Aufgabe 2: Map
a) Implementieren Sie die Funktion mapr mittels foldr.
Sie dürfen nur Lambda Ausdrücke, (:) und foldr verwenden:

> mapr :: (a -> b) -> [a] -> [b]
> mapr f = foldr (\x xs -> (f x) : xs) []

> test_mapr = mapr (^2) [1..3] == [1,4,9]

b) Implementieren Sie die Funktion mapl mittels foldl.
Sie dürfen nur Lambda Ausdrücke, (++) und foldl verwenden:

> mapl :: (a -> b) -> [a] -> [b]
> mapl f = foldl (\bs a -> bs ++ [(f a)]) []

> test_mapl = mapl (^2) [1..3] == [1,4,9]

Aufgabe 3: Length
Implementieren Sie die Funktion lenght' mittels foldr:

> length' :: [a] -> Int
> length' =  foldr (\x cnt -> cnt+1) 0

> test_length = length' "abcde" == 5

Aufgabe 4: Concat
Implementieren Sie die Funktion concat' mittels foldr:

> concat' :: [[a]] -> [a]
> concat' = foldr (\c s -> c ++ s) []

> test_concat1 = concat' [['a'],['b'],['c']] == "abc"
> test_concat2 = concat' [[1],[2],[3]] == [1,2,3]

Aufgabe 5:
Die Funktion find kann verwendet werden um in einer Liste
nach einem Element zu suchen, das ein Kriterium erfüllt.

*> :t find
find :: (a -> Bool) -> [a] -> Maybe a

Find nimmt eine Liste von a und eine Funktion mit der ein Listen-
element gesucht werden kann.
Das Resultat ist vom Typ Maybe a weil ja möglicherweise kein
Resultat gefunden werden kann:

find even [1,2,3] ~> Just 2
find even [1,3,5] ~> Nothing

Wenn Sie find verwenden müssen Sie also damit rechnen, dass kein
Treffer gefunden werden kann. Deshalb müssen Sie auf dem Resultat
immer eine Fallunterscheidung machen:

> data Student = Student { email :: String, matrikelNr :: Int }

> findMatrikelByEmail :: [Student] -> String -> Maybe Int
> findMatrikelByEmail students emailAddr =
>   case find (\s -> email s == emailAddr) students of
>      Nothing -> Nothing
>      Just s  -> Just (matrikelNr s)

Dem soll nun Abhilfe geschaffen werden! Implementieren Sie die map
Funktion für den Maybe Datentyp.

Hier ist die Signatur:

> mMap :: (a -> b) -> Maybe a -> Maybe b
> mMap f a = case a of
>          Nothing -> Nothing
>          Just a -> Just (f a)

Mit Ihrer Definition sollte dann die findMatrikelByEmail so
implementiert werden können:

> findMatrikelByEmail' :: [Student] -> String -> Maybe Int
> findMatrikelByEmail' students emailAddr = mMap matrikelNr (find (\s -> email s == emailAddr) students)

> s1 = Student "s1@fhnw.ch" 1
> s2 = Student "s2@fhnw.ch" 2

> students = [s1,s2]

> test_findMatrikel = findMatrikelByEmail' students "s1@fhnw.ch"
