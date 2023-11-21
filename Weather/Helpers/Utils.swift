//
//  Utils.swift
//  Weather
//
//  Created by Ron Lemire on 3/31/22.
//

import Foundation


func weatherCondition(_ conditionId: Int) -> String {
    switch conditionId {
    case 200...232:
        return "cloud.bolt"
    case 300...321:
        return "cloud.drizzle"
    case 500...531:
        return "cloud.rain.fill"
    case 600...622:
        return "cloud.snow"
    case 701...781:
        return "cloud.fog"
    case 800:
        return "sun.max"
    case 801...804:
        return "cloud.fill"
    default:
        return "cloud.fill"
    }
}


func formatWeatherDate(seconds: Double, format: String) -> String {
    var date = Date.now
    var formattedDate = ""
    
    if seconds > 0.00 {
        date = Date(timeIntervalSince1970: seconds)
    }
    
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en-US")
    formatter.amSymbol = "AM"
    formatter.pmSymbol = "PM"
    formatter.dateFormat = format
    
    formattedDate = formatter.string(from: date)
    
    return formattedDate
}


// https://www7.ncdc.noaa.gov/climvis/help_wind.html
// http://snowfence.umn.edu/Components/winddirectionanddegrees.htm
func convertDegreesToDirection(winDeg: Int) -> String {
    let direction: String
    
    switch winDeg {
    case 0...11:
        direction = "N"
    case 12...33:
        direction = "NNE"
    case 34...56:
        direction = "NE"
    case 57...78:
        direction = "ENE"
    case 79...101:
        direction = "E"
    case 102...123:
        direction = "ESE"
    case 124...146:
        direction = "SE"
    case 147...168:
        direction = "SSE"
    case 169...191:
        direction = "S"
    case 192...213:
        direction = "SSW"
    case 214...236:
        direction = "SW"
    case 237...258:
        direction = "WSW"
    case 259...281:
        direction = "W"
    case 282...303:
        direction = "WNW"
    case 304...326:
        direction = "NW"
    case 327...348:
        direction = "NNW"
    case 349...360:
        direction = "NW"
    default:
        direction = "?"
    }
    
    return direction
}
