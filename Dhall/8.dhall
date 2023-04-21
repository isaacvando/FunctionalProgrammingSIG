let awsAccount 
= \(id : Text) -> \(name : Text) -> \(birthday : Text) ->
    {
        id = id,
        name = name,
        region = "us-west-2",
        creditCardNumber = "12312312312313",
        birthday = birthday
    }



let age : Natural = 9

in awsAccount "18237640091827" "production" "foo"