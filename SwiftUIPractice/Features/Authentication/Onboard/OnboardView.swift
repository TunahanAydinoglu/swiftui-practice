//
//  OnboardView.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 20.04.2023.
//

import SwiftUI

struct OnboardView: View {
  @StateObject var viewModel = OnboardViewModel()
  
  private var dataIndexRange: ClosedRange<Int> {
    0...viewModel.data.count-1
  }
  
  var body: some View {
    NavigationView {
      GeometryReader { geometry in
        VStack {
          Spacer()
          TabView(
            selection: $viewModel.currentIndex,
            content: {
              ForEach(dataIndexRange, id: \.self) { index in
                OnboardSliderCard(
                  viewModel: viewModel.data[index],
                  imageHeigh: geometry.dynamicHeight(with: 0.45)
                )
              }
            }).tabViewStyle(.page(indexDisplayMode: .never))
          Spacer()
          HStack{
            ForEach(dataIndexRange, id: \.self) { index in
              IndicatorRectangle(
                isActive: index == viewModel.currentIndex
              )
            }
          }.frame(height: .xs)
          NavigationLink(isActive: $viewModel.needShowOnboard) {
            WelcomeView()
          } label: {
            CenterHeaderButton(onTap: {
              viewModel.onboardFinish()
            }, text: TextKeys.getStarted.locale())
            .padding(.all, Padding.standard)
          }
        }
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
