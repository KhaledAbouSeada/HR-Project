//
//  View1Controller.swift
//  HR Project
//
//  Created by mac on 1/30/20.
//  Copyright © 2020 soudika. All rights reserved.
//

import UIKit
import MBRadioButton

class View1Controller: UIViewController, RadioButtonDelegate {
    func radioButtonDidSelect(_ button: RadioButton) {
        
    }
    
    func radioButtonDidDeselect(_ button: RadioButton) {
        
    }
    

    @IBOutlet weak var DateTXT: UITextField!
    @IBOutlet weak var TimeTXT: UITextField!
    @IBOutlet weak var CheckinBTN: RadioButton!
    @IBOutlet weak var CheckoutBTN: RadioButton!
    

    let color = UIColor.black
    let datepick = UIDatePicker()
    let timePick = UIDatePicker()
    var checkContainer = RadioButtonContainer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        radioButton()
        DateTXT.inputView = datepick
        TimeTXT.inputView = timePick
        DateTXT.inputAccessoryView = createDatePicker()
        TimeTXT.inputAccessoryView = createTimePicker()
        DateTXT.isUserInteractionEnabled = true
        TimeTXT.isUserInteractionEnabled = true
        
    }
    
    @IBAction func FinishButton(_ sender: Any) {
        
    }
    
    
    func radioButton() {
        checkContainer.addButtons([CheckinBTN , CheckoutBTN])
//        checkContainer.selectedButtons = [CheckoutBTN]
        checkContainer.delegate = self
        
//        if CheckinBTN.isEnabled == true{
//            CheckoutBTN.isEnabled = false
//        }else if CheckoutBTN.isEnabled == true{
//            CheckinBTN.isEnabled = false
//        }else{
//            return
//        }
    }

    @objc func createDatePicker ()->UIToolbar{
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.default
        datepick.datePickerMode = .date
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(doneDate))
        doneButton.tintColor = .black
        let spacebutton = UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbar.setItems([spacebutton , doneButton], animated: true)
        DateTXT.inputAccessoryView = datepick
        datepick.addTarget(self, action: #selector(doneDateAction), for: .valueChanged)
        return toolbar
    }
    @objc func doneDateAction()->DateFormatter{
        let date = DateFormatter()
        date.dateFormat = "dd-MM-yyyy"
        DateTXT.text = date.string(from: datepick.date)
//        DateTXT.resignFirstResponder()
        return date
    }
    @objc func createTimePicker()->UIToolbar{
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.default
        timePick.datePickerMode = .time
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTime))
        doneButton.tintColor = .black
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbar.setItems([spaceButton , doneButton], animated: true)
        TimeTXT.inputAccessoryView = timePick
        timePick.addTarget(self, action: #selector(doneTimeButton), for: .valueChanged)
        return toolbar
    }
    @objc func doneTimeButton(){
        let time = DateFormatter()
        time.dateFormat = "HH:mm"
        TimeTXT.text = time.string(from: timePick.date)
//        TimeTXT.resignFirstResponder()
    }
    @objc func doneDate(){
        DateTXT.resignFirstResponder()
    }
    @objc func doneTime(){
        TimeTXT.resignFirstResponder()
    }
}
