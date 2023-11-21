//
//  DailyRow.swift
//  Weather
//
//  Created by Ron Lemire on 3/28/22.
//

import SwiftUI

struct DailyRow: View {
//    var name: String
//    var value: String
    var day: Int
    var icon: String
    var max: Double
    var min: Double
    var pop: Double
    
    var body: some View {
        HStack {
            Group {
                Text("\(formatWeatherDate(seconds: Double(day), format: "EEE"))")
                //Text(getDayOfTheWeek(seconds: Double(day)))
                Spacer()
                Text("\(formatWeatherDate(seconds: Double(day), format: "d"))")
                //Text(formatDay(seconds: Double(day)))
                Spacer()
                Image("\(icon)")
                Spacer()
            }
            Group {
                Text(String(format: "%.0f°", max))
                Spacer()
                Text("RealFeel \(String(format: "%.0f°", min))")
                Spacer()
                Text("💧 \(String(format: "%.0f", pop * 100)) %")
            }
        }
    }
}

struct DailyRow_Previews: PreviewProvider {
    static var previews: some View {
        DailyRow(day: 1648497600, icon: "10d", max: 56.64, min: 50.56, pop: 0.99)
    }
}
