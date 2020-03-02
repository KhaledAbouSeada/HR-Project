//
//  TableViewController.swift
//  HR Project
//
//  Created by mac on 2/9/20.
//  Copyright © 2020 soudika. All rights reserved.
//

import UIKit
import Alamofire

class TableViewController: UITableViewController {
    
    var array : [Requests] = [Requests]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getrequests()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! TableViewCell
        cell.configurcell(requests: array[indexPath.row], index: indexPath.row)
        cell.approveRequestStatus = { request in
            
            APIClient.approvedrequests(employee_id: request.employee_id ?? 0, status: K.Constanst.approved, description: request.description ?? "", from: request.from ?? "", to: request.to ?? "", type: request.type ?? "", reply: request.reply ?? "", id: request.id ?? 0, completion: { (response: Result<RequestsModel, AFError>) in
                switch response{
                    
                case .success(_):
                    self.Alert(message: "Approved")
                case .failure(let error):
                    print(error)
                }
            })

//            API.ApprovedRequests(employee_id: request.employee_id ?? 0, status: "Approved", description: request.description ?? "", from: request.from ?? "", to: request.to ?? "", type: request.type ?? "", reply: request.reply ?? "", id: request.id ?? 0, completion: { (error, status) in
//                if let error = error{
//                    print(error)
//                    return
//                }
//                if status == true {
//                    self.Alert(message: "Approved")
//                }
//            })
        }
        cell.declineRequestStatus = { request in
            
            APIClient.approvedrequests(employee_id: request.employee_id ?? 0, status: K.Constanst.declined, description: request.description ?? "", from: request.from ?? "", to: request.to ?? "", type: request.type ?? "", reply: request.reply ?? "", id: request.id ?? 0, completion: { (response: Result<RequestsModel, AFError>) in
                switch response{
                    
                case .success(_):
                    self.Alert(message: "Declined")
                case .failure(let error):
                    print(error)
                }
            })
            
//            API.ApprovedRequests(employee_id: request.employee_id ?? 0, status: "Rejected", description: request.description ?? "", from: request.from ?? "", to: request.to ?? "", type: request.type ?? "", reply: request.reply ?? "", id: request.id ?? 0, completion: { (error, status) in
//                if let error = error{
//                    print(error)
//                    return
//                }
//                if status == true {
//                    self.Alert(message: "Declined")
//                }
//            })
        }
        cell.selectionStyle = .none
         return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func getrequests(){
        
        APIClient.getrequests { (response: Result<RequestsModel, AFError>) in
            switch response {
                
            case .success(let value):
                self.array = (value.data?.requests!)!
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        
//        API.Requestrequests { (error:Error?, success:Bool , dataaa:[Requests]?) in
//
//            if let error = error{
//                print(error)
//            }
//            if success==true{
//                self.array = dataaa!
//                self.tableView.reloadData()
//                print("SUccessed")
//            }
//        }
    }
    func Alert (message:String){
        
        let alert = UIAlertController(title: "Done", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert , animated: true)
        tableView.reloadData()
    }
}
