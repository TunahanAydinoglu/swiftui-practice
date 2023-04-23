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

enum ApiNetworkPath: String, NetworkPath {
  static var baseUrl: String = "https://reqres.in/"

  case users = "api/users"
  case login = "api/login"

  var url: String {
    ApiNetworkPath.baseUrl + self.rawValue
  }
}

protocol NetworkManaging {
  var config: NetworkConfig { get }
  func fetch<T: Codable>(path: NetworkPath, method: HTTPMethod, type: T.Type) async -> T?
  func post<T: Codable, R: Encodable>(path: NetworkPath, model: R, type: T.Type) async -> T?
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
    let request = AF.request(path.url, method: method).validate().serializingDecodable(T.self)
    return await response(with: request)
  }

  func post<T: Decodable, R: Encodable>(path: NetworkPath, model: R, type: T.Type) async -> T? {
    let jsonEncoder = JSONEncoder()
    guard
      let data = try? jsonEncoder.encode(model),
      let dataString = String(data: data, encoding: .utf8)
    else { return nil }

    let dataRequest = AF.request(
      path.url, method: .post,
      parameters: convertToDictionary(text: dataString)
    ).validate().serializingDecodable(T.self)


    return await response(with: dataRequest)
  }
}

private extension NetworkManager {
  func convertToDictionary(text: String) -> [String: Any]? {
    guard let data = text.data(using: .utf8) else { return nil }
    var result: [String: Any]?
    do {
      result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
    } catch {
      print(error.localizedDescription)
    }
    return result
  }

  func response<T: Decodable>(with request: DataTask<T>) async -> T? {
    let response = await request.response
    if let error = response.error {
      print("Network error: \(error)")
    }
    return response.value
  }
}



