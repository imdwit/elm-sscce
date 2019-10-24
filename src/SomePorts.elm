port module SomePorts exposing (..)

import Json.Decode as Decode exposing (Value)


port teamsOut : () -> Cmd msg


port teamsIn : (Value -> msg) -> Sub msg


type TeamsInBound
    = GotString String
    | PortFailure ()


teamsInbound _ =
    teamsIn <|
        \value -> Decode.decodeValue Decode.string value
