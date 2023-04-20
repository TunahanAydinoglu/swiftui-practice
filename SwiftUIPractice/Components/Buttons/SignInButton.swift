//
//  SignInButton.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 20.04.2023.
//

import SwiftUI

struct SignInButton: View {
  var onTap: () -> Void?
  let text: LocalizedStringKey
  let icon: String
  let bgColor: Color
  var tintColor: Color = .appWhite

  var body: some View {
    Button {
      onTap()
    } label: {
      HStack {
        Image(icon)
        Text(text)
        Spacer()
      }.tint(tintColor)
        .font(.title2)
        .padding(.all, Padding.standard)
    }.buttonBorderShape(.roundedRectangle)
      .controlSize(.large)
      .background(bgColor)
      .cornerRadius(Radius.low)
  }
}

struct SignButton_Previews: PreviewProvider {
  static var previews: some View {
    SignInButton(
      onTap: {},
      text: TextKeys.signInFacebook.locale(),
      icon: Icons.facebook,
      bgColor: Color.appDeepSkyBlue
    )
  }
}


