//
//  ContentView.swift
//  SlideMenuApp
//
//  Created by Jorge Millan on 15/3/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = MenuViewMocel()
    @State private var showMenu = false
    @State private var showObservations = false
    
    var navigation: some View{
        NavigationBarView(title: "Navegacion Principarl",
                          subtitle: "Subtitulo navegacion principal",
                          leftoptions: [NavigationBarItem.menuItem()],
                          rightoptions: [NavigationBarItem.ObservationsItem()]) { optionSelected in
            switch optionSelected{
            case  NavigationBarItemType.menu:
                self.showMenu.toggle()
            case NavigationBarItemType.observations:
                self.showObservations.toggle()
            default:
                break
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0){
            ZStack{
                navigation
                
                // MARK: - Slide Menu
                if self.showMenu{
                    MenuView(items: self.viewModel.topItems,
                             bootmItems: self.viewModel.bottomItems,
                             optionSelected: { text in
                        //
                    }, hideMenu: {
                        //
                    }, selectedMenuItem: 0)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
