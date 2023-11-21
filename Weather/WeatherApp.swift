//
//  WeatherApp.swift
//  Weather
//
//  Created by Ron Lemire on 3/24/22.
//

import SwiftUI

@main
struct WeatherApp: App {
    @StateObject var sharedWeather = SharedWeather()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(sharedWeather)
        }
    }
}
