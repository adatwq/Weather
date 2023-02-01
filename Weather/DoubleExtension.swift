//  Created by Apple Developer Academy at TUWAIQ on 01/02/2023

import Foundation

extension Double {
  // https://www.metric-conversions.org/temperature/kelvin-to-celsius.htm
  var fromKelvinToCelsius: Double {
    let celsius = self - 273.15
    return celsius // will return something like 29.9003
    // challenging task could be how to prettify the double to be 29.9
  }
}
