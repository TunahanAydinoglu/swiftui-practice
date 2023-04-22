//
//  NetworkManager.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 22.04.2023.
//

import Alamofire
import Foundation

struct NetworkConfig {
  let baseUrl: String
}

protocol NetworkPath {
  static var baseUrl: String { get }
  var url: String { get }
}

protocol NetworkManaging {
  var config: NetworkConfig { get }
  func fetch<T: Codable>(path: NetworkPath, method: HTTPMethod, type: T.Type) async -> T?
}

extension NetworkManager {
  static var networkManager: NetworkManaging = NetworkManager(config: .init(baseUrl: ApiNetworkPath.baseUrl))
}

class NetworkManager: NetworkManaging {
  let config: NetworkConfig

  init(config: NetworkConfig) {
    self.config = config
  }

  func fetch<T: Codable>(path: NetworkPath, method: HTTPMethod, type: T.Type) async -> T? {
    print("tunn \(path.url)")
    let request = AF.request(path.url, method: method).validate().serializingDecodable(T.self)

    let response = await request.response
    if let error = response.error {
      print("Network error: \(error)")
    }
    return response.value
  }
}

enum ApiNetworkPath: String, NetworkPath {
  static var baseUrl: String = "https://reqres.in/"

  case users = "api/users"

  var url: String {
    ApiNetworkPath.baseUrl + self.rawValue
  }
}
