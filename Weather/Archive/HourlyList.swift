//
//  HourlyList.swift
//  Weather
//
//  Created by Ron Lemire on 3/31/22.
//

import SwiftUI

struct HourlyList: View {
    @EnvironmentObject var sharedWeather: SharedWeather

    var body: some View {
        NavigationView {
            List {
                if sharedWeather.weatherOneCall != nil {
                    ForEach(sharedWeather.weatherOneCall!.hourly) { hour in
                        HStack {
                            NavigationLink(destination: HourView(hour: hour)) {
                                VStack {
                                    if formatWeatherDate(seconds: Double(hour.dt), format: "h a") == "12 AM" {
                                        Text(formatWeatherDate(seconds: Double(hour.dt), format: "EEEE"))
                                            .font(.title3)
                                    }
                                    HourlyRow(hour: hour.dt, icon: hour.weather[0].icon, temp: hour.temp, feelsLike: hour.feelsLike, pop: hour.pop!)
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Hourly List")
        .font(.subheadline)
        .listStyle(GroupedListStyle())
    }
}

struct HourlyList_Previews: PreviewProvider {
    static var previews: some View {
        HourlyList()
    }
}
