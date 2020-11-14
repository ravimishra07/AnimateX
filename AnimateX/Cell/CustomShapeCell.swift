//
//  CustomShapeCell.swift
//  AnimateX
//
//  Created by Ravi Mishra on 14/11/20.
//

import UIKit

class CustomShapeCell: UITableViewCell {

    @IBOutlet weak var shapeLabel: UILabel!
    @IBOutlet weak var mainView: UIView!

    
    override class func description() -> String {
        "CustomShapeCell"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 6
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
