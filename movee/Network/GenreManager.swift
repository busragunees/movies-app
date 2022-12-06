//
//  GenreManager.swift
//  movee
//
//  Created by Gunes, Busra on 6.12.2022.
//

import Foundation
import Alamofire

class GenreManager {
    static let sharedInstance = GenreManager()
    var genreTypes = [Genres?]()

    func fetchGenreTypes() {
        NetworkManager.shared.request(config:
            .init(
                url: ServiceURL.genreURL,
                method: .get,
                parameters: ["language": "US"],
                encoding: URLEncoding.default),
                responseObjectType: MovieGenresResponseModel.self) { response in
            switch response {
                case .success(let data):
                self.genreTypes = data.genres ?? []
                print("genre response", data.genres as Any)
                case .failure(let error):
                print("fetch genre types error", error)
            }
        }
    }
}
