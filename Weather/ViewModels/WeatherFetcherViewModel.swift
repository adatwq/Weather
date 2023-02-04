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
    
    var receivedData: String = .init()
    do {
      let (data, response) = try await URLSession.shared.data(from: url)
      
      receivedData = String(data: data, encoding: .utf8) ?? "Unable to load data"
      
      let decoder = JSONDecoder()
      
      self.data = try decoder.decode(WeatherData.self, from: data)
      self.didLoadSuccessfully = true
      Logger.success(self.data)

    } catch let DecodingError.dataCorrupted(context) {
      self.error = "dataCorrupted(\(context))"
      self.didLoadSuccessfully = false
      Logger.error(self.error)
      Logger.error("Received data", receivedData, separator: "\n")
    } catch let DecodingError.keyNotFound(key, context) {
      self.error = "keyNotFound(\(key), \(context))"
      self.didLoadSuccessfully = false
      Logger.error(self.error)
      Logger.error("Received data", receivedData, separator: "\n")
    } catch let DecodingError.valueNotFound(value, context) {
      self.error = "valueNotFound(\(value), \(context))"
      self.didLoadSuccessfully = false
      Logger.error(self.error)
      Logger.error("Received data", receivedData, separator: "\n")
    } catch let DecodingError.typeMismatch(type, context)  {
      self.error = "typeMismatch(\(type), \(context))"
      self.didLoadSuccessfully = false
      Logger.error(self.error)
      Logger.error("Received data", receivedData, separator: "\n")
    } catch {
      self.error = error.localizedDescription
      self.didLoadSuccessfully = false
      Logger.error(self.error)
    }
  }
}
