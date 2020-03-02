//
//  Endpoints.swift
//  HR Project
//
//  Created by mac on 2/16/20.
//  Copyright © 2020 soudika. All rights reserved.
//

//
//  EndPoint.swift
//  api
//
//  Created by mac on 2/10/20.
//  Copyright © 2020 soudika. All rights reserved.
//

import Foundation
import Alamofire

enum LoginEndpoint: APIConfiguration {
    
    
    case login(email:String,password:String)
    
    var path: String {
        switch self {
        case .login: return "/login"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login: return .post
        }
    }
    
    var paramters: Parameters? {
        switch self {
        case .login( let email, let password):
            return [K.Constanst.email: email, K.Constanst.password: password]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try  K.baseUrl.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.method = method
        
        urlRequest.setValue(K.ContentType.json.rawValue, forHTTPHeaderField: K.HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(K.ContentType.json.rawValue, forHTTPHeaderField: K.HTTPHeaderField.contentType.rawValue)
        
        print(urlRequest)
        
        if let paramters = paramters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: paramters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
    
}

