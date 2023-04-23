//
//  LoginModels.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 23.04.2023.
//

import Foundation

struct LoginRequest: Encodable {
  let email: String
  let password: String
}

struct LoginResponse: Codable {
  let token: String
}
