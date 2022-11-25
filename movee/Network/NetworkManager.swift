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
    func request<T: Decodable>(url: ServiceURL,
                               method: HTTPMethod,
                               parameters: Parameters?,
                               encoding: ParameterEncoding,
                               responseObjectType: T.Type,
                               success: @escaping (T) -> Void,
                               failure: @escaping (AFError) -> Void) {
        let requestURL = Api.baseURL + url.rawValue + "?" + Api.apiKeyParam
        let request = AF.request(requestURL,
                                 method: method,
                                 parameters: parameters,
                                 encoding: encoding,
                                 headers: nil)
        request
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                    case .success(let data):
                    success(data)
                    case .failure(let error):
                    failure(error)
                }
            }
    }
}
