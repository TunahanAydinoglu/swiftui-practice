//
//  SignButtons.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 20.04.2023.
//

import SwiftUI

struct SignInButtons: View {
  var body: some View {
    VStack {
      SignFacebookButton()
      SignGoogleButton()
      SignAppleButton()
    }
  }
}

struct SignButtons_Previews: PreviewProvider {
  static var previews: some View {
    SignInButtons()
  }
}

struct SignFacebookButton: View {
  var body: some View {
    SignInButton(onTap: {
      print("face")
    },
               text: TextKeys.signInFacebook.locale(),
               icon: Icons.facebook,
               bgColor: Color.appDeepSkyBlue,
               tintColor: .appWhite
    )
  }
}

struct SignGoogleButton: View {
  var body: some View {
    SignInButton(onTap: {
      print("google")
    },
               text: TextKeys.signInGoogle.locale(),
               icon: Icons.google,
               bgColor: Color.appWhite,
               tintColor: .appBlack
    )
  }
}

struct SignAppleButton: View {
  var body: some View {
    SignInButton(onTap: {
      print("apple")
    },
               text: TextKeys.signInApple.locale(),
               icon: Icons.apple,
               bgColor: Color.appBlack,
               tintColor: .appWhite
    )
  }
}
