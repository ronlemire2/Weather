//
//  MainView.swift
//  Weather
//
//  Created by Ron Lemire on 3/28/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            TodayView()
                .tabItem {
                    Label("Today", systemImage: "calendar.circle.fill")
                }
            
            ForecastView()
                .tabItem {
                    Label("Forecast", systemImage: "clock.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(SharedWeather())
    }
}

