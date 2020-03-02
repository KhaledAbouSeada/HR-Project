//
//  NetworkConstants.swift
//  HR Project
//
//  Created by mac on 2/16/20.
//  Copyright © 2020 soudika. All rights reserved.
//

import Foundation

struct K {
    struct baseUrl {
        static let baseUrl = "http://192.168.1.172:5000/api"
    }
    
    struct Constanst {
        static let email = "email"
        static let password = "password"
        static let firstname = "first_name"
        static let lastname = "last_name"
        static let arabicname = "arabic_name"
        static let phonenumber = "phone"
        static let maritalstatus = "marital_status"
        static let gender = "gender"
        static let employeetype = "employee_type"
        static let hiringdate = "hiring_date"
        static let departmentid = "department_id"
        static let cityid = "city_id"
        static let countryid = "country_id"
        static let salary = "salary"
        static let employee_id = "employee_id"
        static let status = "status"
        static let description = "description"
        static let from = "from"
        static let to = "to"
        static let type = "type"
        static let reply = "reply"
        static let id = "id"
        static let date = "date"
        static let approved = "Approved"
        static let declined = "Rejected"
    }
    
    enum HTTPHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    enum ContentType: String {
        case json = "application/json"
        case bearer = "Bearer"
        case application = "application/x-www-form-urlencoded"
    }
}

