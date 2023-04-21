let List/filter = https://prelude.dhall-lang.org/v15.0.0/List/filter

let Person = { name : Text, age : Natural, admin : Bool }

let alice : Person =
      { name = "Alice"
      , age = 24
      , admin = True
      }

let bob : Person =
      { name = "Bob"
      , age = 49
      , admin = True
      }

let carlo : Person =
      { name = "Carlo"
      , age = 20
      , admin = False
      }

let isAdmin = \(person : Person) -> person.admin


in  List/filter Person isAdmin [ alice, bob, carlo ]



-- type Nat = Zero | Succ Nat

-- Zero
-- Succ Zero
-- Succ (Succ Zero)

-- toInteger : Nat -> Int
-- toInteger Zero = 0
-- toInteger (Succ n) = 1 + toInteger n