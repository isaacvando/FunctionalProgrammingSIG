import Data.Char

-- Functions
-- immutable, no keywords needed, independent objects, referential transparency

myNum :: Double
myNum = 10.98

myString :: String
myString = "paytient"

foo :: String -> Int
foo s = length s

bar :: String -> String -> Int
bar s t = length s + length t

-- Currying

-- curried :: Char -> (String -> Bool)
curried :: Char -> String -> Bool
curried ch st = elem ch st

uncurried :: (Char, String) -> Bool
uncurried (ch, st) = elem ch st

makePoint :: Int -> Int -> Int -> (Int,Int,Int)
makePoint x y z = (x,y,z)

-- show :t with partial applications
-- show that makePoint 1 2 3 = ((makePoint 1) 2) 3


-- Higher Order functions

-- show type of map

rev :: [String] -> [String]
rev xs = map reverse xs

combine :: String -> String
combine x y = x ++ y
