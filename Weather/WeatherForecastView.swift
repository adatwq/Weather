//  Created by Apple Developer Academy at TUWAIQ on 01/02/2023

import SwiftUI

struct WeatherForecastView: View {
  
  let cityName: String
  
  @State var weatherData: WeatherData = .init()
  @State var weatherError: String = .init()
  @State var didLoadCityWeatherInformationSuccessfully: Optional<Bool> = .none

  var body: some View {
    ScrollView {
      VStack {
        if didLoadCityWeatherInformationSuccessfully == nil {
          HStack {
            Circle()
              .fill(.orange)
              .frame(width: 12, height: 12)
            Text("Loading ...")
              .font(.title)
            Spacer()
          }
          .padding()
          Divider()
          Spacer(minLength: 250)
          ProgressView()
            .scaleEffect(4)
        } else if didLoadCityWeatherInformationSuccessfully == true {
          HStack {
            Circle()
              .fill(.green)
              .frame(width: 12, height: 12)
            Text("Success")
              .font(.title)
            Spacer()
          }
          .padding()
          Divider()
          HStack {
            Text("Temperature:")
              .padding()
              .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
            if let temp = weatherData.main?.temp?.description {
              // Notice: this temp is in Kelvin.. convert it to Celsius or read more in the API Documentation and see if it provided in Celsius
              Text(temp)
                .padding()
            } else {
              Text("Unable to load temp")
                .padding()
            }
          }
          Divider()
        } else {
          HStack {
            Circle()
              .fill(.red)
              .frame(width: 12, height: 12)
            Text("Error")
              .font(.title)
            Spacer()
          }
          .padding()
          Divider()
          Text(weatherError)
            .padding()
        }
      }
    }
    .navigationTitle("\(cityName.capitalized) Weather")
    .onAppear(perform: fetchWeatherData)
  }
  
  func fetchWeatherData() {
    let apiKey: String = "8f31ab935c42e9f805ef1fa7b40c8821"
    let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)"
    let url = URL(string: urlString)!
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      guard let data = data else {
        weatherError = error?.localizedDescription ?? "Undefined Error"
        didLoadCityWeatherInformationSuccessfully = false
        Logger.error(weatherError)
        return
      }
      
      let decoder = JSONDecoder()
      if let decodedWeatherData = try? decoder.decode(WeatherData.self, from: data) {
        weatherData = decodedWeatherData
        didLoadCityWeatherInformationSuccessfully = true
        Logger.success(weatherData)
      } else {
        didLoadCityWeatherInformationSuccessfully = false
        weatherError = "Undecodable data"
        Logger.error(weatherError, String(data: data, encoding: .utf8), separator: "\n")
      }
    }
    
    task.resume()
  }
}

struct WeatherForecastView_Previews: PreviewProvider {
  static var previews: some View {
    WeatherForecastView(cityName: "Jeddah")
  }
}

