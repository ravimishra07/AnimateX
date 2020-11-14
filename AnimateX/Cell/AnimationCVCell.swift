//
//  AnimationCVCell.swift
//  AnimateX
//
//  Created by Ravi Mishra on 14/11/20.
//

import UIKit

class AnimationCVCell: UICollectionViewCell {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainView: UIView!

    
    override class func description() -> String {
        "AnimationCVCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 6
        // Initialization code
    }
}
