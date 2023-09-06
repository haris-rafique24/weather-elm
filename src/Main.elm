module Main exposing (..)

import Browser
import Html exposing (Html, div, text, button)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

-- Model
type alias Model =
    { temperature : String
    , location : String
    }

initialModel : Model
initialModel =
    { temperature = ""
    , location = ""
    }

-- Msg (update messages)
type Msg
    = FetchWeather
    | WeatherFetched String

-- Update
update : Msg -> Model -> Model
update msg model =
    case msg of
        FetchWeather ->
            -- Simulate fetching weather data (replace with actual API call)
            { model | temperature = "72°F", location = "Elmville" }

        WeatherFetched weather ->
            -- Update model with fetched weather data
            { model | temperature = weather }


-- View
view : Model -> Html Msg
view model =
    div [ class "weather-app" ]
        [ div [] [ text <| "Location: " ++ model.location ]
        , div [] [ text <| "Temperature: " ++ model.temperature ]
        , button [ class "fetch-button", onClick FetchWeather ] [ text "Fetch Weather" ]
        ]

main =
    Browser.sandbox { init = initialModel, update = update, view = view }
