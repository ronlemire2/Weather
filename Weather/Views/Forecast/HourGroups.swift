//
//  HourGroups.swift
//  Weather
//
//  Created by Ron Lemire on 4/2/22.
//

import SwiftUI

struct HourGroups: View {
    var hour: Current
    
    var body: some View {
        List {
            Group {
                HStack {
                    Spacer()
                    Text("Conditions")
                        .font(.headline)
                    Spacer()
                }
                DetailRow(name: "Id", value: "\(hour.weather[0].id)")
                DetailRow(name: "Main", value: "\(hour.weather[0].main)")
                DetailRow(name: "Description", value: "\(hour.weather[0].weatherDescription)".capitalized)
                DetailRow(name: "Clouds", value: String(hour.clouds)+"%")
                HStack {
                    Text("Icon")
                    Spacer()
                    Image(systemName:"\(weatherCondition(hour.weather[0].id))")
                }
                DetailRow(name: "Visibility", value: "\(hour.visibility)km")
                DetailRow(name: "POP", value: String(format: "%.0f",(hour.pop ?? 0) * 100)+"%")
                DetailRow(name: "Uvi", value: String(format: "%.0f",hour.uvi))
            }
            Group {
                HStack {
                    Spacer()
                    Text("Temperatures")
                        .font(.headline)
                    Spacer()
                }
                DetailRow(name: "Now", value: String(format: "%.0f°",hour.temp))
                DetailRow(name: "FeelsLike", value: String(format: "%.0f°",hour.feelsLike))
            }
            Group {
                HStack {
                    Spacer()
                    Text("Humidity & Pressure")
                        .font(.headline)
                    Spacer()
                }
                DetailRow(name: "Humidity", value: "\(hour.humidity)％")
                DetailRow(name: "Pressure", value: "\(hour.pressure) hPa")
                DetailRow(name: "DewPoint", value: String(format: "%.0f°",hour.dewPoint))
            }
            Group {
                HStack {
                    Spacer()
                    Text("Wind")
                        .font(.headline)
                    Spacer()
                }
                DetailRow(name: "Speed", value: String(format: "%.0f mph",hour.windSpeed))
                DetailRow(name: "Direction", value: "\(convertDegreesToDirection(winDeg: hour.windDeg))")
                DetailRow(name: "Gust", value: String(format: "%.0f mph",hour.windGust ?? 0.00))
            }
        }
    }
}

struct HourGroups_Previews: PreviewProvider {
    static var previews: some View {
        let weather = [Weather]()

        HourGroups(hour: Current(dt: 1648517099, sunrise: 1648476368, sunset: 1648521435, temp: 54.73, feelsLike: 53.82, pressure: 1010, humidity: 83, dewPoint: 49.68, uvi: 0, clouds: 0, visibility: 9656, windSpeed: 17.27, windDeg: 330, weather: weather, windGust: 27.63, pop: 0.27))
            .environmentObject(SharedWeather())
    }
}
