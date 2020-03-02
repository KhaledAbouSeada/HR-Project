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

enum CheckInOutEndpoints: APIConfiguration {
    
    case checkIn (date: String)
    case checkOut (date: String)
    
    var path: String {
        switch self {
        case .checkIn: return "/checkIn"
        case .checkOut: return "/checkOut"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .checkOut , .checkIn: return .post
        }
    }
    
    var paramters: Parameters? {
        switch self {
        case .checkIn(let date):
            return[K.Constanst.date:date]
        case .checkOut(let date):
            return[K.Constanst.date:date]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try  K.baseUrl.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.method = method
        
                urlRequest.setValue(K.ContentType.json.rawValue, forHTTPHeaderField: K.HTTPHeaderField.acceptType.rawValue)
                urlRequest.setValue(K.ContentType.json.rawValue, forHTTPHeaderField: K.HTTPHeaderField.contentType.rawValue)
                urlRequest.setValue("\(K.ContentType.bearer.rawValue) eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjMzMTYzNTUzZGFhZTUxMGUyYWZlMzIwOGY2MDk4Yjc1Y2UxNjhmYzBhNGZiNTVkMDBkMzFhNDc0Y2UzM2FhZjQzOTBmNmViMmNjYjRkOGI4In0.eyJhdWQiOiIxIiwianRpIjoiMzMxNjM1NTNkYWFlNTEwZTJhZmUzMjA4ZjYwOThiNzVjZTE2OGZjMGE0ZmI1NWQwMGQzMWE0NzRjZTMzYWFmNDM5MGY2ZWIyY2NiNGQ4YjgiLCJpYXQiOjE1ODAzNzYzMjgsIm5iZiI6MTU4MDM3NjMyOCwiZXhwIjoxNjExOTk4NzI4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.L_XFwjXNET6nU8Pt1W-UC4PxMYboDUqd_CUqCHqFVdpx6db8zZijQZOyI16cAFxe2zuSXiG-vG0gBO6d1jHeLZ0nD0nAPzlJqchaGS3B33bJKt2ZmtRXdRGd4oeLKMtOEKRu587N6-ujLBHpO8kUaWK7Uai6W1ojpjqCCRnT3trAWU0CRo4dtrzTy3QWjt9Pv_XPyTIPzgIvSUSD7imR67EY2fLbaMUAtl77oG8bDxHOSxCMZ2gMwXy2kLVH8Nn-MwdSgJrhaNCuWtV37gv8tMtXJoUgavr7RB6i9y_6Qfx00ZGOABYo4fdLdX-9DiOL0hEZkVwXqX7aWk6RhuO5NqGwM5ajVZ8tYjH2pdfzUSFPJgSBrOs0igqOIC9WjLJ6fGgTwxlSNj0Nw-CDIcBH2jpVNQZBQnvu8KgKapRMiOM0DvgZA0nQWT_0kxubM9qsGRRcpOuRzqEuNOJ-9ViO45OfCGr1-txA-zarWsZmfcka1cdyeUDKuU4XNDr1F-fRu86n6ZLYopQrpC9eMykRFH6sGmVxBufw-x4XUpwEL2h5OKQ_r7b98oBFf9MsJExlIL1seBI76wT_9O7II4UPBU9UIpd5i3OBzNK0cRO7UALQOgUUDI9YeGWuEdVXWY89Dn519pgzt3hRhYC38oPl4AYLM6AJxgVaFJrMrPv3wHk", forHTTPHeaderField: K.HTTPHeaderField.authentication.rawValue)
        
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

