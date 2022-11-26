//
//  RequestConfig.swift
//  movee
//
//  Created by Gunes, Busra on 26.11.2022.
//

import Foundation
import Alamofire

struct RequestConfig {
    var url: ServiceURL
    var method: HTTPMethod
    var parameters: Parameters?
    var encoding: ParameterEncoding
}
