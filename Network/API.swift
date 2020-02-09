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
        
        Alamofire.request(Network.endPoints.login.url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            
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
        
        let parameters: [String: Any] = ["first_name": firstname , "last_name": lastname , "arabic_name": arabicname , "email": email , "phone": phonenumber , "marital_status": maritalstatus , "gender": gender , "employee_type": employeetype , "hiring_date": hiringdate , "department_id": departmentid , "city_id": cityid , "country_id": countryid , "salary": salary]
        print(parameters)
        print(Network.endPoints.registration.url)
        Alamofire.request(Network.endPoints.registration.url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: ["Content-Type": "application/json", "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjMzMTYzNTUzZGFhZTUxMGUyYWZlMzIwOGY2MDk4Yjc1Y2UxNjhmYzBhNGZiNTVkMDBkMzFhNDc0Y2UzM2FhZjQzOTBmNmViMmNjYjRkOGI4In0.eyJhdWQiOiIxIiwianRpIjoiMzMxNjM1NTNkYWFlNTEwZTJhZmUzMjA4ZjYwOThiNzVjZTE2OGZjMGE0ZmI1NWQwMGQzMWE0NzRjZTMzYWFmNDM5MGY2ZWIyY2NiNGQ4YjgiLCJpYXQiOjE1ODAzNzYzMjgsIm5iZiI6MTU4MDM3NjMyOCwiZXhwIjoxNjExOTk4NzI4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.L_XFwjXNET6nU8Pt1W-UC4PxMYboDUqd_CUqCHqFVdpx6db8zZijQZOyI16cAFxe2zuSXiG-vG0gBO6d1jHeLZ0nD0nAPzlJqchaGS3B33bJKt2ZmtRXdRGd4oeLKMtOEKRu587N6-ujLBHpO8kUaWK7Uai6W1ojpjqCCRnT3trAWU0CRo4dtrzTy3QWjt9Pv_XPyTIPzgIvSUSD7imR67EY2fLbaMUAtl77oG8bDxHOSxCMZ2gMwXy2kLVH8Nn-MwdSgJrhaNCuWtV37gv8tMtXJoUgavr7RB6i9y_6Qfx00ZGOABYo4fdLdX-9DiOL0hEZkVwXqX7aWk6RhuO5NqGwM5ajVZ8tYjH2pdfzUSFPJgSBrOs0igqOIC9WjLJ6fGgTwxlSNj0Nw-CDIcBH2jpVNQZBQnvu8KgKapRMiOM0DvgZA0nQWT_0kxubM9qsGRRcpOuRzqEuNOJ-9ViO45OfCGr1-txA-zarWsZmfcka1cdyeUDKuU4XNDr1F-fRu86n6ZLYopQrpC9eMykRFH6sGmVxBufw-x4XUpwEL2h5OKQ_r7b98oBFf9MsJExlIL1seBI76wT_9O7II4UPBU9UIpd5i3OBzNK0cRO7UALQOgUUDI9YeGWuEdVXWY89Dn519pgzt3hRhYC38oPl4AYLM6AJxgVaFJrMrPv3wHk"])
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
    
    //    class func requestCheckIn(date: String , completion: @escaping (_ error:Error? ,_ success:Bool?)->Void){
    //
    //        let params = ["date": date]
    //        let headers = ["Authorization": "Bearer \(Helper.getApiToken() ?? "")"]
    //
    //        Alamofire.request(Network.endPoints.checkIn.url, method: .post, parameters: params, encoding: URLEncoding.default, headers: headers)
    //            .responseJSON { response in
    //                switch response.result{
    //                case .failure(let error):
    //                    print(error)
    //                case .success(let value):
    //                    guard let data = response.data else {return}
    //                    let decoder = JSONDecoder()
    //                }
    //        }
    //    }
}
