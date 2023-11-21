//
//  TodayTemps.swift
//  Weather
//
//  Created by Ron Lemire on 4/2/22.
//

import SwiftUI

struct TodayTemps: View {
    @EnvironmentObject var sharedWeather: SharedWeather
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text("Today")
                    Text(String(format: "%.0f°", sharedWeather.weatherOneCall!.daily[0].temp.max))
                        .font(.system(size: 50))
                        .bold()
                //Text("Feelslike: \(String(format: "%.0f°", sharedWeather.weatherOneCall!.daily[0].feelsLike.day))")
                Text("💧 \(String(format: "%.0f", sharedWeather.weatherOneCall!.daily[0].pop * 100)) %")
            }
            Spacer()
            VStack {
                Text("Tonight")
                Text(String(format: "%.0f°", sharedWeather.weatherOneCall!.daily[0].temp.night))
                    .font(.system(size: 50))
                    .bold()
                //Text("Feelslike: \(String(format: "%.0f°", sharedWeather.weatherOneCall!.daily[0].feelsLike.night))")
                Text("💧 \(String(format: "%.0f", sharedWeather.weatherOneCall!.daily[0].pop * 100)) %")
            }
            Spacer()
            VStack {
                Text("Tomorrow")
                Text(String(format: "%.0f°", sharedWeather.weatherOneCall!.daily[1].temp.max))
                    .font(.system(size: 50))
                    .bold()
                //Text("Feelslike: \(String(format: "%.0f°", sharedWeather.weatherOneCall!.daily[1].feelsLike.day))")
                Text("💧 \(String(format: "%.0f", sharedWeather.weatherOneCall!.daily[1].pop * 100)) %")
            }
            Spacer()
        }
    }
}

struct TodayTemps_Previews: PreviewProvider {
    static var previews: some View {
        TodayTemps()
    }
}
