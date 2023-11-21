# Weather
Weather app uses openweathermap.org for weather data.

1) Get a free API key at https://openweathermap.org/price.
2) Download the project code.
3) Add a Secrets.swift file to the project with this struct: 
struct Secrets { 
	static let appid = "your API key here" 
}
4) Secrets.appid is used to compose the weather URL located in the Loaders.swift file.
// Compose weather URL 
guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=<your lat here>&lon=-<your lon here>&appid=\(Secrets.appid)&exclude=minutely&units=imperial") 
else { print("Invalid URL") 
	return nil 
}
