//
//  MyTableViewCell.swift
//  CollectionViewDemoApp
//
//  Created by Julien on 02/09/21.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var tableView: UIView!
    @IBOutlet weak var myTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        myTextLabel.textColor=UIColor.white
       myTextLabel.font = UIFont(name:"Optima-bold", size: 20.0)
        tableView.layer.backgroundColor=UIColor(red: 0.17, green: 0.26, blue: 0.22, alpha: 1.00).cgColor
        tableView.layer.cornerRadius=20
        tableView.layer.shadowColor = UIColor.white.cgColor
        tableView.layer.shadowOpacity = 1
        tableView.layer.shadowOffset = .zero
        tableView.layer.shadowRadius = 4
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
