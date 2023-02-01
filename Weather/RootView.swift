//  Created by Apple Developer Academy at TUWAIQ on 01/02/2023

import SwiftUI

struct RootView: View {
  var body: some View {
    NavigationView {
      CityPickerView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
  }
}

