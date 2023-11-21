//
//  DayView.swift
//  Weather
//
//  Created by Ron Lemire on 3/28/22.
//

import SwiftUI

struct DayView: View {
    @EnvironmentObject var sharedWeather: SharedWeather
    var day: Daily
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(formatWeatherDate(seconds: Double(day.dt), format: "EEE  MMM d, yyyy 'at'  h:mm:ss a"))")
                    .font(.title3)
                DaySunMoon(day: day)
                DayGroups(day: day)
            }
            .navigationTitle("Day")
            .navigationBarHidden(true)
            .font(.subheadline)
            .listStyle(GroupedListStyle())
        }
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        let weather = [Weather]()
        let temp = Temp(day: 53.82, min: 51.26, max: 54.73, night: 51.42, eve: 54.73, morn: 51.6)
        let feelslike = FeelsLike(day: 53.22, night: 50.63, eve: 53.82, morn: 51.03)
        
        // rjl  rain: 13.16
        DayView(day:Daily(dt: 1648497600, sunrise: 1648476368, sunset: 1648521435, moonrise: 1648471620, moonset: 1648507740, moonPhase: 0.88, temp: temp, feelsLike: feelslike, pressure: 1009, humidity: 92, dewPoint: 50.47, windSpeed: 12.5, windDeg: 326, windGust: 18.28, weather: weather, clouds: 99, pop: 0.99, uvi: 4.44))
    }
}
