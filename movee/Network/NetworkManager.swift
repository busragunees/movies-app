//
//  NetworkManager.swift
//  movee
//
//  Created by Gunes, Busra on 24.11.2022.
//

import Foundation
import Alamofire

class NetworkManager {
    typealias OnSuccess<T: Codable> = ((T?) -> Void)?
    static var shared = NetworkManager()
    func request<T: Decodable>(config: RequestConfig,
                               responseObjectType: T.Type,
                               completion: @escaping (Result<T, AFError>) -> Void) {
        let requestURL = Api.baseURL + config.url.rawValue + "?" + Api.apiKeyParam
        let request = AF.request(requestURL,
                                 method: config.method,
                                 parameters: config.parameters,
                                 encoding: config.encoding,
                                 headers: nil)
        request
            .validate()
            .responseDecodable(of: T.self) { response in
                completion(response.result)
            }
    }
}
