//
//  Geometry+Extensions.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 20.04.2023.
//

import SwiftUI

extension GeometryProxy {
  func dynamicHeight(with percentage: CGFloat) -> CGFloat {
    size.height * percentage
  }

  func dynamicWidth(with percentage: CGFloat) -> CGFloat {
    size.width * percentage
  }
}
