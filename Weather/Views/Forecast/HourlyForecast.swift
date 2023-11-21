//
//  HourlyForecast.swift
//  Weather
//
//  Created by Ron Lemire on 4/1/22.
//

import SwiftUI

struct HourlyForecast: View {
    @EnvironmentObject var sharedWeather: SharedWeather
    var hour: Current
    
    var body: some View {
        // Link to HourView
        NavigationLink(destination: HourView(hour: hour)) {
            VStack {
                Text("\(formatWeatherDate(seconds: Double(hour.dt), format: "EEE")) >")
                Text(String("\(formatWeatherDate(seconds: Double(hour.dt), format: "h a"))"))
                
            }
            .foregroundColor(.white)
        }

        // Icon
        Image(systemName:"\(weatherCondition(hour.weather[0].id))")
        
        // Temp
        Text(String(format: "%.0f°", hour.temp))
        
        // Feels
        VStack {
            Text("Feels")
            Text("\(String(format: "%.0f°", hour.feelsLike))")
        }
        
        // POP
        Text("💧\(String(format: "%.0f", (hour.pop ?? 0.00) * 100))%")
    }
}

struct HourlyForecast_Previews: PreviewProvider {
    static var previews: some View {
        let weather = [Weather]()

        HourView(hour: Current(dt: 1648517099, sunrise: 1648476368, sunset: 1648521435, temp: 54.73, feelsLike: 53.82, pressure: 1010, humidity: 83, dewPoint: 49.68, uvi: 0, clouds: 0, visibility: 9656, windSpeed: 17.27, windDeg: 330, weather: weather, windGust: 27.63, pop: 0.27))
            .environmentObject(SharedWeather())
    }
}
