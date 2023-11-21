//
//  Loaders.swift
//  Weather
//
//  Created by Ron Lemire on 3/29/22.
//

import Foundation

func loadOneCallWeather() async -> WeatherOneCall? {
    var data = Data()
    var decodedOneCall: WeatherOneCall? = nil
       
    // Compose weather URL
    guard let url = URL(string:
                            "https://api.openweathermap.org/data/2.5/onecall?lat=41.755948&lon=-124.201747&appid=\(Secrets.appid)&exclude=minutely&units=imperial") else {
                print("Invalid URL")
            return nil
    }

    // Get JSON data from URL
    do {
        (data, _) = try await URLSession.shared.data(from: url)
        print("data: \(data)")
    }
    catch let jsonError as NSError {
        print("JSON decode failed: \(jsonError.description)")
    }
    catch {
        print("Invalid data")
    }
        
    // Decode JSON into weather objects
    do {
        decodedOneCall = try JSONDecoder().decode(WeatherOneCall.self, from: data)
    }
    catch let jsonError as NSError {
        print("JSON decode failed: \(jsonError.description)")
    }
    catch {
        print("Invalid data")
    }

    return decodedOneCall
}

func loadWeatherFromJSON() async -> WeatherOneCall? {
    let weatherOneCall: WeatherOneCall? = Bundle.main.decodeWeatherOneCall("weather.json") ?? nil
    return weatherOneCall ?? nil
}



/*
 // URLSession without caching.
 // https://useyourloaf.com/blog/urlsessionconfiguration-quick-guide/
 //let configuration = URLSessionConfiguration.default
 //configuration.urlCache = nil
 //let urlSession = URLSession(configuration: configuration)
 //let (data, _) = try await urlSession.data(from: url)

 */
