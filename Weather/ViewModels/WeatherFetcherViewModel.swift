//  Created by Apple Developer Academy at TUWAIQ on 01/02/2023

import SwiftUI

final class WeatherFetcherViewModel: ObservableObject {
  
  let apiKey: String

  @Published var data: WeatherData = .init()
  @Published var error: String = .init()
  @Published var didLoadSuccessfully: Optional<Bool> = .none
  
  init() {
    apiKey = "Put your API_KEY here"
  }
  
  func fetch(cityName: String) async {
    let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)"
    let url = URL(string: urlString)!
    
    if let (data, response) = try? await URLSession.shared.data(from: url) {
      let decoder = JSONDecoder()
      if let decodedWeatherData = try? decoder.decode(WeatherData.self, from: data) {
        self.data = decodedWeatherData
        self.didLoadSuccessfully = true
        Logger.success(self.data)
      } else {
        self.didLoadSuccessfully = false
        self.error = "Undecodable data"
        Logger.error(self.error, String(data: data, encoding: .utf8), separator: "\n")
      }
    } else {
      self.error = "Unhandled Error"
      self.didLoadSuccessfully = false
      Logger.error(self.error)
    }
  }
}
