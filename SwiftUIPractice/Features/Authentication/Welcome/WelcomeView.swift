//
//  WelcomeView.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 19.04.2023.
//

import SwiftUI

struct WelcomeView: View {
  var body: some View {
    ZStack {
      Image(Images.juise).resizable()
      Color.appBlack.opacity(0.3)
      VStack {
        Image(Icons.appLogo).padding(Edge.Set.bottom, 40)
        SignButtons()
      }.padding(.paddingAll())
    }
  }
}

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView().ignoresSafeArea()
  }
}
