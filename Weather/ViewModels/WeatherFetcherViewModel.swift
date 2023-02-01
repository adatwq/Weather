//  Created by Apple Developer Academy at TUWAIQ on 01/02/2023

import SwiftUI

final class WeatherFetcherViewModel: ObservableObject {
  
  let apiKey: String

  @Published var data: WeatherData = .init()
  @Published var error: String = .init()
  @Published var didLoadSuccessfully: Optional<Bool> = .none
  
  init() {
    apiKey = "8f31ab935c42e9f805ef1fa7b40c8821"
  }
  
  func fetch(cityName: String) {
    let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)"
    let url = URL(string: urlString)!
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      guard let data = data else {
        self.error = error?.localizedDescription ?? "Undefined Error"
        self.didLoadSuccessfully = false
        Logger.error(self.error)
        return
      }
      
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
    }
    
    task.resume()
  }
}
