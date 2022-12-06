//
//  PopulerMoviesViewModel.swift
//  movee
//
//  Created by Gunes, Busra on 26.11.2022.
//

import Foundation
import Alamofire

public typealias VoidClosure = (() -> Void)

class PopulerMoviesViewModel {
    var populerMovies = [PopulerMovies?]()
    var didSuccessFetchData: VoidClosure?

    func fetchPopulerMovies() {
        NetworkManager.shared.request(config:
            .init(
                url: ServiceURL.populerMoviesURL,
                method: .get,
                encoding: URLEncoding.default),
                responseObjectType: PopulerMoviesResponseModel.self) { [weak self] response in
            switch response {
                case .success(let data):
                self?.populerMovies = data.results ?? []
                self?.didSuccessFetchData?()
                case .failure(let error):
                print("fetch populer movies error", error)
            }
        }
    }
}
