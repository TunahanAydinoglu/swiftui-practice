//
//  MainTabModel.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 27.05.2023.
//

import Foundation
import SwiftUI

struct HomeTabItem: Identifiable {
  let id = UUID()

  let view: AnyView
  let model: TabModel

  static let tabItems: [HomeTabItem] = [
    HomeTabItem(view: AnyView(HomeView()), model: TabModel(title: .tabHome, icon: .home)),
    HomeTabItem(view: AnyView(HomeView()), model: TabModel(title: .tabMarket, icon: .market)),
    HomeTabItem(view: AnyView(HomeView()), model: TabModel(title: .tabCreate, icon: .edit)),
    HomeTabItem(view: AnyView(HomeView()), model: TabModel(title: .tabWishlist, icon: .favorite)),
    HomeTabItem(view: AnyView(HomeView()), model: TabModel(title: .tabAccount, icon: .person))
  ]
}

struct TabModel {
  let title: TextKeys
  let icon: Icons
}
