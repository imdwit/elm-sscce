port module SomePorts exposing (..)

import Json.Decode as Decode exposing (Value)


port teamsOut : () -> Cmd msg


port teamsIn : (Value -> msg) -> Sub msg


teamsInbound _ =
    teamsIn <|
        \value -> Debug.log "teamsIn" <| Decode.decodeValue Decode.string value
