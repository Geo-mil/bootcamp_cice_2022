//
//  MoviesView.swift
//  CiceTmdbApp
//
//  Created by Jorge Millan on 23/2/22.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject var viewModel = MoviesViewModel()
    
    var body: some View {
        List{
            Group{
                if !self.viewModel.dataSourceNowPlaying.isEmpty{
                    MoviesPosterCarrousel(title: "Now playing",
                                          moviesModel: MoviesServerModel.stubbedMoviesNowPlaying,
                                            isPoster: true)
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle(Text("Movies"))
        .onAppear {
            self.viewModel.fetchData()
        }
    }
        
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
