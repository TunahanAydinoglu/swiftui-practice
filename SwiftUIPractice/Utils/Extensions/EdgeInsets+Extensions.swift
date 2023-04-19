//
//  EdgeInsets+Extensions.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 20.04.2023.
//

import SwiftUI

extension EdgeInsets {
  static func paddingAll(padding: CGFloat = 10) -> EdgeInsets {
    return EdgeInsets(
      top: padding,
      leading: padding,
      bottom: padding,
      trailing: padding
    )
  }
}
