//
//  APIConfigration.swift
//  HR Project
//
//  Created by mac on 2/16/20.
//  Copyright © 2020 soudika. All rights reserved.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var path: String { get }
    var method: HTTPMethod { get }
    var paramters: Parameters? { get }
}

