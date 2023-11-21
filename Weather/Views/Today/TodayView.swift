//
//  TodayView.swift
//  Weather
//
//  Created by Ron Lemire on 3/24/22.
//
import SwiftUI

struct TodayView: View {
    @EnvironmentObject var sharedWeather: SharedWeather
    
    var body: some View {
        NavigationView {
            if sharedWeather.weatherOneCall != nil {
                VStack {
                    Group {
                        Spacer()
                        VStack {
                            Text("Crescent City, CA")
                                .font(.largeTitle)
                                .bold()
                            Text("\(formatWeatherDate(seconds: Double(0.00), format: "EEE  MMM d, yyyy 'at' h:mm:ss a"))")
                                .font(.headline)
                        }
                        Spacer()
                        TodayCircle()
                        Spacer()
                    }
                    Group {
                        TodayTemps()
                        Spacer()
                    }
                    Spacer()
                    TodayButtons()
                    Spacer()
                } // end VStack
                .navigationTitle("Today")
                .navigationBarHidden(true)
                .font(.subheadline)
                .listStyle(GroupedListStyle())
            } // end if sharedWeather.weatherOneCall != nil
        }
        .task {
            await sharedWeather.weatherOneCall = loadOneCallWeather()
            //await sharedWeather.weatherOneCall =  loadWeatherFromJSON()
        }
    }

}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
            .environmentObject(SharedWeather())
    }
}



/* Old Code
 //                .navigationBarItems(trailing:
 //                    Button {
 //                        Task {
 //                            await sharedWeather.weatherOneCall =  loadOneCallWeather()
 //                            //await sharedWeather.weatherOneCall =  loadWeatherFromJSON()
 //                        }
 //                    } label: {
 //                        Text("Refresh")
 //                        //Image(systemName: "arrow.clockwise.circle.fill")
 //                    })
 //                .navigationBarItems(leading:
 //                    NavigationLink(destination: CurrentView(current: sharedWeather.weatherOneCall!.current, day: sharedWeather.weatherOneCall!.daily[0])) {
 //                        Text("Details")
 //                            .foregroundColor(.blue)
 //                    }
 //                )
 */
