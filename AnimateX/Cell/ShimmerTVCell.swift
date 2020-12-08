//
//  ShimmerTVCell.swift
//  AnimateX
//
//  Created by Ravi Mishra on 08/12/20.
//

import UIKit

class ShimmerTVCell: UICollectionViewCell {
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let shimmerLayer = Shimmer(for: mainView, cornerRadius: 12)
        self.contentView.layer.insertSublayer(shimmerLayer, above: self.mainView.layer)
        shimmerLayer.startAnimation()
        
    }
    func addShimmerLayer(){
      
    }
}
