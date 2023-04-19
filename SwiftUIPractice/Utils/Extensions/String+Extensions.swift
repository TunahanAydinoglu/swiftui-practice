//
//  String+Extensions.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 20.04.2023.
//

import SwiftUI

extension String {
  func locale() -> LocalizedStringKey {
    return LocalizedStringKey(self)
  }
}
