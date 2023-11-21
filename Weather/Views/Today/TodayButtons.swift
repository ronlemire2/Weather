//
//  TodayButtons.swift
//  Weather
//
//  Created by Ron Lemire on 4/3/22.
//

import SwiftUI

struct TodayButtons: View {
    @EnvironmentObject var sharedWeather: SharedWeather
    
    var body: some View {
        HStack {
            NavigationLink(destination: TodayDetails(current: sharedWeather.weatherOneCall!.current, day: sharedWeather.weatherOneCall!.daily[0])) {
                Text("Details")
                    .foregroundColor(.blue)
            }
            Spacer()
            Button("Refresh") {
                Task {
                    await sharedWeather.weatherOneCall =  loadOneCallWeather()
                    //await sharedWeather.weatherOneCall =  loadWeatherFromJSON()
                }
            }
            Spacer()
            NavigationLink(destination: Alerts()) {
                Text("Alerts \(sharedWeather.weatherOneCall?.alerts == nil ? 0 : sharedWeather.weatherOneCall!.alerts!.count)")
                    .foregroundColor(.blue)
            }
        }
        .frame(width: 250, alignment: .center)
    }
}

struct TodayButtons_Previews: PreviewProvider {
    static var previews: some View {
        TodayButtons()
    }
}
