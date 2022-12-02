//
//  PopulerMoviesViewModel.swift
//  movee
//
//  Created by Gunes, Busra on 26.11.2022.
//

import Foundation
import Alamofire

protocol PopulerMoviesViewModelProtocol {
    func fetchPopulerMovies(items: [PopulerMovies]?)
}

class PopulerMoviesViewModel {
    var populerMovies = [PopulerMovies]()
    var viewDelegate: PopulerMoviesViewModelProtocol?
    func fetchPopulerMovies() {
        NetworkManager.shared.request(config:
            .init(
                url: ServiceURL.populerMoviesURL,
                method: .get,
                encoding: URLEncoding.default),
                responseObjectType: PopulerMoviesResponseModel.self) { [weak self] response in
            switch response {
                case .success(let data):
                self?.viewDelegate?.fetchPopulerMovies(items: data.results)
                print("data", data.results as Any)
                case .failure(let error):
                print("fetch populer movies error", error)
            }
        }
    }
}
