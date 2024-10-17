//
//  FilmDetayViewModel.swift
//  SearchMovies
//
//  Created by ahmet karadağ on 17.10.2024.
//

import Foundation
import SwiftUI

class FilmDetayViewModel: ObservableObject {
    @Published var filmDetayi: FilmDetaylariViewModel?
    let downloaderClient = DownLoaderClient()
    
    
    func filmDetayiAl(imdbId: String){
        downloaderClient.filmDetayiniIndir(imdbId: imdbId) { (sonuc) in
            switch sonuc {
            case .success(let filmDetay):
                DispatchQueue.main.async {
                    self.filmDetayi = FilmDetaylariViewModel(detay: filmDetay)
                }
                
            case .failure(let hata):
                print(hata)
            }
        }
    }
}

struct FilmDetaylariViewModel{
    let detay: FilmDetay
    
    var title: String {
        detay.title
    }
    var year: String {
        detay.year
    }
    var poster: String {
        detay.poster
    }
    var imdbId: String {
        detay.imdbId
    }
    var director: String {
        detay.director
    }
    var writer: String {
        detay.writer
    }
    var awards: String {
        detay.awards
    }
    var plot: String {
        detay.plot
    }
    var imdbRating: String{
        detay.imdbRating
    }
}

