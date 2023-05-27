//
//  MainTabView.swift
//  SwiftUIPractice
//
//  Created by Tunahan Aydınoglu on 27.05.2023.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
      TabView {
        ForEach(HomeTabItem.tabItems) { item in
          item.view.tabItem {
            TabIconLabel(model:item.model)
          }
        }
      }.accentColor(.appPeach)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

private struct TabIconLabel: View {
  let model: TabModel
  var body: some View {
    VStack{
      Image(model.icon.rawValue)
      Text(model.title.locale())
    }
  }
}
