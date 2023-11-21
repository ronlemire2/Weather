//
//  DayGroups.swift
//  Weather
//
//  Created by Ron Lemire on 4/2/22.
//

import SwiftUI

struct DayGroups: View {
    var day: Daily
    
    var body: some View {
        List {
            Group {
                HStack {
                    Spacer()
                    Text("Conditions")
                        .font(.headline)
                    Spacer()
                }
                DetailRow(name: "Id", value: "\(day.weather[0].id)")
                DetailRow(name: "Main", value: "\(day.weather[0].main)")
                DetailRow(name: "Description", value: "\(day.weather[0].weatherDescription)".capitalized)
                HStack {
                    Text("Icon")
                    Spacer()
                    Image(systemName:"\(weatherCondition(day.weather[0].id))")
                }
            }
            Group {
                HStack {
                    Spacer()
                    Text("Temperatures")
                        .font(.headline)
                    Spacer()
                }
                DetailRow(name: "Temp", value: String(format: "%.0f°",day.temp.day))
                DetailRow(name: "Max", value: String(format: "%.0f°",day.temp.max))
                DetailRow(name: "Min", value: String(format: "%.0f°",day.temp.min))
                DetailRow(name: "Night", value: String(format: "%.0f°",day.temp.night))
                DetailRow(name: "Evening", value: String(format: "%.0f°",day.temp.eve))
                DetailRow(name: "Morning", value: String(format: "%.0f°",day.temp.morn))
            }
            Group {
                HStack {
                    Spacer()
                    Text("Humidity & Pressure")
                        .font(.headline)
                    Spacer()
                }
                DetailRow(name: "Humidity", value: "\(day.humidity)％")
                DetailRow(name: "Pressure", value: "\(day.pressure) hPa")
                DetailRow(name: "DewPoint", value: String(format: "%.0f°",day.dewPoint))
            }
            Group {
                HStack {
                    Spacer()
                    Text("Wind")
                        .font(.headline)
                    Spacer()
                }
                DetailRow(name: "Speed", value: String(format: "%.0f mph",day.windSpeed))
                DetailRow(name: "Direction", value: "\(convertDegreesToDirection(winDeg: day.windDeg))")
                DetailRow(name: "Gust", value: String(format: "%.0f mph",day.windGust))
                
            }
        }
    }
}

struct DayGroups_Previews: PreviewProvider {
    static var previews: some View {
        let weather = [Weather]()
        let temp = Temp(day: 53.82, min: 51.26, max: 54.73, night: 51.42, eve: 54.73, morn: 51.6)
        let feelslike = FeelsLike(day: 53.22, night: 50.63, eve: 53.82, morn: 51.03)
        
        // rjl  rain: 13.16
        DayGroups(day:Daily(dt: 1648497600, sunrise: 1648476368, sunset: 1648521435, moonrise: 1648471620, moonset: 1648507740, moonPhase: 0.88, temp: temp, feelsLike: feelslike, pressure: 1009, humidity: 92, dewPoint: 50.47, windSpeed: 12.5, windDeg: 326, windGust: 18.28, weather: weather, clouds: 99, pop: 0.99, uvi: 4.44))
    }
}
