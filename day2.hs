rangeAsStrings :: Int -> Int -> [String]
rangeAsStrings a b = map show [a..b]

chunkString :: String -> Int -> [String]
chunkString [] _ = []
chunkString s cnt = take cnt s : (chunkString (drop cnt s) cnt)

allSame :: Eq a => [a] -> Bool
allSame [] = False
allSame (x:xs) = all (==x) xs

candidateChunks :: String -> [[String]]
candidateChunks s = [chunkString s cnt | cnt <- groupLengths (length s)]

stringHasRepeats :: String -> Bool
stringHasRepeats s = or (map allSame (candidateChunks s))

groupLengths :: Int -> [Int]
groupLengths x = [v | v <- [(x `quot` 2)], x `mod` 2 == 0]

intHasRepeats :: Int -> Bool
intHasRepeats = stringHasRepeats . show

filterSillyPatterns :: [Int] -> [Int]
filterSillyPatterns = filter intHasRepeats

addSillyPatterns :: [[Int]] -> Int
addSillyPatterns = sum . concat . map filterSillyPatterns
