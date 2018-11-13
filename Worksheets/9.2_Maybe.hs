safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (a:xs) = Just a


safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (a:xs) = Just xs


safeMax :: (Ord a) => [a] -> Maybe a
safeMax [] = Nothing
safeMax xs =  Just (maximum xs)
