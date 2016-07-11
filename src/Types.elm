module Types exposing (..)

import Http

type FetchedData a
  = Loading
  | Failed Http.Error
  | Succeeded a

type alias Model =
  {news: FetchedData (List News)}

type Msg =
  GetNewsResponse (FetchedData (List News))

type alias News = {
  headline: String
}
