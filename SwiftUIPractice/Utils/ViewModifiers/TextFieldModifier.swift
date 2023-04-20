//
//  TextFieldModifier.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 20.04.2023.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {

  func body(content: Content) -> some View {
    return content.padding()
    .overlay(
      RoundedRectangle(cornerRadius: Radius.low)
        .stroke(lineWidth: .xxxs)
    ).foregroundColor(Color.appCarl)
  }
}
