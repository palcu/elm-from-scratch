module State exposing (..)

import Types exposing (..)
import Rest exposing (..)


init : ( Model, Cmd Msg )
init = ({news = Loading},
        getNews)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case (Debug.log "Got message" msg) of
    GetNewsResponse response ->
      ( { model | news = response }, Cmd.none )

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
