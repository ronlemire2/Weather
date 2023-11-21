//
//  Weather.swift
//  Weather
//
//  Created by Ron Lemire on 3/28/22.
//

import SwiftUI

class SharedWeather: ObservableObject {
    @Published var weatherOneCall: WeatherOneCall?
}
