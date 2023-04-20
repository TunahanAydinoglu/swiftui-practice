//
//  OnboardView.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 20.04.2023.
//

import SwiftUI

struct OnboardView: View {
  private let pageData: [OnboardModel] = OnboardModel.mockDatas
  private var dataIndexRange = 0...OnboardModel.mockDatas.count-1
  @State private var currentIndex: Int = 0
  var body: some View {
    GeometryReader { geometry in
      VStack {
        Spacer()
        TabView(
          selection: $currentIndex,
          content: {
            ForEach(dataIndexRange, id: \.self) { index in
              OnboardSliderCard(
                viewModel: pageData[index],
                imageHeigh: geometry.dynamicHeight(with: 0.45)
              )
            }
          }).tabViewStyle(.page(indexDisplayMode: .never))
        Spacer()
        HStack{
          ForEach(dataIndexRange, id: \.self) { index in
            IndicatorRectangle(isActive: index == currentIndex)
          }
        }.frame(height: .xs)
        CenterHeaderButton(onTap: {}, text: TextKeys.getStarted.locale())
          .padding(.all, Padding.standard)
      }
    }
  }
}

struct OnboardView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardView()
  }
}

private struct IndicatorRectangle: View {
  private enum Layout {
    static let activeWidth: CGFloat = 50
    static let standardWidth: CGFloat = 20
  }

  var isActive: Bool = false
  
  var width: CGFloat {
    isActive ? Layout.activeWidth : Layout.standardWidth
  }
  var body: some View {
    Rectangle()
      .fill(Color.appClooney)
      .cornerRadius(Radius.low)
      .frame(width: width)
  }
}
