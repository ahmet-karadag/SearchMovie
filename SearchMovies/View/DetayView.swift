//
//  DetayView.swift
//  SearchMovies
//
//  Created by ahmet karadağ on 17.10.2024.
//

import SwiftUI

struct DetayView: View {
    let imdbId: String
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    var body: some View {
        VStack(alignment: .leading,spacing: 5){
            
            HStack{
                Spacer()
                OzelImage(url: filmDetayViewModel.filmDetayi?.poster ?? "film posteri gösterilecek")
                    .frame(width: UIScreen.main.bounds.width * 0.7,height: UIScreen.main.bounds.height * 0.3,alignment: .center)
                Spacer()
            }
            Text(filmDetayViewModel.filmDetayi?.title ?? "film adı")
                .font(.title)
                .foregroundStyle(.red)
            Text(filmDetayViewModel.filmDetayi?.plot ?? "film plotu gösterilecek")
                .padding()
            
            Text("Yönetmen:\(filmDetayViewModel.filmDetayi?.director ?? "film directoru")")
                .padding()
            Text("Yazar:\(filmDetayViewModel.filmDetayi?.writer ?? "film yazarı")")
                .padding()
            Text("Ödüller:\(filmDetayViewModel.filmDetayi?.awards ?? "film ödülleri")")
                .padding()
            Text("Yılı:\(filmDetayViewModel.filmDetayi?.year ?? "film çıkış tarihi")")
                .padding()
            Text("ImdbRating:\(filmDetayViewModel.filmDetayi?.imdbRating ?? "imdb puanı")")
                .padding()
            Spacer()
        }.onAppear(perform: {
            self.filmDetayViewModel.filmDetayiAl(imdbId: imdbId)
        })
    }
}

#Preview {
    DetayView(imdbId: "detay")
}
