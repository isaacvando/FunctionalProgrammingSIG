module Anagram (anagramsFor) where
import Data.List
import Data.Char

anagramsFor :: String -> [String] -> [String]
anagramsFor w wList = [a | a <- wList, let a' = map toLower a, let w' = map toLower w, a' /= w', sort a' == sort w']
    