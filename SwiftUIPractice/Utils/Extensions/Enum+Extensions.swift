//
//  Enum+Extensions.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 27.05.2023.
//

import SwiftUI

extension TextKeys {
  func locale() -> LocalizedStringKey {
    return LocalizedStringKey(self.rawValue)
  }
}
