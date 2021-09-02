//
//  MyCollectionViewCell.swift
//  CollectionViewDemoApp
//
//  Created by Julien on 02/09/21.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet var myView: UIView!
    @IBOutlet var ImageCollectioncell: UIImageView!
    
    @IBOutlet weak var CollectionCellTextLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        CollectionCellTextLabel.backgroundColor=UIColor(red: 0.17, green: 0.26, blue: 0.22, alpha: 1.00)
        CollectionCellTextLabel.textColor=UIColor.white
        CollectionCellTextLabel.font=UIFont(name: "Papyrus", size: 15)
        myView.layer.shadowColor = UIColor.white.cgColor
        myView.layer.shadowOpacity = 1
        myView.layer.shadowOffset = .zero
        myView.layer.shadowRadius = 4
        
        // Initialization code
    }

}
