//
//  WeatherOneCall.swift
//  Weather
//
//  Created by Ron Lemire on 3/22/22.
//
// OneCall EndPoint:
// https://api.openweathermap.org/data/2.5/onecall?lat=<lat here>&lon=-<lon here>&appid=<API key>&units=imperial
//
/* Missing Fields
 main
     main.sea_level Atmospheric pressure on the sea level, hPa
     main.grnd_level Atmospheric pressure on the ground level, hPa
 wind
    wind.gust Wind gust. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour
 rain
     rain.1h Rain volume for the last 1 hour, mm
     rain.3h Rain volume for the last 3 hours, mm
 snow
     snow.1h Snow volume for the last 1 hour, mm
     snow.3h Snow volume for the last 3 hours, mm
 sys
    sys.message Internal parameter
 */

import Foundation

// MARK: - WeatherOneCall
struct WeatherOneCall: Codable {
    let lat, lon: Double
    let timezone: String
    let timezoneOffset: Int
    let current: Current
    let hourly: [Current]
    let daily: [Daily]
    let alerts: [Alert]?

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, hourly, daily, alerts
    }
}

// MARK: - Alert
struct Alert: Codable, Identifiable {
    let id = UUID()
    let senderName, event: String
    let start, end: Int
    let alertDescription: String

    enum CodingKeys: String, CodingKey {
        case senderName = "sender_name"
        case event, start, end
        case alertDescription = "description"
    }
}

// MARK: - Current
struct Current: Codable, Identifiable {
    let id = UUID()
    let dt: Int
    let sunrise, sunset: Int?
    let temp, feelsLike: Double
    let pressure, humidity: Int
    let dewPoint, uvi: Double
    let clouds, visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let weather: [Weather]
    let windGust, pop: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
        case windGust = "wind_gust"
        case pop
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Daily
struct Daily: Codable, Identifiable {
    let id = UUID()
    let dt, sunrise, sunset, moonrise: Int
    let moonset: Int
    let moonPhase: Double
    let temp: Temp
    let feelsLike: FeelsLike
    let pressure, humidity: Int
    let dewPoint, windSpeed: Double
    let windDeg: Int
    let windGust: Double
    let weather: [Weather]
    let clouds: Int
    let pop, uvi: Double

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, clouds, pop, uvi
    }
}

// MARK: - FeelsLike
struct FeelsLike: Codable {
    let day, night, eve, morn: Double
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}


/*
 ,
 "alerts": [
   {
     "sender_name": "NWS Eureka (Northwest California Coast)",
     "event": "Small Craft Advisory",
     "start": 1648892340,
     "end": 1648969200,
     "description": "...SMALL CRAFT ADVISORY NOW IN EFFECT UNTIL MIDNIGHT PDT\nTONIGHT...\n* WHAT...North winds 15 to 25 kt with gusts up to 30 kt and seas 7\nto 11 feet.\n* WHERE...Pt St George to Cape Mendocino out 10 nm.\n* WHEN...Until midnight PDT tonight.\n* IMPACTS...Conditions will be hazardous to small crafts.",
     "tags": []
   }
 ]
 */


#if DEBUG
//static let example = HourlyRow(hour: 1648504800, icon: "03d", temp: 56.64, feelsLike: 56.1, pop: 0.51)
#endif
