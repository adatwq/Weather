//  Created by Apple Developer Academy at TUWAIQ on 01/02/2023

import SwiftUI

struct WeatherForecastView: View {
  
  let cityName: String
  
  @State var weatherData: Data = .init()
  @State var weatherResponse: URLResponse = .init()
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
          Text(weatherData.description)
            .padding()
          Divider()
          Text(weatherResponse.description)
            .padding()
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
    .onAppear {
      // Do your fetching here using URLSession
    }
  }
}

struct WeatherForecastView_Previews: PreviewProvider {
  static var previews: some View {
    WeatherForecastView(cityName: "Jeddah")
  }
}

