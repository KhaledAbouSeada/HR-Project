//
//  TableViewCell.swift
//  HR Project
//
//  Created by mac on 2/9/20.
//  Copyright © 2020 soudika. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var FirstNameLBL: UILabel!
    @IBOutlet weak var TypeLBL: UILabel!
    @IBOutlet weak var FromToDate: UILabel!
    @IBOutlet weak var DescriptionLBL: UILabel!
    @IBOutlet weak var FeedBackTXT: UITextField!
    
    var approveRequestStatus : ((_ requests : Requests)->())?
    var declineRequestStatus : ((_ requests : Requests)->())?
    var request: Requests!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ImageView.imgDesign()
        // Initialization code
    }
    func configurcell(requests : Requests, index: Int){
        request = requests
        FirstNameLBL.text=requests.employee?.first_name
        TypeLBL.text=requests.type
        FromToDate.text=("From \(requests.from ?? "")\nTo \(requests.to ?? "")")
        DescriptionLBL.text=requests.description
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func ApprovedButton(_ sender: Any) {
        approveRequestStatus?(request)
    }
    @IBAction func DeclinedButton(_ sender: Any) {
        declineRequestStatus?(request)
    }
    

}

extension UIImageView{
    func imgDesign(){
        self.layer.cornerRadius=self.frame.height/2
        self.clipsToBounds=true
        self.layer.borderColor=UIColor.gray.cgColor
        self.layer.borderWidth=4
    }
}
