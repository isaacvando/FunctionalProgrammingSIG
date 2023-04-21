-- "polymorphic" function


let triplicate = \(t : Type) -> \(v : t) -> [v,v,v]

let bar = "foo"

in
{
    one = triplicate Text "foo"
    , two = triplicate Natural 8
}

-- show hash

-- asserts?