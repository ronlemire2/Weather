//
//  DailyForecast.swift
//  Weather
//
//  Created by Ron Lemire on 4/1/22.
//

import SwiftUI

struct DailyForecast: View {
    @EnvironmentObject var sharedWeather: SharedWeather
    var day: Daily
    
    var body: some View {
        // Link to DayView
        NavigationLink(destination: DayView(day: day)) {
            VStack {
                Text("\(formatWeatherDate(seconds: Double(day.dt), format: "EEE")) >")
                Text("\(formatWeatherDate(seconds: Double(day.dt), format: "d"))")
            }
            .foregroundColor(.white)
        }
        
        // Icon
        Image(systemName:"\(weatherCondition(day.weather[0].id))")
        
        // Max
        VStack {
            Text("Max")
            Text(String(format: "%.0f°", day.temp.max))
        }
        
        // Min
        VStack {
            Text("Min")
            Text(String(format: "%.0f°", day.temp.min))
        }
        
        // POP
        Text("💧 \(String(format: "%.0f", day.pop * 100)) %")
    }
}

struct DailyForecast_Previews: PreviewProvider {
    static var previews: some View {
        let weather = [Weather]()
        let temp = Temp(day: 53.82, min: 51.26, max: 54.73, night: 51.42, eve: 54.73, morn: 51.6)
        let feelslike = FeelsLike(day: 53.22, night: 50.63, eve: 53.82, morn: 51.03)
        
        // rjl  rain: 13.16
        DayView(day:Daily(dt: 1648497600, sunrise: 1648476368, sunset: 1648521435, moonrise: 1648471620, moonset: 1648507740, moonPhase: 0.88, temp: temp, feelsLike: feelslike, pressure: 1009, humidity: 92, dewPoint: 50.47, windSpeed: 12.5, windDeg: 326, windGust: 18.28, weather: weather, clouds: 99, pop: 0.99, uvi: 4.44))
    }
}
