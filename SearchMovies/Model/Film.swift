//
//  Film.swift
//  SearchMovies
//
//  Created by ahmet karadağ on 11.10.2024.
//

import Foundation
import SwiftUI

struct Film: Codable {
    
    let title: String
    let year: String
    let imdbIdi: String
    let type : String
    let poster: String
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.year = try container.decode(String.self, forKey: .year)
        self.imdbIdi = try container.decode(String.self, forKey: .imdbIdi)
        self.type = try container.decode(String.self, forKey: .type)
        self.poster = try container.decode(String.self, forKey: .poster)
    }
    }
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbIdi = "imdbID"
        case poster = "Poster"
    }
struct comingFilms: Codable {
    let filmler: [Film]
    private enum CodingKeys: String,CodingKey {
        
        case filmler = "Search"
    }
}

