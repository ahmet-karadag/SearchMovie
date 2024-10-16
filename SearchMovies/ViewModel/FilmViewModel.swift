//
//  FilmViewModel.swift
//  SearchMovies
//
//  Created by ahmet karadağ on 15.10.2024.
//

import Foundation

class FilmListViewModel: ObservableObject {
    
    //viewlerde kullanabilmek için published yaparak yayınladık(aktardık gibi) ve viewda kullanırken verimizi observedobject yapmamız gerekiyor.
    
    @Published var filmler = [FilmViewModel]()
    let downloaderClient = DownLoaderClient()
    
    func filmAramasiYap(filmIsmi: String) {
        downloaderClient.filmleriIndir(search: filmIsmi) { (sonuc) in
            switch sonuc {
            case .failure(let hata):
                print(hata)
            case.success(let filmDizisi):
                if let filmDizisi = filmDizisi {
                    DispatchQueue.main.async {
                        self.filmler = filmDizisi.map(FilmViewModel.init)
                    }
                }
            }
        }
    }
}

struct FilmViewModel {
    let film: Film//kullana bilmek için modeli aldık.
    
    var title: String {
        film.title
    }
    var poster: String {
        film.poster
    }
    var year: String {
        film.year
    }
    var imdbId: String {
        film.imdbId
    }
}
