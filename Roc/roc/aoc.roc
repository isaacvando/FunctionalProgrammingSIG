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

main : Task {} []
main =
    task =
        contents <- File.readUtf8 (Path.fromStr "aoc.txt") |> Task.await
        lines = Str.split contents "\n"

        Stdout.line (List.first lines |> Result.withDefault "err")

    Task.attempt task (\_ -> Process.exit 0)
