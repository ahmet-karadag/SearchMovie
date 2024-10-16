//
//  ContentView.swift
//  SearchMovies
//
//  Created by ahmet karadağ on 11.10.2024.
//

import SwiftUI

struct FilmListeView: View {
    @ObservedObject var filmListeViewModel: FilmListViewModel
    @State var aranacakFilm = ""
    
    init() {
        self.filmListeViewModel = FilmListViewModel()

    }
    var body: some View {
        NavigationView {
            VStack{
                TextField("aranacak film", text: $aranacakFilm, onCommit: {
                    self.filmListeViewModel.filmAramasiYap(filmIsmi: aranacakFilm)
                    
                }).padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.title2)
                
                List(filmListeViewModel.filmler, id: \.imdbId){ film in
                    HStack{
                        OzelImage(url: film.poster)
                            .frame(width: 100,height: 130)
                        VStack(alignment: .leading){
                            Text(film.title)
                                .font(.title2)
                                .foregroundStyle(.orange)
                            Text(film.year)
                                .foregroundStyle(.red)
                        }
                    }
                }
                .navigationTitle("Search Movies")
            }
        }
    }
}

#Preview {
    FilmListeView()
}
