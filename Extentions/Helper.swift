//
//  Helper.swift
//  HR Project
//
//  Created by mac on 1/28/20.
//  Copyright © 2020 soudika. All rights reserved.
//

import UIKit

class Helper: NSObject {
    
    class func restartapp(){
        
        guard let window = UIApplication.shared.keyWindow else {return}
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        var vc : UIViewController
        if getApiToken()==nil {
            vc = sb.instantiateInitialViewController()!
        }else{
            vc = sb.instantiateViewController(withIdentifier: "main")
        }
        window.rootViewController = vc
        
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    class func saveAccessToken(token:String){
        
        let def = UserDefaults.standard
        def.setValue(token, forKey: "api_token")
        def.synchronize()
        
        restartapp()
    }
    class func getApiToken()->String?{
        let def = UserDefaults.standard
        return def.object(forKey: "api_token") as? String
    }
}
