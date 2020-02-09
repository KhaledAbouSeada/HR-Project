//
//  Design.swift
//  HR Project
//
//  Created by mac on 2/4/20.
//  Copyright © 2020 soudika. All rights reserved.
//

import Foundation
import UIKit

class Button: UIButton{
    func botton(){
        self.backgroundColor=UIColor.darkGray
        self.layer.cornerRadius=self.frame.height/2
        self.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        self.layer.shadowColor=UIColor.darkGray.cgColor
        self.layer.shadowRadius=4
        self.layer.shadowOpacity=0.5
        self.layer.shadowOffset=CGSize(width: 0, height: 0)
    }
}
class TextFields : UITextField{
    func textfields(){
        self.layer.cornerRadius=self.frame.height/2
        self.layer.shadowRadius=4
        self.layer.shadowOpacity=1
        self.layer.shadowOffset=CGSize(width: 0, height: 0)
        self.clipsToBounds=true
    }
}
class TextView : UITextView{
    func textview(){
        self.layer.cornerRadius=self.frame.height/5
        self.clipsToBounds=true
    }
}
