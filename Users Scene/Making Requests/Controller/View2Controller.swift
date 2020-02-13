//
//  View2Controller.swift
//  HR Project
//
//  Created by mac on 1/30/20.
//  Copyright © 2020 soudika. All rights reserved.
//

import UIKit

class View2Controller: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextViewDelegate{
    
    
    @IBOutlet weak var RequestTF: TextFields!
    @IBOutlet weak var DescriptionTV: TextView!
    @IBOutlet weak var fromDateTF: UITextField!
    @IBOutlet weak var toDateTF: UITextField!
    @IBOutlet weak var SendRequestBTN: ButtonSend!
    
    let datePickFromDate = UIDatePicker()
    let datePickToDate = UIDatePicker()
    let pickerview = UIPickerView()
    let requestInputs = ["Vacations", "Medical Issues", "Travel", "Check In", "Check Out", "Others"]
//    let bigVC = MakingRequestController.self as? View2Controller
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SendRequestBTN.botton1()
        DescriptionTV.textview()
        RequestTF.textfields()
        DescriptionTV.delegate = self
        DescriptionTV.text = "Description"
        DescriptionTV.textColor = UIColor.lightGray
        
        pickerview.delegate=self
        pickerview.dataSource=self
        
        fromDateTF.inputView=datePickFromDate
        toDateTF.inputView=datePickToDate
        RequestTF.inputView=pickerview
        fromDateTF.inputAccessoryView = FromDatetoolbar()
        toDateTF.inputAccessoryView = ToDatetoolbar()
        RequestTF.inputAccessoryView = RequestTypetoolbar()
        RequestTF.isUserInteractionEnabled = true
        fromDateTF.isUserInteractionEnabled=true
        toDateTF.isUserInteractionEnabled=true
        
//        datePicker.addTarget(self, action: #selector(handleDatePicker), forControlEvents: .valueChanged)
//        datepick.addTarget(self, action: #selector(FromDatetoolbar), for: .valueChanged)
//        datepick.addTarget(self, action: #selector(doneButtonClickedToDate), for: .valueChanged)
        
    }
    
    @IBAction func SendRequest(_ sender: Any) {
        
        Validation()
    }
    func Validation(){
        let DescriptionText = DescriptionTV.text
        let RequestText = RequestTF.text
        let From = fromDateTF.text
        let to = toDateTF.text
        
        if RequestText?.isEmpty==true{
            self.Alert(title: "Oops!", message: "Choose Your Request")
        }else if DescriptionText=="Description"{
            self.Alert(title: "Oops!", message: "Enter Your Description")
        }else if From?.isEmpty==true{
            self.Alert(title: "Oops!", message: "Enter From Date")
        }else if to?.isEmpty==true{
            self.Alert(title: "Oops!", message: "Enter to Date")
        }else{
           print("Done")
        }
        
    }
    
    
    func Alert (title:String , message:String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert , animated: true)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if let text = DescriptionTV.text{
            DescriptionTV.text = text
            DescriptionTV.textColor = UIColor.black
        }
        if case DescriptionTV.text = "Description"{
            DescriptionTV.text = nil
            DescriptionTV.textColor = UIColor.black
        }
//        DescriptionTV.text = nil
//        DescriptionTV.textColor = UIColor.black
        
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if let text = DescriptionTV.text{
        DescriptionTV.text = text
        }
        if case DescriptionTV.text = ""{
            DescriptionTV.text = "Description"
            DescriptionTV.textColor = UIColor.lightGray
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return requestInputs.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return requestInputs[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        RequestTF.text = requestInputs[row]
    }
    
    
    
    
//     func navigationBarButton(){
//            let adddddButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(rightbutton))
//            self.navigationItem.rightBarButtonItem = adddddButton
//    }
////    func big() {
////        let addButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(rightbutton))
////        bigVC?.navigationItem.rightBarButtonItem = addButton
////    }
////
//    @objc func rightbutton(){
//        print("right button teapped")
//    }
//
    func RequestTypetoolbar()->UIToolbar{
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
//        toolbar.barTintColor = .gray
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonClickedRequestType))
        doneButton.tintColor = .black
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbar.setItems([spaceButton , doneButton], animated: true)
        return toolbar
    }
    
    func FromDatetoolbar()->UIToolbar{
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        datePickFromDate.datePickerMode = .date
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(closeFromDate))
        doneButton.tintColor = .black
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbar.setItems([spaceButton , doneButton], animated: true)
        datePickFromDate.addTarget(self, action: #selector(doneButtonClickedFromDate), for: .valueChanged)
        return toolbar
    }
    
    func ToDatetoolbar()->UIToolbar{
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        datePickToDate.datePickerMode = .date
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(closetoDate))
        doneButton.tintColor = .black
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbar.setItems([spaceButton , doneButton], animated: true)
        datePickToDate.addTarget(self, action: #selector(doneButtonClickedToDate), for: .valueChanged)
        return toolbar
    }
    
    @objc func doneButtonClickedFromDate(){
        let date = DateFormatter()
        date.dateFormat = "dd-MM-yyyy"
        fromDateTF.text = date.string(from: datePickFromDate.date)
//        fromDateTF.resignFirstResponder()
    }
    @objc func doneButtonClickedToDate(){
        let date = DateFormatter()
        date.dateFormat = "dd-MM-yyyy"
        toDateTF.text = date.string(from: datePickToDate.date)
//        toDateTF.resignFirstResponder()
    }
    @objc func closeFromDate(){
        fromDateTF.resignFirstResponder()
    }
    @objc func closetoDate(){
        toDateTF.resignFirstResponder()
    }
    @objc func doneButtonClickedRequestType(){
        RequestTF.resignFirstResponder()
    }
}
