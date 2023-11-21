//
//  TodayDetails.swift
//  Weather
//
//  Created by Ron Lemire on 4/1/22.
//

import SwiftUI

struct TodayDetails: View {
    @EnvironmentObject var sharedWeather: SharedWeather
    var current: Current
    var day: Daily
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Today's Details")
                    .font(.title3)
                    .bold()
                
                TodaySunMoon(current: current, day: day)
                
                List {
                    TodayGroups(current: current, day: day)
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("Day")
                .navigationBarHidden(true)
                .font(.subheadline)
            }

        }
        
    }
}

struct TodayDetails_Previews: PreviewProvider {
    static let weather = [Weather]()
    static let temp = Temp(day: 53.82, min: 51.26, max: 54.73, night: 51.42, eve: 54.73, morn: 51.6)
    static let feelslike = FeelsLike(day: 53.22, night: 50.63, eve: 53.82, morn: 51.03)
    
    static var previews: some View {
        TodayDetails(current: Current(dt: 1648497600, sunrise: 1648476368, sunset: 1648521435, temp: 53.82, feelsLike: 53.22, pressure: 1009, humidity: 92, dewPoint: 50.47, uvi: 4.44, clouds: 99, visibility: 8047, windSpeed: 12.5, windDeg: 326, weather: weather, windGust: 18.28, pop: 0.99), day: Daily(dt: 1648497600, sunrise: 1648476368, sunset: 1648521435, moonrise: 1648471620, moonset: 1648507740, moonPhase: 0.88, temp: temp, feelsLike: feelslike, pressure: 1009, humidity: 92, dewPoint: 50.47, windSpeed: 12.5, windDeg: 326, windGust: 18.28, weather: weather, clouds: 99, pop: 0.99, uvi: 4.44))
    }
}
