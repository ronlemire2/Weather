//
//  DailyView.swift
//  Weather
//
//  Created by Ron Lemire on 3/28/22.
//

import SwiftUI

struct DailyView: View {
    @EnvironmentObject var sharedWeather: SharedWeather
    @State private var showDayView = false

    var body: some View {
        NavigationView {
            List {
                if sharedWeather.weatherOneCall != nil {
                    ForEach(sharedWeather.weatherOneCall!.daily) { day in
                        NavigationLink(destination: DayView(day: day)) {
                            DailyRow(day: day.dt, icon: day.weather[0].icon, max: day.temp.max, min: day.temp.min, pop: day.pop)
                        }
                    }
                }

            }
            .navigationTitle("Daily")
            .font(.subheadline)
            .listStyle(GroupedListStyle())
        }
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
            .environmentObject(SharedWeather())
    }
}

