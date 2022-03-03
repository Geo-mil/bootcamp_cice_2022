/*

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import SwiftUI

struct DetailShowView: View {

    //@StateObject var viewModel = DetailShowViewModel()
    var viewModel: DetailShowServerModel
    @SwiftUI.Environment(\.presentationMode) var presenterMode
    
    var body: some View {
        ScrollView{
            VStack{
                headerView
                bodyView
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
        .onAppear{
            //self.viewModel.fetchData()
        }
    }
    
    var headerView: some View{
        ZStack(alignment: .topLeading) {
//            if self.viewModel.data?.posterUrl != nil{
//                ShowDetailImage(imageUrl: self.viewModel.data!.posterUrl)
//
//            }
            ShowDetailImage(imageUrl: self.viewModel.posterUrl)
            
            HStack{
                Button{
                    self.presenterMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
                .padding()
                .background(Color.white.opacity(0.7))
                .clipShape(Circle())
                .padding(EdgeInsets(top: 40, leading: 20, bottom: 0, trailing: 0))
                
                Spacer()
                
                Button {
                    //salvar peliculas como favoritas en BBDD (bien con firebase o en userDefault)
                } label: {
                    Image(systemName: "bookmark")
                }
                .padding()
                .background(Color.white.opacity(0.7))
                .clipShape(Circle())
                .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 20))

            }
            .foregroundColor(Color.red)
        }
    }
    
    var bodyView: some View{
        VStack(alignment: .leading, spacing: 30) {
            HStack{
                Spacer()
                Text(self.viewModel.name ?? "")
                    .font(.title)
                Spacer()
            }
            HStack{
                //Text(self.viewModel.firstAirDate ?? "")
                Spacer()
                Text("First Air").fontWeight(.heavy)
                Text(self.viewModel.yearText ?? "")
                Text("· Seasons").fontWeight(.heavy)
                Text(self.viewModel.seasonsNumberText ?? "")
                Spacer()
            }
            HStack{
                Spacer()
                Text("Episode run time").fontWeight(.heavy)
                Text(self.viewModel.maxDurationText ?? "")
                Spacer()
            }
            Text(self.viewModel.overview ?? "")
                .font(.title2)
            HStack{
                if !(self.viewModel.ratingText.isEmpty ?? false){
                    Text(self.viewModel.ratingText ?? "")
                        .foregroundColor(.red)
                }
                Text(self.viewModel.scoreText ?? "")
                Spacer()
            }
            Text("Starring")
                .font(.title)
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: false){
//                if self.viewModel.cast != nil && !(self.viewModel.cast?.isEmpty ?? false){
//                    MovieCastCarrouselView(model: self.viewModel.cast ?? [])

                }
            }

/*            HStack(alignment: .top, spacing: 4) {
                if self.viewModel.crew != nil && !(self.viewModel.crew?.isEmpty ?? false){
                    VStack(alignment: .leading, spacing: 4) {
                        if self.viewModel.data?.directors != nil && !(self.viewModel.data?.directors?.isEmpty ?? false){
                            Text("Directors")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top)
                            ForEach((self.viewModel.data?.directors?.prefix(2))!){ item in
                                Text(item.name ?? "")
                            }
                        }

                        if self.viewModel.data?.producers != nil && !(self.viewModel.data?.producers?.isEmpty ?? false){
                            Text("Producer[s]")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top)
                            ForEach((self.viewModel.data?.producers?.prefix(2))!){ item in
                                Text(item.name ?? "")
                            }
                        }

                        if self.viewModel.data?.screenWritters != nil && !(self.viewModel.data?.screenWritters?.isEmpty ?? false){
                            Text("Writer[s]")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top)
                            ForEach((self.viewModel.data?.screenWritters?.prefix(2))!){ item in
                                Text(item.name ?? "")
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }*/

//            if self.viewModel.data?.youtubeTrailers != nil && !(self.viewModel.data?.youtubeTrailers?.isEmpty ?? false){
//                VStack(alignment: .leading, spacing: 20) {
//                    Text("Trailers")
//                        .font(.title)
//                        .fontWeight(.bold)
//                    ForEach((self.viewModel.data?.youtubeTrailers)!) { item in
//                        Button{
//                            self.selectedTrailer = item
//                        }label: {
//                            HStack{
//                                Text(item.name ?? "")
//                                Spacer()
//                                Image(systemName: "play.circle.fill")
//                                    .foregroundColor(.red)
//                            }
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                    }
//                }
//            }
//        }
       
    }
    
    
}

struct ShowDetailImage: View {
    
    let imageUrl: URL
    @StateObject private var imageLoaderVM = ImageLoader()
    
    var body: some View{
        ZStack{
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .cornerRadius(8)
                .shadow(radius: 10)
            if self.imageLoaderVM.image != nil {
                Image(uiImage: self.imageLoaderVM.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(8)
                    .shadow(radius: 10)
            }
        }
        .onAppear {
            self.imageLoaderVM.loadImage(whit: imageUrl)
        }
    }
}


struct DetailShowView_Previews: PreviewProvider {
    static var previews: some View{
        
            DetailShowView(viewModel: DetailShowServerModel.stubbedDetailShow!)
        
    }
}
