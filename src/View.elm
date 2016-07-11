module View exposing (..)

import Html exposing (..)
import Types exposing (..)
import Html.Attributes exposing (..)


root : Model -> Html Msg
root model =
  div [] [
      h1 [style [("font-style", "italic")]] [text "News!"],
      case model.news of
        Succeeded news ->
          ul [] (List.map newsItem news)
        Loading ->
          text "Loading"
        Failed error ->
          div [] [code [] [text (toString error)]]
    ]


newsItem : News -> Html Msg
newsItem news =
  li []
    [ h3 [] [ text (Debug.log "Showing" news.headline) ] ]
