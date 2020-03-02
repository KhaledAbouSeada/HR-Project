//
//  API.swift
//  HR Project
//
//  Created by mac on 1/28/20.
//  Copyright © 2020 soudika. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class API: NSObject {
    
    //    var array : failFive] = [failFive]()
    
    class func login(email:String , password:String , completion: @escaping (_ error:Error?,_ success:Bool , _ errormessage : String?, _ passwordmessage:String?)->Void){
        
        //        let loginUrl = "http://192.168.1.172:5000/api/login"
        let parameters = ["email": email, "password": password]
        
        AF.request(Network.endPoints.login.url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            
            .validate(statusCode: 200...450)
            .responseJSON { response in
                switch response.result{
                case .failure(let error):
                    completion(error, false, nil, nil)
                    print(error.localizedDescription)
                    print("APIIII Cant Request")
                case .success(let value):
                    guard let data = response.data else { return }
                    let Decoder = JSONDecoder()
                    do{
                        let users = try Decoder.decode(loginModel.self, from: data)
                        print(users)
                        if let errorCode = users.code {
                            if errorCode == 5000 {
                                if let mailerror = users.errors?.email?[0] {
                                    completion(nil , true , mailerror , nil )
                                    return
                                }
                            }
                            if errorCode == 5000 {
                                if let passworderror = users.errors?.password?[0] {
                                    completion(nil , true , nil , passworderror)
                                    return
                                }
                            } else if errorCode == 401 {
                                guard let unavailable = users.message else {return}
                                completion(nil , true , unavailable , nil)
                            } else {
                                let json = JSON(value)
                                if let api_token = json["token"].string{
                                    
                                    Helper.saveAccessToken(token: api_token)
                                    completion(nil , true , nil , nil)
                                }
                            }
                        }
                    }catch let error {
                        print(error)
                    }
                }
        }
    }
    
    class func RegistraionEmployee (firstname:String , lastname:String , arabicname:String , email:String , phonenumber:String , maritalstatus:String , gender:String ,employeetype:String ,  hiringdate:String , departmentid:Int , cityid:Int , countryid:Int , salary:Int , completion: @escaping (_ error:Error? , _ success:Bool)->Void){
        
        let parameters: [String: Any] = ["first_name": firstname , "last_name": lastname , "arabic_name": arabicname , "email": email , "phone": phonenumber , "marital_status": maritalstatus , "gender": gender , "employee_type": employeetype , "hiring_date": hiringdate , "department_id": departmentid , "city_id": cityid , "country_id": countryid , "salary": salary ]
        print(parameters)
        print(Network.endPoints.registration.url)
        AF.request(Network.endPoints.registration.url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: ["Content-Type":"application/x-www-form-urlencoded", "Authorization":"Bearer \(Helper.getApiToken() ?? "")"])
            .validate(statusCode: 200...600)
            .responseJSON { response in
                
                switch response.result{
                case .failure(let error):
                    print(error)
                    print("Registration Cant Complete")
                case .success( _):
                    guard let data = response.data else {return}
                    print(data)
//                    if let returnData = String(data: data, encoding: .utf8) {
//                        print(returnData)
//                    }
                    let decoder = JSONDecoder()
                    do{
                        let employees = try decoder.decode(RegistrationModel.self, from: data)
                        print(employees)
                        if let code = employees.code{
                            if code == 200{
                                completion(nil , true)
                                return
                            }
                        }
                    }catch let error{
                        print(error)
                    }
                }
        }
        
    }
    
    class func Requestrequests(completion: @escaping (_ error:Error? , _ success:Bool , _ Dataa:[Requests]?)->Void){
        
//        let headers = ["Authorization": "Bearer \(Helper.getApiToken() ?? "")"]
        
        AF.request(Network.endPoints.requests.url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
        
            .responseJSON { response in
                switch response.result{
                case .failure(let error):
                    print(error.localizedDescription)
                    print("Cant Get The Requests")
                case .success(let value):
                    print(value)
                    guard let data = response.data else {return}
                    let decoder = JSONDecoder()
                    do{
                        let requests = try decoder.decode(RequestsModel.self, from: data)
                        completion(nil, true, requests.data?.requests)
                    }catch let error{
                        print(error)
                    }
                }
        }
    }
    class func ApprovedRequests(employee_id:Int,status:String,description:String,from:String,to:String,type:String ,reply:String ,id:Int, completion: @escaping (_ error:Error? , _ success:Bool)->Void){
        
        let parameters: [String: Any] = ["employee_id": employee_id, "status": status, "description": description, "from": from, "to": to, "type": type, "reply": reply, "id": id]
//        let headers = ["Authorization": "Bearer \(Helper.getApiToken() ?? "")"]
        
//        print(Network.endPoints.approved(employee_id: employee_id, status: "Approved", description: description, from: from, to: to, type: type, reply: reply, id: id).url)
        
        AF.request(Network.endPoints.approved(employee_id: employee_id, status: status, description: description, from: from, to: to, type: type, reply: reply, id: id).url , method: .put, parameters:parameters , encoding: URLEncoding.default, headers: nil)
        
            .responseJSON{ response in
                switch response.result{
                    
                case .success(let value):
                    print(value)
                    completion(nil,true)
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(error, false)
                }
        }
    }
    
    class func requestCheckIn(date: String , completion: @escaping (_ error:Error? ,_ success:Bool?)->Void){
        
        let params = ["date": date]
//        let headers = ["Authorization": "Bearer \(Helper.getApiToken() ?? "")"]
        
        AF.request(Network.endPoints.checkIn.url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result{
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(error,false)
                case .success(let value):
                    print(value)
                    completion(nil,true)
                }
        }
    }
    
    class func requestCheckOut(date: String , completion: @escaping (_ error:Error? ,_ success:Bool?)->Void){
        
        let params = ["date": date]
//        let headers = ["Authorization": "Bearer \(Helper.getApiToken() ?? "")"]
        
        AF.request(Network.endPoints.checkOut.url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result{
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(error,false)
                case .success(let value):
                    print(value)
                    completion(nil,true)
                }
        }
    }

}
    


