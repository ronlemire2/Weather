//
//  TodayCircle.swift
//  Weather
//
//  Created by Ron Lemire on 4/2/22.
//

import SwiftUI

struct TodayCircle: View {
    @EnvironmentObject var sharedWeather: SharedWeather
    
    var body: some View {
        Circle()
            .fill(Color.blue)
            .overlay(
                VStack {
                    Text(String(format: "%.0f°", sharedWeather.weatherOneCall?.current.temp ?? 0.00))
                        .font(.system(size: 100))
                        .bold()
                    HStack {
                        Text("\(sharedWeather.weatherOneCall?.current.weather[0].weatherDescription ?? "")".capitalized)
                            .font(.title2)
                        Image(systemName:"\(weatherCondition(sharedWeather.weatherOneCall?.current.weather[0].id ?? 0))")
                    }
                }
                .foregroundColor(.white)
            )
            .frame(width: 300, height: 300, alignment: .center)
    }
}

struct TodayCircle_Previews: PreviewProvider {
    static var previews: some View {
        TodayCircle()
    }
}
