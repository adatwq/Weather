//  Created by Apple Developer Academy at TUWAIQ on 01/02/2023

import Foundation

// Model
// MARK: - WeatherData
struct WeatherData: Codable {
  var coord: Optional<Coord> = .none
  var weather: Optional<Array<Weather>> = .none
  var base: Optional<String> = .none
  var main: Optional<Main> = .none
  var visibility: Optional<Int> = .none
  var wind: Optional<Wind> = .none
  var clouds: Optional<Clouds> = .none
  var dt: Optional<Int> = .none
  var sys: Optional<Sys> = .none
  var timezone: Optional<Int> = .none
  var id: Optional<Int> = .none
  var name: Optional<String> = .none
  var cod: Optional<Int> = .none

  // MARK: - Clouds
  struct Clouds: Codable {
    var all: Optional<Int> = .none
  }
  
  // MARK: - Coord
  struct Coord: Codable {
    var lon: Optional<Double> = .none
    var lat: Optional<Double> = .none
  }
  
  // MARK: - Main
  struct Main: Codable {
    var temp: Optional<Double> = .none
    var feelsLike: Optional<Int> = .none
    var tempMin: Optional<Double> = .none
    var tempMax: Optional<Double> = .none
    var pressure: Optional<Int> = .none
    var humidity: Optional<Int> = .none
  }
  
  // MARK: - Sys
  struct Sys: Codable {
    var type: Optional<Int> = .none
    var id: Optional<Int> = .none
    var country: String
    var sunrise: Optional<Int> = .none
    var sunset: Optional<Int> = .none
  }
  
  // MARK: - Weather
  struct Weather: Codable {
    var id: Optional<Int> = .none
    var main: Optional<String> = .none
    var weatherDescription: Optional<String> = .none
    var icon: Optional<String> = .none
  }
  
  // MARK: - Wind
  struct Wind: Codable {
    var speed: Optional<Double> = .none
    var deg: Optional<Int> = .none
  }
}
