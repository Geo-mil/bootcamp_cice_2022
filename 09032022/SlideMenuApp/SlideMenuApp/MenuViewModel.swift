//
//  MenuViewModel.swift
//  SlideMenuApp
//
//  Created by Jorge Millan on 15/3/22.
//

import Foundation

enum MenuOptions: String{
    case currentView
    case logout
    case settings
    case alerts
    case reports
}

class MenuViewMocel: ObservableObject{
    var topItems: [MenuItemViewModel] = [
        MenuItemViewModel(identifier: MenuOptions.currentView.rawValue,
                      icon: "book_sales",
                      title: "Pagina actual",
                      childs: []),
        MenuItemViewModel(identifier: MenuOptions.settings.rawValue,
                      icon: "budget",
                      title: "Settings",
                      childs: []),
        MenuItemViewModel(identifier: MenuOptions.reports.rawValue,
                      icon: "history",
                      title: "Informes",
                      childs: [])
    ]
    
    var bottomItems: [MenuItemViewModel] = [
        MenuItemViewModel(identifier: MenuOptions.logout.rawValue,
                      title: "Pagina actual"),
        MenuItemViewModel(identifier: MenuOptions.alerts.rawValue,
                      title: "Alertas")
        ]
}
