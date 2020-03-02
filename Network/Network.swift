//
//  Network.swift
//  HR Project
//
//  Created by mac on 1/29/20.
//  Copyright © 2020 soudika. All rights reserved.
//

import Foundation

class Network {
    
    
    
    enum endPoints {
        static let baseUrl = "http://192.168.1.172:5001/api/"
        case login
        case registration
        case requests
        case checkIn
        case checkOut
        case approved(employee_id:Int , status:String , description:String , from:String , to:String , type:String , reply:String , id:Int)
        
        
        var stringvalue : String {
            
            switch self {
            case .login:return  ("\(Network.endPoints.baseUrl)login")
            case .registration:return("\(Network.endPoints.baseUrl)employees")
            case .requests:return ("\(Network.endPoints.baseUrl)requests")
            case .checkIn:return ("\(Network.endPoints.baseUrl)checkIn")
            case .checkOut:return ("\(Network.endPoints.baseUrl)checkOut")
            case .approved(let employee_id, _, _, _, _,  _ , _ , _):
                return "\(Network.endPoints.baseUrl)requests/\(employee_id)"
            }
        }
        var url : URL {
            return URL(string:stringvalue)!
        }
    }
}
