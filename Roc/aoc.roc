# Advent of Code 2022 Day 4: https://adventofcode.com/2022/day/4


app "aoc"
    packages { pf: "https://github.com/roc-lang/basic-cli/releases/download/0.3.2/tE4xS_zLdmmxmHwHih9kHWQ7fsXtJr7W7h3425-eZFk.tar.br" }
    imports [
        pf.Stdout,
        pf.Process,
        pf.Task.{ Task },
        pf.File,
        pf.Path,
    ]
    provides [main] to pf

main =
    task =
        path = Path.fromStr "aoc.txt"
        File.readUtf8 path 
            |> Task.await \contents -> 
                solve contents 
                    |> Stdout.line


    Task.attempt task (\_ -> Process.exit 0)



solve : Str -> Str
solve = \input -> 
    pairs = parse input

    contains = \(a,b), (c,d) -> a <= c && b >= d

    distinct = List.keepIf pairs \(x,y) ->
        contains x y || contains y x

    List.len distinct |> Num.toStr 


parse : Str -> List ((Nat, Nat), (Nat, Nat))
parse = \input ->
    lines = Str.split input "\n"

    break = \line -> Str.split line ","
        |> List.map (\piece -> Str.split piece "-")

    tn = \n -> Str.toNat n |> Result.withDefault 10000000

    makeTuples = \chunk -> 
        when chunk is
            [[a,b], [c,d]] -> ((tn a, tn b), (tn c, tn d))
            _ -> crash "This should not happen"

    List.map lines (\line -> break line |> makeTuples)
