//
//  ForecastView.swift
//  Weather
//
//  Created by Ron Lemire on 4/1/22.
//

import SwiftUI

struct ForecastView: View {
    @EnvironmentObject var sharedWeather: SharedWeather
    
    // Define number of rows with a fixed GridItem height.
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
                    Spacer()
                    
                    Text("Hourly Forecast")
                        .font(.title3)
                        .bold()

                    ScrollView(.horizontal) {
                        LazyHGrid(rows: layout) {
                            ForEach(sharedWeather.weatherOneCall!.hourly) { hour in
                                HourlyForecast(hour: hour)
                            }
                        }
                        .frame(height: 250)
                        .background(Color.blue)
                    }

                    Spacer()
                    
                    Text("Daily Forecast")
                        .font(.title3)
                        .bold()
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: layout) {
                            ForEach(sharedWeather.weatherOneCall!.daily) { day in
                                DailyForecast(day: day)
                            }
                        }
                        .frame(height: 250)
                        .background(Color.blue)
                    }
                    
                    Spacer()

                }
                .navigationTitle("Forecast")
                .navigationBarHidden(true)
                .font(.subheadline)
            }
            .padding(.horizontal)
        }
    }

}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
            .environmentObject(SharedWeather())
    }
}

/* From: ForecastView.swift
 // Text("\(getDayOfWeekNow2()) \(formatDate(date: Date.now))")
 */
