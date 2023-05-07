//
//  LoginViewModel.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 23.04.2023.
//

import Foundation

@MainActor final class LoginViewModel: ObservableObject {
  private let networkManager: NetworkManaging

  @Published var email: String = "eve.holt@reqres.in"
  @Published var password: String = "cityslicka"
  @Published var token: String = ""
  @Published var isLogged: Bool = false

  init(){
    self.networkManager = NetworkManager(config: NetworkConfig(baseUrl: ApiNetworkPath.baseUrl))
  }

  func onLoginUser() {
    guard
      !email.isEmpty,
      !password.isEmpty
    else { return }

    let requestModel = LoginRequest(email: email, password: password)

    Task {
      let response = await networkManager.post(
        path: ApiNetworkPath.login,
        model: requestModel,
        type: LoginResponse.self
      )

      token = response?.token ?? ""
      isLogged = !token.isEmpty
    }
  }
}
