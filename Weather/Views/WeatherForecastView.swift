//  Created by Apple Developer Academy at TUWAIQ on 01/02/2023

import SwiftUI

struct WeatherForecastView: View {
  
  let cityName: String
  
  @StateObject var weatherFetcher: WeatherFetcherViewModel = .init()

  var body: some View {
    ScrollView {
      VStack {
        if weatherFetcher.didLoadSuccessfully == nil {
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
        } else if weatherFetcher.didLoadSuccessfully == true {
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
            
            if let temp = weatherFetcher.data.main?.temp?.fromKelvinToCelsius.description {
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
          Text(weatherFetcher.error)
            .padding()
        }
      }
    }
    .navigationTitle("\(cityName.capitalized) Weather")
    .onAppear(perform: fetchWeatherData)
  }
  
  func fetchWeatherData() {
    weatherFetcher.fetch(cityName: cityName)
  }
}

struct WeatherForecastView_Previews: PreviewProvider {
  static var previews: some View {
    WeatherForecastView(cityName: "Jeddah")
  }
}

