//
//  LoginView.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 20.04.2023.
//

import SwiftUI

struct LoginView: View {

  var body: some View {
    VStack {
      Spacer()
      Images.volcano.image()
      Text(TextKeys.welcomeBack.locale())
        .font(.system(size: FontSize.mdTitle, weight: .semibold))
        .foregroundColor(.appTeflon)
      TextFieldWithIcon(
        hintTextKey: TextKeys.emailPlaceHolder.locale(),
        iconName: Icons.mail
      )
      TextFieldWithIcon(
        hintTextKey: TextKeys.passwordPlaceholder.locale(),
        iconName: Icons.lock
      ).padding(.top, Padding.standard)
      Divider()
      CenterHeaderButton(onTap: {}, text: TextKeys.createAccount.locale())

      Text(TextKeys.termsAndCondition.locale())
        .environment(\.openURL, OpenURLAction(handler: { url in
          print(url)
          return .discarded
        }))
        .font(.system(size: FontSize.thinBody, weight: .regular))
        .foregroundColor(.appGandalf)
        .tint(.appCornFlowerBlue)
        .padding(.top, Padding.standard)
      Spacer()
    }.padding(.all, Padding.standard)
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}

private struct TextFieldWithIcon: View {
  let hintTextKey: LocalizedStringKey
  let iconName: String

  var body: some View {
    HStack {
      iconName.image()
      TextField(hintTextKey, text: .constant(""))
    }.modifier(TextFieldModifier())
  }
}
