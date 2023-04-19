//
//  SignUpButton.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 20.04.2023.
//

import SwiftUI

private enum Layout {
  static let padding: CGFloat = 16
  static let radius: CGFloat = 8
  static let fontSize: CGFloat = 16
}

struct SignUpButton: View {
  var onTap: () -> Void?
  let text: LocalizedStringKey
  var bgColor: Color = Color.appPeach
  var tintColor: Color = .appWhite

  var body: some View {
    Button {
      onTap()
    } label: {
      HStack {
        Spacer()
        Text(text)
        Spacer()
      }.tint(tintColor)
        .font(.system(size: Layout.fontSize, weight: .semibold))
        .padding(.all, Layout.padding)
    }.buttonBorderShape(.roundedRectangle)
      .controlSize(.large)
      .background(bgColor)
      .cornerRadius(Layout.radius)
  }
}

struct SignUpButton_Previews: PreviewProvider {
    static var previews: some View {
      SignUpButton(
        onTap: {},
        text: TextKeys.signUpEmail.locale(),
        bgColor: Color.appPeach
      )
    }
}
