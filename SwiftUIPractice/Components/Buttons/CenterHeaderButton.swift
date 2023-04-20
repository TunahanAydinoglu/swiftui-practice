//
//  CenterHeaderButton.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 20.04.2023.
//

import SwiftUI

struct CenterHeaderButton: View {
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
        .font(.system(size: FontSize.standart, weight: .semibold))
        .padding(.all, Padding.standard)
    }.buttonBorderShape(.roundedRectangle)
      .controlSize(.large)
      .background(bgColor)
      .cornerRadius(Radius.low)
  }
}

struct CenterHeaderButton_Previews: PreviewProvider {
    static var previews: some View {
      CenterHeaderButton(
        onTap: {},
        text: TextKeys.signUpEmail.locale(),
        bgColor: Color.appPeach
      )
    }
}
