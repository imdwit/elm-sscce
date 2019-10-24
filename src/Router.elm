module Router exposing (..)

import SomePorts
import Url exposing (Url)
import Url.Parser as Parser exposing (..)
import Url.Parser.Query as Q


type alias Model =
    { routeState : RouteState }


type Route
    = HomeRoute
    | TeamsRoute


type RouteState
    = Home
    | Teams


parseLocation : Url -> Route
parseLocation location =
    let
        parsed =
            Parser.parse matchers location
    in
    case parsed of
        Just route ->
            route

        Nothing ->
            HomeRoute


matchers =
    oneOf
        [ map HomeRoute top
        , map TeamsRoute (s "teams")
        ]


setRoute location =
    case parseLocation location of
        TeamsRoute ->
            ( Teams, SomePorts.teamsOut () )

        HomeRoute ->
            ( Home, Cmd.none )
