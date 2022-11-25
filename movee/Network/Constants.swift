//
//  Constants.swift
//  movee
//
//  Created by Gunes, Busra on 24.11.2022.
//

import Foundation

struct Api {
    static let baseURL = "https://api.themoviedb.org/3"
    static let KEY = "e301bebae1e61423e7571c90f80c3f85"
    static let SCHEME = "https"
    static let HOST = "api.themoviedb.org"
    static let PATH = "/3"
    static let apiKeyParam = "api_key=\(KEY)&language=en-US&page=1"
}

enum ServiceURL: String {
    case populerMoviesURL = "/3/movie/popular"
}
