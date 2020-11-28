//
//  APIRouter.swift
//  Alamofire_Test
//
//  Created by 장서영 on 2020/11/25.
//

import Foundation
import Alamofire


enum APIRouter : URLRequestConvertible {
    
    case login(email:String, password : String)
    case posts
    case post(id : Int)
    
    // HTTPMethod
    private var method : HTTPMethod {
        switch self {
        case .login: return .post
        case .posts:
            return .get
        case .post(id: let id):
            return .get
        }
    }
    
    // Path
    private var path: String {
        switch  self {
        case .login:
            return "/login"
        case .posts:
            return "/posts"
        case .post(let id):
            return "/posts/\(id)"
        }
    }
    
    private var parameters: Parameters?{
        switch  self {
        case .login(let email, let password):
            return [K.APIParameterKey.email: email]
        default:
            <#code#>
        }
    }
    

    func asURLRequest() throws -> URLRequest {
       
    }
    
    
}
