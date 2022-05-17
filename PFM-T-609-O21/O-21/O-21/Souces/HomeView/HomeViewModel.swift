//
//  HomeViewModel.swift
//  O-21
//
//  Created by Jorge Millan
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var selectedTabItem: TabItemViewModel.TabItemType = .impresiones
    
    let tabItemViewModels = [
        TabItemViewModel(imageName: "view.3d", title: "Impresiones", type: .impresiones),
        TabItemViewModel(imageName: "magnifyingglass", title: "Search", type: .search),
        TabItemViewModel(imageName: "cart", title: "Carrito", type: .carrito),
        TabItemViewModel(imageName: "person.fill", title: "Profile", type: .profile),
    ]
}

struct TabItemViewModel: Hashable {
    let imageName: String
    let title: String
    let type: TabItemType
    
    enum TabItemType{
        case impresiones
        case search
        case carrito
        case profile
    }
}
