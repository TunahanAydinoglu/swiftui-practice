//
//  OnboardModel.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 20.04.2023.
//

import Foundation

struct OnboardModel: Identifiable {
  let id: UUID = UUID()
  let imageName: String
  let description: String
}

extension OnboardModel {
  static let mockDatas: [OnboardModel] = [
		OnboardModel(imageName: Images.onboardShop, description: "Shop global, Mind-blownly affordable."),
    OnboardModel(imageName: Images.onboardDeliver, description: "Deliver on the promise of time."),
    OnboardModel(imageName: Images.onboardHandPick, description: "Hand-pickle hight quality snacks.")
  ]
}
