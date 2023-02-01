//  Created by Apple Developer Academy at TUWAIQ on 01/02/2023

import SwiftUI

struct CityPickerView: View {
  @State var shouldNavigateToSecondView: Bool = false
  @State var cityName: String = ""
  @State var error: String = ""
  
  var body: some View {
    VStack {
      if !error.isEmpty {
        Text(error)
          .foregroundColor(.red)
      }
      HStack {
        TextField("", text: $cityName, prompt: Text("Enter a city name"))
          .padding()
          .background(
            RoundedRectangle(cornerRadius: 15)
              .stroke(.gray)
          )
          .frame(maxWidth: .infinity)
        Button(action: {
          if cityName.isEmpty {
            error = "No city name were provided in the Textfield"
            shouldNavigateToSecondView = false
          } else {
            error = ""
            shouldNavigateToSecondView = true
          }
        }, label: {
          Text("GO")
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 15)
                .stroke(.blue)
            )
        })
        
        NavigationLink(isActive: $shouldNavigateToSecondView, destination: {
          WeatherForecastView(cityName: cityName)
        }, label: EmptyView.init)
      }
      Spacer()
    }
    .padding()
    
  }
}

struct CityPickerView_Previews: PreviewProvider {
  static var previews: some View {
    CityPickerView()
  }
}
