//
//  NavigationViewController.swift
//  AnimateX
//
//  Created by Ravi Mishra on 25/10/20.
//

import UIKit

class NavigationViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var menuBtn1:UIButton!
    @IBOutlet weak var menuBtn2:UIButton!
    @IBOutlet weak var menuBtn3:UIButton!
    @IBOutlet weak var menuBtn4:UIButton!
    @IBOutlet weak var menuBtn5:UIButton!
    @IBOutlet weak var sideMenuBtn1:UIButton!
    @IBOutlet weak var sideMenuBtn2:UIButton!
    @IBOutlet weak var sideMenuBtn3:UIButton!
    @IBOutlet weak var sideMenuBtn4:UIButton!
    @IBOutlet weak var sideMenuBtn5:UIButton!
    
    @IBOutlet weak var menuBtn1BottomContraint:NSLayoutConstraint!
    @IBOutlet weak var menuBtn2BottomContraint:NSLayoutConstraint!
    @IBOutlet weak var menuBtn3BottomContraint:NSLayoutConstraint!
    @IBOutlet weak var menuBtn4BottomContraint:NSLayoutConstraint!
    @IBOutlet weak var menuBtn5BottomContraint:NSLayoutConstraint!
    @IBOutlet weak var sideMenuBtn1BottomContraint:NSLayoutConstraint!
    @IBOutlet weak var sideMenuBtn2BottomContraint:NSLayoutConstraint!
    @IBOutlet weak var sideMenuBtn3BottomContraint:NSLayoutConstraint!
    @IBOutlet weak var sideMenuBtn4BottomContraint:NSLayoutConstraint!
    @IBOutlet weak var sideMenuBtn5BottomContraint:NSLayoutConstraint!
    
    //MARK:- Constants
    let ANIMATION_DURATION:TimeInterval = 0.8
    let DELAY_DURATION:TimeInterval = 0.2
    let DAMPING_CONSTANT:CGFloat = 0.35
    
    //MARK:- Variables
    var isMenuShown = false
    var baseBottomContraint:CGFloat = 40
 
    //MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuBtn3.transform = CGAffineTransform(rotationAngle: (.pi/4))
        initaliseViews()
    }
   
    //MARK:- ViewController's Functions
    func initaliseViews(){
        menuBtn1BottomContraint.constant = CGFloat(-(40+baseBottomContraint))
        menuBtn2BottomContraint.constant = CGFloat(-(50+baseBottomContraint))
        menuBtn4BottomContraint.constant = CGFloat(-(50+baseBottomContraint))
        menuBtn5BottomContraint.constant = CGFloat(-(40+baseBottomContraint))
        UIView.animate(withDuration: ANIMATION_DURATION, delay: 0.1, usingSpringWithDamping: DAMPING_CONSTANT, initialSpringVelocity: 0.5, options: [.curveEaseOut]) {
            self.view.layoutIfNeeded()
        } completion: { (isTrue) in
            
        }
    }
    
    func animateView(){
        menuBtn1BottomContraint.constant = 0
        menuBtn2BottomContraint.constant = 0
        menuBtn4BottomContraint.constant = 0
        menuBtn5BottomContraint.constant = 0
        UIView.animate(withDuration: ANIMATION_DURATION, delay: 0.1, usingSpringWithDamping: DAMPING_CONSTANT, initialSpringVelocity: 0.5, options: [.curveEaseOut]) {
            self.view.layoutIfNeeded()
        } completion: { (isTrue) in
            
        }
    }
    
    //MARK:- Actions
    @IBAction func crossTapped(_ sender: UIButton){
        if isMenuShown{
            self.initaliseViews()
            UIView.animate(withDuration: 0.3) {
                self.menuBtn3.transform = CGAffineTransform(rotationAngle: (.pi/4))
            }
        }else{
            self.animateView()
            UIView.animate(withDuration: 0.3) {
                self.menuBtn3.transform = .identity
            }
        }
        isMenuShown = !isMenuShown
    }
}
