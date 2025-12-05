import Text.Read

directionToSign :: Char -> Int
directionToSign 'L' = -1
directionToSign 'R' = 1

toClicks :: String -> Int
toClicks (d:v) = (directionToSign d) * (read v :: Int)

advanceDial = scanl (+) 50
correctDial = (flip mod 100)

findZeros :: [Int] -> Int
findZeros = length . filter (==0)

day1_part1 = do
  input_data <- lines <$> readFile "day1_input.txt"
  let rawDialData = advanceDial (map toClicks input_data)
  let correctedDialData = map correctDial rawDialData
  let zeros = findZeros correctedDialData
  return zeros

rotateDial :: Int -> Int -> Int
rotateDial a b = (a + b) `mod` 100

day1_part1' = do
  input_data <- lines <$> readFile "day1_input.txt"
  let dialData = scanl rotateDial 50 (map toClicks input_data)
  let zeros = findZeros dialData
  return zeros

zeroCrossing :: (Int,Int) -> Int
zeroCrossing (current, clicks)
  | current == 0, clicks < 0 = (clicks * (-1)) `quot` 100
  | clicks < 0               = ((100 - current) + (clicks * (-1))) `quot` 100
  | otherwise                = (current + clicks) `quot` 100

day1_part2 = do
  input_data <- lines <$> readFile "day1_input.txt"
  let clickData = map toClicks input_data
  let dialData = scanl rotateDial 50 clickData

  let crossings = map zeroCrossing (zip dialData clickData)
  let zeros = foldl1 (+) crossings
  return zeros

zeroCrossing' :: Int -> Int -> Int
zeroCrossing' current clicks
  | current == 0, clicks < 0 = (clicks * (-1)) `quot` 100
  | clicks < 0               = ((100 - current) + (clicks * (-1))) `quot` 100
  | otherwise                = (current + clicks) `quot` 100

day1_part2' = do
  input_data <- lines <$> readFile "day1_input.txt"
  let clickData = map toClicks input_data
  let dialData = scanl rotateDial 50 clickData

  let crossings = zipWith ($) (map zeroCrossing' dialData) clickData
  let zeros = foldl1 (+) crossings
  return zeros

day1_part2'' = do
  input_data <- lines <$> readFile "day1_input.txt"
  let clickData = map toClicks input_data
  let dialData = scanl rotateDial 50 clickData

  let crossings = zipWith zeroCrossing' dialData clickData
  let zeros = foldl1 (+) crossings
  return zeros
