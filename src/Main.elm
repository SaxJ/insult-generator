import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes as At
import Random
import List
import String exposing (join)

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

type alias Model = { insult : String }

view : Model -> Html Msg
view model =
    div []
        [
            div [At.class "outer"] [
                div [At.class "middle"] [
                    div [At.class "inner"] [
                        div [At.id "loading"] [text "Loading..."],
                        button [ onClick Insult ] [ text "Get Fucked" ],
                        div [At.id "insult"] [ text (toString model.insult) ]
                    ]
                ]
            ],
            node "video" [At.id "video"] [
                node "source" [At.src "assets/reaction.mp4"] []
            ]
        ]

type Msg = Insult | NewInsult String

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Insult -> (model, Random.generate NewInsult (Random.map3 createInsult (Random.int 0 10) (Random.int 0 10) (Random.int 0 10)))
        NewInsult insult -> (Model insult, Cmd.none)

listGet : Int -> List String -> String
listGet n ls = Maybe.withDefault "" (List.head (List.drop n ls))

createInsult : Int -> Int -> Int -> String
createInsult a b c = join " " [listGet a adj, listGet b leadNoun, listGet c noun]

init : (Model, Cmd Msg)
init = (Model "", Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions _ = Sub.none

adj : List String
adj = [
        "lazy",
        "stupid",
        "insecure",
        "idotic",
        "slimy",
        "slutty",
        "smelly",
        "pompous",
        "communist",
        "dicknose",
        "pie-eating",
        "racist",
        "elitist",
        "white trash",
        "drug loving",
        "butterface",
        "tone deaf",
        "ugly",
        "creepy"]

leadNoun : List String
leadNoun = [
        "douche",
        "ass",
        "turd",
        "rectum",
        "butt",
        "cock",
        "shit",
        "crotch",
        "bitch",
        "turd",
        "prick",
        "slut",
        "taint",
        "fuck",
        "dick",
        "boner",
        "shart",
        "nut",
        "sphincter"]

noun : List String
noun = [
    "pilot",
    "canoe",
    "captain",
    "pirate",
    "hammer",
    "knob",
    "box",
    "jockey",
    "nazi",
    "waffle",
    "goblin",
    "blossom",
    "biscuit",
    "clown",
    "socket",
    "monster",
    "hound",
    "dragon",
    "balloon"]
