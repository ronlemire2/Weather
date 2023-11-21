//
//  DaySunMoon.swift
//  Weather
//
//  Created by Ron Lemire on 4/2/22.
//

import SwiftUI

struct DaySunMoon: View {
    var day: Daily
    
    var body: some View {
        HStack {
            VStack {
                Text("🌞").font(.system(size:25))
                Divider().background(.white)
                HStack {
                    Text("Rise")
                    Spacer()
                    
                    Text("\(formatWeatherDate(seconds: Double(day.sunrise), format: "h.m a"))")
                }
                Divider().background(.white)
                HStack {
                    Text("Set")
                    Spacer()
                    Text("\(formatWeatherDate(seconds: Double(day.sunset), format: "h.m a"))")
                }
            }
            .frame(width: 175, height: 200)
            .padding(.trailing)
            
            Divider().frame(height: 90).background(.white)
            
            VStack {
                Text("🌜").font(.system(size:25))
                Divider().background(.white)
                HStack {
                    Text("Rise")
                    Spacer()
                    Text("\(formatWeatherDate(seconds: Double(day.moonrise), format: "h.m a"))")
                }
                Divider().background(.white)
                HStack {
                    Text("Set")
                    Spacer()
                    Text("\(formatWeatherDate(seconds: Double(day.moonset), format: "h.m a"))")
                }
            }
            .frame(width: 175, height: 200)
            .padding(.leading)
        }
    }
}

struct DaySunMoon_Previews: PreviewProvider {
    static var previews: some View {
        let weather = [Weather]()
        let temp = Temp(day: 53.82, min: 51.26, max: 54.73, night: 51.42, eve: 54.73, morn: 51.6)
        let feelslike = FeelsLike(day: 53.22, night: 50.63, eve: 53.82, morn: 51.03)
        
        // rjl  rain: 13.16
        DaySunMoon(day:Daily(dt: 1648497600, sunrise: 1648476368, sunset: 1648521435, moonrise: 1648471620, moonset: 1648507740, moonPhase: 0.88, temp: temp, feelsLike: feelslike, pressure: 1009, humidity: 92, dewPoint: 50.47, windSpeed: 12.5, windDeg: 326, windGust: 18.28, weather: weather, clouds: 99, pop: 0.99, uvi: 4.44))
    }
}
