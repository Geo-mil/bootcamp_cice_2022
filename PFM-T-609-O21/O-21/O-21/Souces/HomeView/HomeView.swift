//
//  HomeView.swift
//  O-21
//
//  Created by Jorge Millan
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        TabView(selection: self.$viewModel.selectedTabItem) {
            ForEach(self.viewModel.tabItemViewModels, id: \.self){ item in
                tabView(tabItemType: item.type)
                    .tabItem {
                        Image(systemName: item.imageName)
                        Text(item.title)
                    }.tag(item.type)
                
            }
        }
        .accentColor(.green)
        .environment(\.colorScheme, .light)
    }
    
    @ViewBuilder
    func tabView(tabItemType: TabItemViewModel.TabItemType) -> some View {
        switch tabItemType {
        case .impresiones:
            Prints3DCoordinator.navigation()
//        case .carrito:
//            ShowsCoordinator.navigation()
//        case .search:
//            SearchCoordinator.navigation()
//        case .profile:
          default:
            ProfileView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
