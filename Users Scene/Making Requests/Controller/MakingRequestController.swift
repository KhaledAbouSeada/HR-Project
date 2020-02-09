//
//  MakingRequestController.swift
//  HR Project
//
//  Created by mac on 1/30/20.
//  Copyright © 2020 soudika. All rights reserved.
//

import UIKit

class MakingRequestController: UIViewController {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var Container1: UIView!
    @IBOutlet weak var Container2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationBarButton()
        Container1.isHidden = false
        Container2.isHidden = true
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SegmentedC(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            Container1.isHidden = false
            Container2.isHidden = true
//            navigationBarButton()
        case 1:
            Container1.isHidden = true
            Container2.isHidden = false
//            navigationBarButton()
        default:
            break
            
        }
    }
//    func  navigationBarButton(){
//        if Container1.isHidden == true && Container2.isHidden == false{
//            let addButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(rightbutton))
//            self.navigationItem.rightBarButtonItem = addButton
//        }else if Container1.isHidden == false && Container2.isHidden == true{
//            navigationItem.rightBarButtonItem = nil
//        }
//    }
//    @objc func rightbutton(){
//        print("right button teapped")
//    }
}


