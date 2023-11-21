//
//  HourlyRow.swift
//  Weather
//
//  Created by Ron Lemire on 3/28/22.
//

import SwiftUI

struct HourlyRow: View {
    var hour: Int
    var icon: String
    var temp: Double
    var feelsLike: Double
    var pop: Double
    
    var body: some View {
        HStack {
            Text(String("\(formatWeatherDate(seconds: Double(hour), format: "h a"))"))
            Spacer()
            Image("\(icon)")
            Spacer()
            Text(String(format: "%.0f°", temp))
            Spacer()
            Text("RealFeel \(String(format: "%.0f°", feelsLike))")
            Spacer()
            Text("💧 \(String(format: "%.0f", pop * 100)) %")
        }
    }
}

struct HourlyRow_Previews: PreviewProvider {
    static var previews: some View {
        HourlyRow(hour: 1648504800, icon: "03d", temp: 56.64, feelsLike: 56.1, pop: 0.51)
    }
}

