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

enum EndPoints: APIConfiguration {
    
    
    case login(email:String,password:String)
    case registration(firstname:String , lastname:String , arabicname:String , email:String , phonenumber:String , maritalstatus:String , gender:String ,employeetype:String ,  hiringdate:String , departmentid:Int , cityid:Int , countryid:Int , salary:Int)
    case requests
    case checkIn (date: String)
    case checkOut (date: String)
    case approved(employee_id:Int , status:String , description:String , from:String , to:String , type:String , reply:String , id:Int)
    
    var path: String {
        switch self {
        case .login: return "\(K.baseUrl.baseUrl)login"
        case .registration: return "\(K.baseUrl.baseUrl)employees"
        case .requests: return "\(K.baseUrl.baseUrl)requests"
        case .checkIn: return "\(K.baseUrl.baseUrl)checkIn"
        case .checkOut: return "\(K.baseUrl.baseUrl)checkOut"
        case .approved(let employee_id , let status ,let description,let from,let to,let type,let reply,let id): return "\(K.baseUrl.baseUrl)\(employee_id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login, .registration , .checkOut , .checkIn: return .post
        case .requests: return .get
        case .approved(let employee_id, let status, let description, let from, let to, let type, let reply, let id):return .put
        }
    }
    
    var paramters: Parameters? {
        switch self {
        case .login( let email, let password):
            return [K.Constanst.email: email, K.Constanst.password: password]
        case .registration (let firstname ,let lastname,let arabicname , let email , let phonenumber , let maritalstatus , let gender , let employeetype , let hiringdate , let departmentid , let cityid , let countryid , let salary):
            return [K.Constanst.firstname:firstname , K.Constanst.lastname:lastname , K.Constanst.arabicname:arabicname , K.Constanst.email:email , K.Constanst.phonenumber:phonenumber , K.Constanst.maritalstatus:maritalstatus , K.Constanst.employeetype:employeetype , K.Constanst.gender:gender , K.Constanst.hiringdate:hiringdate , K.Constanst.departmentid:departmentid , K.Constanst.cityid:cityid , K.Constanst.countryid:countryid , K.Constanst.salary:salary]
        case .requests:return nil
        case .checkIn(let date):
            return[K.Constanst.date:date]
        case .checkOut(let date):
            return[K.Constanst.date:date]
        case .approved(let employee_id, let status, let description, let from, let to, let type, let reply, let id):return [K.Constanst.employee_id:employee_id , K.Constanst.description:description , K.Constanst.from:from , K.Constanst.to:to , K.Constanst.type:type , K.Constanst.reply:reply , K.Constanst.id:id]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try  K.baseUrl.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.method = method
        
//        urlRequest.setValue(K.ContentType.json.rawValue, forHTTPHeaderField: K.HTTPHeaderField.acceptType.rawValue)
//        urlRequest.setValue(K.ContentType.json.rawValue, forHTTPHeaderField: K.HTTPHeaderField.contentType.rawValue)
//        urlRequest.setValue(K.ContentType.bearer.rawValue, forHTTPHeaderField: Helper.getApiToken() ?? "")
        
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

