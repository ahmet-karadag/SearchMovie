//
//  OzelImage.swift
//  SearchMovies
//
//  Created by ahmet karadağ on 16.10.2024.
//

import SwiftUI

struct OzelImage: View {
    let url: String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url: String) {
        self.url = url
        self.imageDownloaderClient.gorselIndir(url: url)
    }
    var body: some View {
        if let data = self.imageDownloaderClient.indirilenGorsel {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }else {
            return Image("placeholder")
                .resizable()
            
        }
    }
}

#Preview {
    OzelImage(url: "https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg")
}
