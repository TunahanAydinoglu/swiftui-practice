//
//  LoginView.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 20.04.2023.
//

import SwiftUI

struct LoginView: View {
  @ObservedObject private var viewModel = LoginViewModel()

  var body: some View {
    NavigationView {
      VStack {
        Spacer()
        Text(viewModel.token)
        Images.volcano.image()
        Text(TextKeys.welcomeBack.locale())
          .font(.system(size: FontSize.mdTitle, weight: .semibold))
          .foregroundColor(.appTeflon)
        TextFieldWithIcon(
          hintTextKey: TextKeys.emailPlaceHolder.locale(),
          iconName: Icons.mail,
          text: $viewModel.email
        )
        TextFieldWithIcon(
          hintTextKey: TextKeys.passwordPlaceholder.locale(),
          iconName: Icons.lock,
          text: $viewModel.password
        ).padding(.top, Padding.standard)
        Divider()
        NavigationLink("", isActive: $viewModel.isLogged) {
          Text("home page").navigationBarBackButtonHidden()
        }
        Group {
          CenterHeaderButton(onTap: {
            viewModel.onLoginUser()
          }, text: TextKeys.createAccount.locale())

          Text(TextKeys.termsAndCondition.locale())
            .environment(\.openURL, OpenURLAction(handler: { url in
              return .discarded
            }))
            .font(.system(size: FontSize.thinBody, weight: .regular))
            .foregroundColor(.appGandalf)
            .tint(.appCornFlowerBlue)
            .padding(.top, Padding.standard)
          Spacer()
        }
      }.padding(.all, Padding.standard)
    }.modifier(ViewStatusHiddenModifier())
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
  var text: Binding<String>

  var body: some View {
    HStack {
      iconName.image()
      TextField(hintTextKey, text: text)
    }.modifier(TextFieldModifier())
  }
}
