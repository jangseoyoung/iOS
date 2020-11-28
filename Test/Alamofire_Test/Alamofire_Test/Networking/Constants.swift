//
//  Constants.swift
//  Alamofire_Test
//
//  Created by 장서영 on 2020/11/25.
//

import Foundation
import Alamofire

struct K {
    struct ProductionServer {
        static let baseURL = "http://api.medium.com/v1"
    }
    struct APIParameterKey {
        static let password = "password"
        static let email = "email"
    }
}

enum HTTPHeaderField : String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}

protocol APIConfiguration: URLRequestConvertible {
    var method : HTTPMethod{ get }
    var path : String{ get }
    var parameters : Parameters?{ get }
}
