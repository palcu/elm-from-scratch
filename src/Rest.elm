module Rest exposing (..)

import Json.Decode exposing (..)
import Types exposing (..)
import Http
import Task


decodeNewsItem : Decoder News
decodeNewsItem =
  object1 News
    ("title" := string)

decodeNews : Decoder (List News)
decodeNews =
  "hits" := (list decodeNewsItem)

endpoint : String
endpoint = "https://hn.algolia.com/api/v1/search_by_date?tags=story&hitsPerPage=50"

getNews : Cmd Msg
getNews =
  Http.get decodeNews endpoint
    |> Task.perform Result.Err Result.Ok
    |> Cmd.map GetNewsResponse
