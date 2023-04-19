//
//  SignButton.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 20.04.2023.
//

import SwiftUI

struct SignButton: View {
  var onTap: () -> Void?
  let text: LocalizedStringKey
  let icon: String
  var tintColor: Color = .appWhite
  
  var body: some View {
    Button {
      onTap()
    } label: {
      HStack {
        Image(icon)
        Text(text).tint(tintColor)
        Spacer()
      }
    }.buttonStyle(.borderedProminent)
      .buttonBorderShape(.roundedRectangle)
      .controlSize(.large)
  }
}

struct SignButton_Previews: PreviewProvider {
  static var previews: some View {
    SignButton(
      onTap: {},
      text: TextKeys.signInFacebook.locale(),
      icon: Icons.facebook
    )
  }
}


