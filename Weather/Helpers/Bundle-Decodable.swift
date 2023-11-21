//
//  Bundle-Decodable.swift
//  MoonShot
//
//  Created by Ron Lemire on 3/15/22.
//

import Foundation

extension Bundle {
    // Generic version
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
    
    // Non-Generic version
    func decodeWeatherOneCall(_ file: String) -> WeatherOneCall? {
        var decodedOneCall: WeatherOneCall? = nil
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)

        do {
            decodedOneCall = try JSONDecoder().decode(WeatherOneCall.self, from: data)
        }
        catch let jsonError as NSError {
            print("JSON decode failed: \(jsonError.description)")
        }
        catch {
            print("Invalid data")
        }

        return decodedOneCall ?? nil
    }
}

