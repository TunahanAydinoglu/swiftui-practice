//
//  UserDefaultsCache.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 22.04.2023.
//

import Foundation

enum LocalCacheKeys: String {
  case onboard
}

protocol UserCacheProtocol {
  func read(key: LocalCacheKeys) -> String
  func save(value: String, key: LocalCacheKeys)
  func remove(key: LocalCacheKeys)
}

struct UserDefaultsCache: UserCacheProtocol {
  func read(key: LocalCacheKeys) -> String {
    print("ttun")
    guard
      let value = UserDefaults.standard.value(forKey: key.rawValue) as? String
    else {  return "" }

    return value
  }

  func save(value: String, key: LocalCacheKeys) {
    UserDefaults.standard.set(value, forKey: key.rawValue)
  }

  func remove(key: LocalCacheKeys) {
    UserDefaults.standard.removeObject(forKey: key.rawValue)
  }
}
