//
//  OnboardViewModel.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 22.04.2023.
//

import Foundation

final class OnboardViewModel: ObservableObject {
  private let cache: UserCacheProtocol

  @Published var currentIndex: Int = 0
  @Published var data: [OnboardModel] = OnboardModel.mockDatas
  @Published var needShowOnboard: Bool = false


  init() {
    self.cache = UserDefaultsCache()
    self.needShowOnboard = checkUserFirstLogin()
  }

  func onboardFinish() {
    cache.save(value: "onboarded", key: .onboard)
    needShowOnboard = true
  }

  private func checkUserFirstLogin() -> Bool {
    !cache.read(key: .onboard).isEmpty
  }
}

