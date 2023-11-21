//
//  HourlyItemView.swift
//  Weather
//
//  Created by Ron Lemire on 3/28/22.
//

import SwiftUI

struct HourView: View {
    @EnvironmentObject var sharedWeather: SharedWeather
    var hour: Current
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(formatWeatherDate(seconds: Double(hour.dt), format: "EEE  MMM d, yyyy 'at' h:mm:ss a"))")
                    .font(.title3)
                HourGroups(hour: hour)
            }
            .navigationTitle("Hour")
            .navigationBarHidden(true)
        }
    }
}

struct HourView_Previews: PreviewProvider {
    static var previews: some View {
        let weather = [Weather]()

        HourView(hour: Current(dt: 1648517099, sunrise: 1648476368, sunset: 1648521435, temp: 54.73, feelsLike: 53.82, pressure: 1010, humidity: 83, dewPoint: 49.68, uvi: 0, clouds: 0, visibility: 9656, windSpeed: 17.27, windDeg: 330, weather: weather, windGust: 27.63, pop: 0.27))
            .environmentObject(SharedWeather())
    }
}
