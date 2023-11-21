//
//  Alerts.swift
//  Weather
//
//  Created by Ron Lemire on 4/2/22.
//

import SwiftUI

struct Alerts: View {
    @EnvironmentObject var sharedWeather: SharedWeather

    var body: some View {
        NavigationView {
            List {
                if sharedWeather.weatherOneCall != nil && sharedWeather.weatherOneCall?.alerts != nil {
                    ForEach(sharedWeather.weatherOneCall!.alerts!) { alert in
                        VStack(alignment: .leading) {
                            Text("Event: \(alert.event)\n")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.red)
                            Text("Start: \n\(formatWeatherDate(seconds: Double(alert.start), format: "EEE MMM d, yyyy 'at' h:mm:ss a"))\n")
                            Text("End: \n\(formatWeatherDate(seconds: Double(alert.end), format: "EEE MMM d, yyyy 'at' h:mm:ss a"))\n")
                            Text("Sender: \n\(alert.senderName)\n")
                            Text("Description: \n\(alert.alertDescription)\n")
                        }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 1)
                        )
                    }
                    .padding(10)
                } else {
                    Text("No Alerts.")
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("Alerts")
        //.navigationBarHidden(true)
        .font(.subheadline)
    }
}

struct Alerts_Previews: PreviewProvider {
    static var previews: some View {
        Alerts()
    }
}
