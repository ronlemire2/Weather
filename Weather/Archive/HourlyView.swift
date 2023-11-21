//
//  HourlyView.swift
//  Weather
//
//  Created by Ron Lemire on 3/28/22.
//

import SwiftUI

struct HourlyView: View {
    @EnvironmentObject var sharedWeather: SharedWeather
    
    // Define number of rows with a fixed row height.
    let layout = [
        GridItem(.fixed(40)),
        GridItem(.fixed(40)),
        GridItem(.fixed(40)),
        GridItem(.fixed(40)),
        GridItem(.fixed(40))
    ]
    
    var body: some View {
        if sharedWeather.weatherOneCall != nil {
            NavigationView {
                VStack {
                    //Text("\(getDayOfWeekNow2()) \(formatDate(date: Date.now))")
                    
                    Text("Hourly Forecast")
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: layout) {
                            ForEach(sharedWeather.weatherOneCall!.hourly) { hour in
                                HourlyForecast(hour: hour)
                            }
                        }
                        .frame(height: 300)
                        .background(Color.blue)
                    }

                    Spacer()
                    
                    Text("Hourly Forecast")
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: layout) {
                            ForEach(sharedWeather.weatherOneCall!.hourly) { hour in
                                HourlyForecast(hour: hour)
                            }
                        }
                        .frame(height: 300)
                        .background(Color.blue)
                    }
                }
                .navigationViewStyle(.stack)
                .navigationTitle("Forecasts")
                .font(.subheadline)
            }
            .padding(.horizontal)
        }
    }
}

struct HourlyView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyView()
            .environmentObject(SharedWeather())
    }
}




