//
//  OnboardSliderCard.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 20.04.2023.
//

import SwiftUI

struct OnboardSliderCard: View {
  let viewModel: OnboardModel
  let imageHeigh: CGFloat
  var body: some View {
    VStack {
      Image(viewModel.imageName).frame(height: imageHeigh)
      Text(viewModel.description)
        .lineLimit(3)
        .font(.system(size: FontSize.lgTitle, weight: .semibold))
        .multilineTextAlignment(.center)
        .padding(.horizontal, Padding.standard)
        .foregroundColor(.appPeach)
    }
  }
}

struct OnboardSliderCard_Previews: PreviewProvider {
    static var previews: some View {
      OnboardSliderCard(
        viewModel: OnboardModel.mockDatas[0],
        imageHeigh: 300
      )
    }
}
