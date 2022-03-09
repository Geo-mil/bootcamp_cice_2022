//
//  MoviesPosterCarrousel.swift
//  CiceTmdbApp
//
//  Created by Jorge Millan on 23/2/22.
//

import SwiftUI

struct MoviesPosterCarrousel: View {
    
    var title: String
    var moviesModel: [MoviesTVModelView]
    var isPoster: Bool
    var isMovie: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack{
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                Rectangle()
                    .fill(Color.cyan.opacity(0.3))
                    .frame(width: 50, height: 5)
            }
            .padding(.bottom, 20)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 20) {
                    ForEach(self.moviesModel){ movie in
                        NavigationLink {
                            if isMovie{
                                DetailMovieCoordinator.view(dto: DetailMovieCoordinatorDTO(dataId: movie.id ?? 0))
                            }else{
                                //DetailShowCoordinator.view()
                                DetailShowView(viewModel: DetailShowServerModel.stubbedDetailShow!)
                            }
                        } label: {
                            MoviePosterCell(model: movie, isPoster: self.isPoster)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                    }
                }
            }
        }
    }
}

struct MoviePosterCell: View {
    
    @ObservedObject var imageLoaderViewModel = ImageLoader()
    private var modelData: MoviesTVModelView
    var isPoster: Bool
    
    init(model: MoviesTVModelView, isPoster: Bool? = true){
        self.modelData = model
        self.isPoster = isPoster ?? false
        if isPoster ?? false {
            self.imageLoaderViewModel.loadImage(whit: modelData.posterUrl)
        }else{
            self.imageLoaderViewModel.loadImage(whit: modelData.backdropUrl)
        }
    }
    
    var body: some View{
        VStack{
            ZStack{
                if self.imageLoaderViewModel.image != nil{
                    Image(uiImage: self.imageLoaderViewModel.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                        .shadow(radius: 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.red, lineWidth: 1)
                        )
                        .loader(state: .ok)
                }else{
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.clear]),
                                             startPoint: .bottom,
                                             endPoint: .top))
                        .cornerRadius(8)
                        .loader(state: .loading)
                }
            }
            .frame(width: self.isPoster ? 240 : 270, height: self.isPoster ? 306 : 150)
            
            if !self.isPoster {
                Text(self.modelData.name ?? "")
                    .fontWeight(.semibold)
            }
        }
    }
}

//struct MoviesPosterCarrousel_Previews: PreviewProvider {
//    static var previews: some View {
//        MoviesPosterCarrousel(title: "Now playing",
//                              moviesModel: MoviesServerModel.stubbedMoviesNowPlaying,
//                                isPoster: true)
//    }
//}
