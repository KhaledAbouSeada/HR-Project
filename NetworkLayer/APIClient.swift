//
//  APIClient.swift
//  HR Project
//
//  Created by mac on 2/16/20.
//  Copyright © 2020 soudika. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {

    static func login(email:String , password:String , completion:@escaping (Result<loginModel,AFError>)->Void){
        AF.request(LoginEndpoint.login(email: email, password: password)).responseDecodable(decoder: JSONDecoder()) { (response: DataResponse<loginModel,AFError>) in
            
            switch response.result{
                
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
                
//                switch response.result{
//                case .failure(let error):
//                    completion(error, false, nil, nil)
//                    print(error.localizedDescription)
//                    print("APIIII Cant Request")
//                case .success(let value):
//                    guard let data = response.data else { return }
//                    let Decoder = JSONDecoder()
//                    do{
//                        let users = try Decoder.decode(loginModel.self, from: data)
//                        print(users)
//                        if let errorCode = users.code {
//                            if errorCode == 5000 {
//                                if let mailerror = users.errors?.email?[0] {
//                                    completion(nil , true , mailerror , nil )
//                                    return
//                                }
//                            }
//                            if errorCode == 5000 {
//                                if let passworderror = users.errors?.password?[0] {
//                                    completion(nil , true , nil , passworderror)
//                                    return
//                                }
//                            } else if errorCode == 401 {
//                                guard let unavailable = users.message else {return}
//                                completion(nil , true , unavailable , nil)
//                            } else {
//                                let json = JSON(value)
//                                if let api_token = json["token"].string{
//
//                                    Helper.saveAccessToken(token: api_token)
//                                    completion(nil , true , nil , nil)
//                                }
//                            }
//                        }
//                    }catch let error {
//                        print(error)
//                    }
//                }
            
            }
        }
    }
    static func RegistraionEmployee (firstname:String , lastname:String , arabicname:String , email:String , phonenumber:String , maritalstatus:String , gender:String ,employeetype:String ,  hiringdate:String , departmentid:Int , cityid:Int , countryid:Int , salary:Int , completion: @escaping (Result<RegistrationModel,AFError>)->Void){
        
        AF.request(RegestirationEndpoint.registration(firstname: firstname, lastname: lastname, arabicname: arabicname, email: email, phonenumber: phonenumber, maritalstatus: maritalstatus, gender: gender, employeetype: employeetype, hiringdate: hiringdate, departmentid: departmentid, cityid: cityid, countryid: countryid, salary: salary)).responseDecodable { (response: DataResponse<RegistrationModel, AFError>) in
            switch response.result {
                
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    static func getrequests(completion: @escaping (Result<RequestsModel,AFError>)->Void){
        AF.request(RequestsEndpoints.requests).responseDecodable { (response: DataResponse<RequestsModel, AFError>) in
            switch response.result{
                
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    static func approvedrequests(employee_id:Int, status:String, description:String, from:String, to:String, type:String, reply:String, id:Int  , completion: @escaping (Result<RequestsModel,AFError>)->Void){
        
        AF.request(ApprovedEndpoints.approved(employee_id: employee_id, status: status, description: description, from: from, to: to, type: type, reply: reply, id: id)).responseDecodable { (response: DataResponse<RequestsModel, AFError>) in
            switch response.result{
                
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    static func Attendancein(date:String, completion: @escaping (Result<RequestsModel,AFError>)->Void){
        AF.request(CheckInOutEndpoints.checkIn(date: date)).responseDecodable { (response: DataResponse<RequestsModel, AFError>) in
            switch response.result{
                
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    static func Attendanceout(date:String, completion: @escaping (Result<RequestsModel,AFError>)->Void){
        AF.request(CheckInOutEndpoints.checkOut(date: date)).responseDecodable { (response: DataResponse<RequestsModel, AFError>) in
            switch response.result{
                
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
