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

duplicate :: a -> [a]
duplicate x = [x,x]




-- Currying

-- combine :: String -> (String -> String)
combine :: String -> String -> String
combine s t = s ++ t

prependFoo :: String -> String
prependFoo = combine "foo"

makePoint :: Int -> Int -> Int -> (Int,Int,Int)
makePoint x y z = (x,y,z)

-- show :t with partial applications
-- show that makePoint 1 2 3 = ((makePoint 1) 2) 3

combineUncurried :: (String, String) -> String
combineUncurried twoStrings = fst twoStrings ++ snd twoStrings


-- Higher Order functions

-- show type of map

-- map prependFoo ["bar","baz","bop"]

-- map (makePoint 1 2) [1..10]

-- map (\x -> makePoint 1 2 x) [1..10]

-- Ask what this will be; show the type of this
mystery = map (makePoint 1) [1..10]

-- map (\f -> f 1000) mystery

-- filter isUpper ['f', 'F']




-- Pattern Matching, Recursion, Laziness
-- :t (:)
-- [1,2,3,4] == 1:2:3:4:[]
-- "hi" == 'h':'i':[]

-- map toUpper "hello world"

-- there are no loops

map' :: (a -> b) -> [a] -> [b]
map' f [] = []
map' f (x:xs) = f x : map' f xs

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n -1)

-- head (map (+1) [1..999999999999999])

-- [1..]
ones = 1 : ones
fibs = 1 : 1 : zipWith (+) fibs (tail fibs)



-- Algebraic Data Types

data PizzaTopping = Pepperoni | Cheese | Pineapple

isGood :: PizzaTopping -> Bool
isGood Pepperoni = True
isGood Cheese = True
isGood Pineapple = False



data Person = Adult String String | Child String
