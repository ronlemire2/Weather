//
//  HourlyItemView.swift
//  Weather
//
//  Created by Ron Lemire on 3/28/22.
//

import SwiftUI

struct HourView: View {
    @EnvironmentObject var sharedWeather: SharedWeather
    var hour: Current
    
    var body: some View {
        //Text(formatHour2(seconds: Double(hour.dt)))
        Text("\(getDayOfTheWeek(seconds: Double(hour.dt)))   \(convertTime(seconds: Double(hour.dt )))")
            .font(.title3)
                
//        List {
//            Group {
//                //DetailRow(name: "dt", value: String("\(getDayOfTheWeek(seconds: Double(hour.dt )))   \(convertTime(seconds: Double(hour.dt )))"))
//                DetailRow(name: "temp", value: String(format: "%.0f°",hour.temp))
//                DetailRow(name: "feelsLike", value: String(format: "%.0f°",hour.feelsLike))
//                DetailRow(name: "pressure", value: "\(hour.pressure)")
//                DetailRow(name: "humidity", value: "\(hour.humidity)％")
//                DetailRow(name: "dewpoint", value: String(format: "%.0f°",hour.dewPoint))
//                DetailRow(name: "uvi", value: "\(hour.uvi)")
//                DetailRow(name: "clouds", value: "\(hour.clouds)")
//                DetailRow(name: "visibility", value: "\(hour.visibility)")
//            }
//            Group {
//                DetailRow(name: "windspeed", value: String(format: "%.0f",hour.windSpeed))
//                DetailRow(name: "winddeg", value: "\(hour.windDeg)°")
//                DetailRow(name: "windgust", value: String(format: "%.0f",hour.windGust ?? 0.00))
//                DetailRow(name: "main", value: "\(hour.weather[0].main)")
//                DetailRow(name: "description", value: "\(hour.weather[0].weatherDescription)")
//                HStack {
//                    Text("icon")
//                    Spacer()
//                    Image("\(hour.weather[0].icon)")
//                }
//
//            }
//        }
        List {
            Group {
                HStack {
                    Spacer()
                    Text("Conditions")
                        .font(.headline)
                    Spacer()
                }
                DetailRow(name: "Id", value: "\(hour.weather[0].id)")
                DetailRow(name: "Main", value: "\(hour.weather[0].main)")
                DetailRow(name: "Description", value: "\(hour.weather[0].weatherDescription)".capitalized)
                DetailRow(name: "Clouds", value: String(hour.clouds)+"%")
                HStack {
                    Text("Icon")
                    Spacer()
                    Image("\(hour.weather[0].icon)")
                }
                DetailRow(name: "Visibility", value: "\(hour.visibility)km")
                DetailRow(name: "POP", value: String(format: "%.0f",(hour.pop ?? 0) * 100)+"%")
                DetailRow(name: "Uvi", value: String(format: "%.0f",hour.uvi))

            }

            /*
            Group {
                //DetailRow(name: "now", value: String("\(formatDate(date: Date.now))"))
                DetailRow(name: "dt", value: String("\(convertTime(seconds: Double(day.dt )))"))
                DetailRow(name: "sunrise", value: String("\(convertTime(seconds: Double(day.sunrise)))"))
                DetailRow(name: "sunset", value: String("\(convertTime(seconds: Double(day.sunset)))"))
                DetailRow(name: "moonrise", value: String("\(convertTime(seconds: Double(day.moonrise )))"))
                DetailRow(name: "moonset", value: String("\(convertTime(seconds: Double(day.moonset )))"))
                DetailRow(name: "moon_phase", value: String("\(convertTime(seconds: Double(day.moonPhase )))"))
            }
             */
            Group {
                HStack {
                    Spacer()
                    Text("Temperatures")
                        .font(.headline)
                    Spacer()
                }
                DetailRow(name: "Now", value: String(format: "%.0f°",hour.temp))
                DetailRow(name: "FeelsLike", value: String(format: "%.0f°",hour.feelsLike))
//                DetailRow(name: "Min", value: String(format: "%.0f°",day.temp.min))
//                DetailRow(name: "Night", value: String(format: "%.0f°",day.temp.night))
//                DetailRow(name: "Evening", value: String(format: "%.0f°",day.temp.eve))
//                DetailRow(name: "Morning", value: String(format: "%.0f°",day.temp.morn))
            }
            /*
            Group {
                DetailRow(name: "feelsLike.day", value: String(format: "%.0f°",day.feelsLike.day))
                DetailRow(name: "feelsLike.night", value: String(format: "%.0f°",day.feelsLike.night))
                DetailRow(name: "feelsLike.eve", value: String(format: "%.0f°",day.feelsLike.eve))
                DetailRow(name: "feelsLike.morn", value: String(format: "%.0f°",day.feelsLike.morn))
            }
             */
            Group {
                HStack {
                    Spacer()
                    Text("Humidity & Pressure")
                        .font(.headline)
                    Spacer()
                }
                DetailRow(name: "Humidity", value: "\(hour.humidity)％")
                DetailRow(name: "Pressure", value: "\(hour.pressure) hPa")
                DetailRow(name: "DewPoint", value: String(format: "%.0f°",hour.dewPoint))



            }
            Group {
                HStack {
                    Spacer()
                    Text("Wind")
                        .font(.headline)
                    Spacer()
                }
                DetailRow(name: "Speed", value: String(format: "%.0f mph",hour.windSpeed))
                DetailRow(name: "Direction", value: "\(convertDegreesToDirection(winDeg: hour.windDeg))")
                DetailRow(name: "Gust", value: String(format: "%.0f mph",hour.windGust ?? 0.00))
                
            }
            /*
            Group {
                DetailRow(name: "id", value: "\(day.weather[0].id)")
                DetailRow(name: "main", value: "\(day.weather[0].main)")
                DetailRow(name: "description", value: "\(day.weather[0].weatherDescription)")
                HStack {
                    Text("icon")
                    Spacer()
                    Image("\(day.weather[0].icon)")
                }
            }
            Group {
                DetailRow(name: "clouds", value: String(format: "%.0f %",day.clouds))
                DetailRow(name: "pop", value: String(format: "%.0f",day.pop * 100)+"%")
                //DetailRow(name: "rain", value: "\(day.rain)")
                DetailRow(name: "uvi", value: "\(day.uvi)")
            }
             */
        }
        .navigationTitle("Hour")
    }
}

struct HourView_Previews: PreviewProvider {
    static var previews: some View {
        let weather = [Weather]()

        HourView(hour: Current(dt: 1648517099, sunrise: 1648476368, sunset: 1648521435, temp: 54.73, feelsLike: 53.82, pressure: 1010, humidity: 83, dewPoint: 49.68, uvi: 0, clouds: 0, visibility: 9656, windSpeed: 17.27, windDeg: 330, weather: weather, windGust: 27.63, pop: 0.27))
            .environmentObject(SharedWeather())
    }
}
