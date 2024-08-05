module Main exposing (main)


import Html
type A = B | C

x = B

main =
    case x of
        B ->
            Html.text "B"
