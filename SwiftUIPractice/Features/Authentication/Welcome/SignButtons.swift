//
//  SignButtons.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 20.04.2023.
//

import SwiftUI

struct SignButtons: View {
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
    SignButtons()
  }
}

struct SignFacebookButton: View {
  var body: some View {
    SignButton(onTap: {
      print("face")
    },
               text: TextKeys.signInFacebook.locale(),
               icon: Icons.facebook,
               tintColor: .appWhite
    )
  }
}

struct SignGoogleButton: View {
  var body: some View {
    SignButton(onTap: {
      print("google")
    },
               text: TextKeys.signInGoogle.locale(),
               icon: Icons.google,
               tintColor: .appWhite
    )
  }
}

struct SignAppleButton: View {
  var body: some View {
    SignButton(onTap: {
      print("apple")
    },
               text: TextKeys.signInApple.locale(),
               icon: Icons.apple,
               tintColor: .appWhite
    )
  }
}
