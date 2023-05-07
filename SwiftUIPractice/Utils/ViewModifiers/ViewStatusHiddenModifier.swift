//
//  ViewStatusHiddenModifier.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 7.05.2023.
//

import SwiftUI

struct ViewStatusHiddenModifier: ViewModifier {
  @ViewBuilder
  func body(content: Content) -> some View {
    if #available(iOS 16.0, *){
      content.toolbar(.hidden, for: .automatic)
    } else {
      content.navigationBarHidden(true)
    }
  }
}
