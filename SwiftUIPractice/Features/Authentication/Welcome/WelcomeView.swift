//
//  WelcomeView.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 19.04.2023.
//

import SwiftUI

private enum Layout {
  static let dividerHeight: CGFloat = .xxxs
  static let padding: CGFloat = Padding.standard
  static let appLogoBottomPadding: CGFloat = 40
  static let pageBottomPaddingPercentage: CGFloat = 0.05
}

struct WelcomeView: View {
  var body: some View {
    ZStack {
      Image(Images.juise).resizable()
      Color.appBlack.opacity(0.3)
      BodyView()
    }
  }
}

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView().ignoresSafeArea()
  }
}

private struct BodyView: View {
  var body: some View {
    GeometryReader { geometry in
      VStack {
        Spacer()
        Image(Icons.appLogo)
          .padding(Edge.Set.bottom, Layout.appLogoBottomPadding)
        Spacer()
        SignInButtons()
        ButtonsDivider()
        CenterHeaderButton(onTap: {}, text: TextKeys.signUpEmail.locale())
        Spacer()
          .frame(height: geometry.dynamicHeight(with: Layout.pageBottomPaddingPercentage))
      }.padding(.paddingAll())
    }
  }
}

private struct ButtonsDivider: View {
  var body: some View {
    Divider()
      .background(Color.appPeach)
      .frame(height: Layout.dividerHeight)
      .padding(.all, Layout.padding)
  }
}
