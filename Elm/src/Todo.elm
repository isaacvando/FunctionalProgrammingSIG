module Todo exposing (main)

import Browser
import Html exposing (Html, button, div, h1, input, li, text, ul)
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (onClick, onInput)
import List exposing (filter, map)


main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }


type alias Model =
    { todos : List String
    , currentInput : String
    }


type Msg
    = TypedText String
    | Submit
    | Delete String


init : Model
init =
    { currentInput = "", todos = [] }


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Awesome Todo List" ]
        , ul [] (map viewTodo model.todos)
        , input [ placeholder "enter todo text here", value model.currentInput, onInput TypedText ] []
        , button [ onClick Submit ] [ text "submit" ]
        ]


viewTodo : String -> Html Msg
viewTodo todo =
    li []
        [ text todo
        , button [ onClick (Delete todo) ] [ text "delete" ]
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        TypedText text ->
            { model | currentInput = text }

        Submit ->
            { currentInput = "", todos = model.currentInput :: model.todos }

        Delete text ->
            { model | todos = filter ((/=) text) model.todos }
