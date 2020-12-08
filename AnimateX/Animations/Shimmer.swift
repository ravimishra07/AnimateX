//
//  Shimmer.swift
//  AnimateX
//
//  Created by Ravi Mishra on 08/12/20.
//

import UIKit

class Shimmer: CAGradientLayer {
    
    // MARK:- initializers for the CALayer
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(for view: UIView,cornerRadius: CGFloat) {
        super.init()
        let startColor = UIColor("FF7E5F")?.withAlphaComponent(1).cgColor ?? UIColor.white.cgColor
        let endColor =  UIColor("DA573B")?.withAlphaComponent(1).cgColor ?? UIColor.white.cgColor
        
        self.frame = view.bounds
        self.startPoint = CGPoint(x: 0.0, y: 1.0)
        self.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.colors = [startColor, endColor, startColor]
        self.locations = [0.0, 0.5, 1.0]
        self.position = view.center
        self.cornerRadius = cornerRadius
    }
    
    
    // MARK:- function for the CAGradientLayer
    func startAnimation() {
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.repeatCount = .infinity
        animation.duration = 0.8
        self.add(animation, forKey: animation.keyPath)
    }
    
    func removeAnimation(){
        self.removeAllAnimations()
    }
}
