module State exposing (..)

import Types exposing (..)
import Rest exposing (..)


init : ( Model, Cmd Msg )
init = ({news = [],
        error = Nothing
        },
        getNews)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case (Debug.log "Got message" msg) of
    GetNewsResponse (Err errorMessage) ->
      ( { model | error =  Just errorMessage }, Cmd.none )
    GetNewsResponse (Ok news) ->
      ( { model | news =  news }, Cmd.none )

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
