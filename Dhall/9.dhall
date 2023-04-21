-- let myRecordType = { address : Text, age : Natural}

-- let extract = \(x : myRecordType) ->
--     x.address

-- in extract { address = "1 university park drive", age = 100}


let myType = Text 

let func = \(x : myType) -> x

in func "foo"