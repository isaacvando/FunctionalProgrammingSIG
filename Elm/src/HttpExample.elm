module HttpExample exposing (..)

import Browser
import Html exposing (..)
import Html.Events exposing (onClick)
import Http


main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    { text : String }


type Msg
    = Noop
    | GetText
    | GotText (Result Http.Error String)


init : () -> ( Model, Cmd Msg )
init _ =
    ( { text = "" }, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "http requests oh yeah" ]
        , button [ onClick GetText ] [ text "get text" ]
        , br [] []
        , text model.text
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Noop ->
            ( model, Cmd.none )

        GetText ->
            ( model
            , Http.get
                { url = "https://isaacvando.com"
                , expect = Http.expectString GotText
                }
            )

        GotText (Err _) ->
            ( { model | text = "uh oh error" }, Cmd.none )

        GotText (Ok text) ->
            ( { model | text = text }, Cmd.none )
