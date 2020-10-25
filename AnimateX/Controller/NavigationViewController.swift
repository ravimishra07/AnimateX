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
    private let ANIMATION_DURATION:TimeInterval = 0.8
    private let DELAY_DURATION:TimeInterval = 0.2
    private let DAMPING_CONSTANT:CGFloat = 0.35
    private let DAMPING_CONSTANT_SIDE_MENU:CGFloat = 0.7

    private let SIDE_MENU_BOTTOM_CONSTANT:CGFloat = 8
    private let SIDE_MENU_BOTTOM_INITIAL_CONSTANT:CGFloat = 38

    //MARK:- Variables
    private var isMenuShown = false
    private var isBottomShown = false
    private var baseBottomContraint:CGFloat = 40
 
    //MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuBtn3.transform = CGAffineTransform(rotationAngle: (.pi/4))
        initaliseViews()
        //hideSideMenu(isHidden: true)
        self.sideMenuBtn1.alpha = 0
        self.sideMenuBtn2.alpha = 0
        self.sideMenuBtn3.alpha = 0
        self.sideMenuBtn4.alpha = 0
        self.sideMenuBtn5.alpha = 0
        sideMenuInitialState2()
    }
   
    //MARK:- ViewController's Functions
   private func initaliseViews(){
        menuBtn1BottomContraint.constant = CGFloat(-(40+baseBottomContraint))
        menuBtn2BottomContraint.constant = CGFloat(-(50+baseBottomContraint))
        menuBtn4BottomContraint.constant = CGFloat(-(50+baseBottomContraint))
        menuBtn5BottomContraint.constant = CGFloat(-(40+baseBottomContraint))
        UIView.animate(withDuration: ANIMATION_DURATION, delay: 0.1, usingSpringWithDamping: DAMPING_CONSTANT, initialSpringVelocity: 0.5, options: [.curveEaseOut]) {
            self.view.layoutIfNeeded()
        } completion: { (isTrue) in
            
        }
    }
    
    private func animateView(){
        menuBtn1BottomContraint.constant = 0
        menuBtn2BottomContraint.constant = 0
        menuBtn4BottomContraint.constant = 0
        menuBtn5BottomContraint.constant = 0
        UIView.animate(withDuration: ANIMATION_DURATION, delay: 0.1, usingSpringWithDamping: DAMPING_CONSTANT, initialSpringVelocity: 0.5, options: [.curveEaseOut]) {
            self.view.layoutIfNeeded()
        } completion: { (isTrue) in
            
        }
    }
    
//    private func hideSideMenu(isHidden: Bool){
//        sideMenuBtn1.isHidden = isHidden
//        sideMenuBtn2.isHidden = isHidden
//        sideMenuBtn3.isHidden = isHidden
//        sideMenuBtn4.isHidden = isHidden
//        sideMenuBtn5.isHidden = isHidden
//    }
//    private func hideBottomMenu(isHidden: Bool){
//        menuBtn1.isHidden = isHidden
//        menuBtn2.isHidden = isHidden
//        menuBtn3.isHidden = isHidden
//        menuBtn4.isHidden = isHidden
//        menuBtn5.isHidden = isHidden
//    }
//
    private func sideMenuInitialState(){
        sideMenuBtn1BottomContraint.constant = 52
        sideMenuBtn2BottomContraint.constant = SIDE_MENU_BOTTOM_CONSTANT
        sideMenuBtn3BottomContraint.constant = SIDE_MENU_BOTTOM_CONSTANT
        sideMenuBtn4BottomContraint.constant = SIDE_MENU_BOTTOM_CONSTANT
        sideMenuBtn5BottomContraint.constant = SIDE_MENU_BOTTOM_CONSTANT
        UIView.animate(withDuration: ANIMATION_DURATION, delay: 0.1, usingSpringWithDamping: DAMPING_CONSTANT, initialSpringVelocity: 0.5, options: [.curveEaseOut]) {
            self.view.layoutIfNeeded()
        } completion: { (isTrue) in
            
        }
    }
    
    /// side menu postioned using constaints
    private func sideMenuFinalState(){
        sideMenuBtn1BottomContraint.constant = 32
        sideMenuBtn2BottomContraint.constant = SIDE_MENU_BOTTOM_INITIAL_CONSTANT
        sideMenuBtn3BottomContraint.constant = SIDE_MENU_BOTTOM_INITIAL_CONSTANT
        sideMenuBtn4BottomContraint.constant = SIDE_MENU_BOTTOM_INITIAL_CONSTANT
        sideMenuBtn5BottomContraint.constant = SIDE_MENU_BOTTOM_INITIAL_CONSTANT
        UIView.animate(withDuration: ANIMATION_DURATION, delay: 0.1, usingSpringWithDamping: DAMPING_CONSTANT_SIDE_MENU, initialSpringVelocity: 0.5, options: [.curveEaseOut]) {
            self.view.layoutIfNeeded()
        } completion: { (isTrue) in
            
        }
    }
    /// side menu postioned using transform
    private func sideMenuInitialState2(){
        
        UIView.animate(withDuration: ANIMATION_DURATION, delay: 0.1, usingSpringWithDamping: DAMPING_CONSTANT_SIDE_MENU, initialSpringVelocity: 0.5, options: [.curveEaseOut]) {
            self.sideMenuBtn1.transform = .identity
            self.sideMenuBtn2.transform = .identity
            self.sideMenuBtn3.transform = .identity
            self.sideMenuBtn4.transform = .identity
            self.sideMenuBtn5.transform = .identity
            self.sideMenuBtn1.alpha = 0
            self.sideMenuBtn2.alpha = 0
            self.sideMenuBtn3.alpha = 0
            self.sideMenuBtn4.alpha = 0
            self.sideMenuBtn5.alpha = 0

            
        } completion: { (isTrue) in
           // self.hideSideMenu(isHidden: true)
        }
    }
    private func sideMenuFinalState2(){
        
        UIView.animate(withDuration: ANIMATION_DURATION, delay: 0.1, usingSpringWithDamping: DAMPING_CONSTANT, initialSpringVelocity: 0.5, options: [.curveEaseOut]) {
            self.sideMenuBtn1.transform = CGAffineTransform(translationX: 0, y: -self.SIDE_MENU_BOTTOM_INITIAL_CONSTANT/2)
            self.sideMenuBtn2.transform = CGAffineTransform(translationX: 0, y: -(self.SIDE_MENU_BOTTOM_INITIAL_CONSTANT*2)+12)
            self.sideMenuBtn3.transform = CGAffineTransform(translationX: 0, y: -(self.SIDE_MENU_BOTTOM_INITIAL_CONSTANT*3)+12)
            self.sideMenuBtn4.transform = CGAffineTransform(translationX: 0, y: -(self.SIDE_MENU_BOTTOM_INITIAL_CONSTANT*4)+12)
            self.sideMenuBtn5.transform = CGAffineTransform(translationX: 0, y: -(self.SIDE_MENU_BOTTOM_INITIAL_CONSTANT*5)+12)
            self.sideMenuBtn1.alpha = 1
            self.sideMenuBtn2.alpha = 2
            self.sideMenuBtn3.alpha = 3
            self.sideMenuBtn4.alpha = 4
            self.sideMenuBtn5.alpha = 5
        } completion: { (isTrue) in
            
        }
    }
    
    //MARK:- Actions
    @IBAction func crossTapped(_ sender: UIButton){
        if isMenuShown{
            self.initaliseViews()
           // hideSideMenu(isHidden: false)

            UIView.animate(withDuration: 0.3) {
                self.menuBtn3.transform = CGAffineTransform(rotationAngle: (.pi/4))
            }
        }else{
            self.animateView()
           // hideSideMenu(isHidden: true)
            UIView.animate(withDuration: 0.3) {
                self.menuBtn3.transform = .identity
            }
        }
        isMenuShown = !isMenuShown
    }
    
    @IBAction func sideMenuTapped(_ sender: UIButton){
        if isBottomShown{
            self.sideMenuInitialState2()
        }else{
            self.sideMenuFinalState2()
        }
        isBottomShown = !isBottomShown
    }
}
