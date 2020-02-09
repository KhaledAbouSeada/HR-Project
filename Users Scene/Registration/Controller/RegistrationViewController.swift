//
//  RegistrationViewController.swift
//  HR Project
//
//  Created by mac on 2/6/20.
//  Copyright © 2020 soudika. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var RegisterBTN: Button!
    @IBOutlet weak var FirstNameTXT: UITextField!
    @IBOutlet weak var LastNameTXT: UITextField!
    @IBOutlet weak var ArabicNameTXT: UITextField!
    @IBOutlet weak var EmailTXT: UITextField!
    @IBOutlet weak var PhoneTXT: UITextField!
    @IBOutlet weak var MaritalTXT: UITextField!
    @IBOutlet weak var GenderTXT: UITextField!
    @IBOutlet weak var HiringDateTXT: UITextField!
    @IBOutlet weak var DepartmentIDTXT: UITextField!
    @IBOutlet weak var CityIDTXT: UITextField!
    @IBOutlet weak var CountryIDTXT: UITextField!
    @IBOutlet weak var SalaryTXT: UITextField!
    @IBOutlet weak var EmployeeTypeTXT: UITextField!
    
    let gender = ["Male","Female"]
    let maritalStatus = ["Single", "Married", "Widowed", "Divorced", "Separated"]
    let genderPickerview = UIPickerView()
    let maritalPickerview = UIPickerView()
    let datePickerview = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RegisterBTN.botton()
        genderPickerview.tag = 0
        maritalPickerview.tag = 1
        genderPickerview.dataSource=self
        genderPickerview.delegate=self
        maritalPickerview.dataSource=self
        maritalPickerview.delegate=self
        GenderTXT.inputView = genderPickerview
        MaritalTXT.inputView = maritalPickerview
        HiringDateTXT.inputView = datePickerview
        HiringDateTXT.inputAccessoryView = DateToolBar()
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return gender.count
        }else{
            return maritalStatus.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return gender[row]
        }else{
            return maritalStatus[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            GenderTXT.text = gender[row]
        }else{
            MaritalTXT.text = maritalStatus[row]
        }
    }

    
    
    
    
    @IBAction func RegisterBTN(_ sender: Any) {
        
        Validation()
    }
    
    func DateToolBar()->UIToolbar{
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        datePickerview.datePickerMode = .date
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(closeFromDate))
        doneButton.tintColor = .black
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbar.setItems([spaceButton , doneButton], animated: true)
        datePickerview.addTarget(self, action: #selector(doneButtonClickedToDate), for: .valueChanged)
        return toolbar
    }
    
    @objc func doneButtonClickedToDate(){
        let date = DateFormatter()
        date.dateFormat = "yyyy-MM-dd"
        HiringDateTXT.text = date.string(from: datePickerview.date)
        //        toDateTF.resignFirstResponder()
    }
    @objc func closeFromDate(){
        HiringDateTXT.resignFirstResponder()
    }
    
    func Alert (message:String){
        
        let alert = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert , animated: true)
    }
    func Validation(){
        
        let firstName = FirstNameTXT.text
        let lastName = LastNameTXT.text
        let arabicName = ArabicNameTXT.text
        let email = EmailTXT.text
        let phone = PhoneTXT.text
        let marital = MaritalTXT.text
        let gender = GenderTXT.text
        let hiringdate = HiringDateTXT.text
        let department = DepartmentIDTXT.text
        let city = CityIDTXT.text
        let country = CountryIDTXT.text
        let salary = SalaryTXT.text
        let employee = EmployeeTypeTXT.text
        
        if firstName?.isEmpty == true{
            self.Alert(message: "Enter Your First Name")
        }else if lastName?.isEmpty == true{
            self.Alert(message: "Enter Your Last Name")
        }else if arabicName?.isEmpty == true{
            self.Alert(message: "Enter Your Arabic Name")
        }else if email?.isEmpty == true {
            self.Alert(message: "Enter Your Email")
        }else if phone?.isEmpty == true{
            self.Alert(message: "Enter your phone")
        }else if marital?.isEmpty == true{
            self.Alert(message: "Choose Your Marital Status")
        }else if gender?.isEmpty == true{
            self.Alert(message: "Choose Your Gender")
        }else if hiringdate?.isEmpty == true{
            self.Alert(message: "Choose The Hiring Date")
        }else if department?.isEmpty == true{
            self.Alert(message: "Enter Your Department ID")
        }else if city?.isEmpty == true{
            self.Alert(message: "Enter Your City ID")
        }else if country?.isEmpty == true{
            self.Alert(message: "Enter Your Country ID")
        }else if salary?.isEmpty == true{
            self.Alert(message: "Enter Your Salary")
        }else if employee?.isEmpty == true{
            self.Alert(message: "Enter The Employee Type")
        }else{
            let department = Int(DepartmentIDTXT.text!)!
            let city = Int(CityIDTXT.text!)!
            let country = Int(CountryIDTXT.text!)!
            let salary = Int(SalaryTXT.text!)!
            
            API.RegistraionEmployee(firstname: "\(FirstNameTXT.text ?? "")", lastname: "\(LastNameTXT.text ?? "")", arabicname: "\(ArabicNameTXT.text ?? "")", email: "\(EmailTXT.text ?? "")", phonenumber: "\(PhoneTXT.text ?? "")", maritalstatus: "\(MaritalTXT.text ?? "")", gender: "\(GenderTXT.text ?? "")", employeetype: "\(EmployeeTypeTXT.text ?? "")", hiringdate: "\(HiringDateTXT.text ?? "")", departmentid: department, cityid: city, countryid: country, salary: salary) { (error:Error?, success:Bool) in
                
                if let error = error{
                    self.Alert(message: error.localizedDescription)
                }
                if success == true{
                    self.Alert(message: "Employee Registered Successfully")
//                    self.performSegue(withIdentifier: "Backtologin", sender: self)
                }
//                self.performSegue(withIdentifier: "Backtologin", sender: self)
//                let storyboard = UIStoryboard(name: "RegisterSB", bundle: nil)
//                let vc = storyboard.instantiateViewController(withIdentifier: "LoginSB") as! LoginController
//                let tab = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginSB")
//                self.navigationController?.popToViewController(tab, animated: true)
            }
        }
    }
}
