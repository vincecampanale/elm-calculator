module Calculator exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


viewFooter : Html msg
viewFooter =
    footer [] [ text "Made by Vince Campanale" ]


makeButton : String -> Html msg
makeButton label =
    div [ class "calc-btn", id ("btn-" ++ label) ] [ text label ]


calcDisplay : Html msg
calcDisplay =
    div [ class "calc-display" ] []


buttonList : List String -> List (Html msg)
buttonList labels =
    List.map makeButton labels


getBtnAtIdx : Int -> List (Html msg) -> Html msg
getBtnAtIdx n listOfButtons =
    case List.head (List.drop n listOfButtons) of
        Nothing ->
            makeButton "EMPTY"

        Just button ->
            button


makeRowFrom : List (Html msg) -> String -> Html msg
makeRowFrom listOfButtons idString =
    div [ class "row", id idString ]
        [ getBtnAtIdx 0 listOfButtons
        , getBtnAtIdx 1 listOfButtons
        , getBtnAtIdx 2 listOfButtons
        , getBtnAtIdx 3 listOfButtons
        ]


viewCalculator : Html msg
viewCalculator =
    div [ class "wrapper" ]
        [ calcDisplay
        , makeRowFrom (buttonList [ "AC", "+/-", "%", "÷" ]) "btn-row1"
        , makeRowFrom (buttonList [ "7", "8", "9", "x" ]) "btn-row2"
        , makeRowFrom (buttonList [ "4", "5", "6", "-" ]) "btn-row3"
        , makeRowFrom (buttonList [ "1", "2", "3", "+" ]) "btn-row4"
        , makeRowFrom (buttonList [ "0", "blank", ".", "=" ]) "btn-row5"
        ]


view : Html msg
view =
    div [ class "container" ]
        [ viewCalculator ]


main : Html msg
main =
    viewCalculator
