//
//  MenuViewController.swift
//  AnimateX
//
//  Created by Ravi Mishra on 01/11/20.
//

import UIKit

class MenuViewController: UIViewController {
     let MENU_TRANSLATION: CGFloat = -100
     let ANIMATION_DURATION: TimeInterval = 0.6
    let ANIMATION_DELAY: TimeInterval = 0.0

    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var menuBtn: UIButton!
    
    //Horizontal menu items
    @IBOutlet weak var hMenuBtn1: UIButton!
    @IBOutlet weak var hMenuBtn2: UIButton!
    @IBOutlet weak var hMenuBtn3: UIButton!
    @IBOutlet weak var hMenuBtn4: UIButton!
    
    //Vertical menu items
    @IBOutlet weak var vMenuBtn1: UIButton!
    @IBOutlet weak var vMenuBtn2: UIButton!
    @IBOutlet weak var vMenuBtn3: UIButton!
    @IBOutlet weak var vMenuBtn4: UIButton!
    var isMenuVisible = false
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialPosition()
        menuBtn.layer.cornerRadius = menuBtn.bounds.height/2
        mainView.layer.shadowRadius = 8
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOpacity = 0.4
        mainView.layer.shadowOffset = CGSize(width: 4, height: 4)
        mainView.layer.masksToBounds = false
        mainView.layer.cornerRadius = 40
        mainView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        //mainView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 40.0)

    }
    func setInitialPosition(){
        menuBtn.transform = .identity//CGAffineTransform(rotationAngle: .pi/4)
        
        //for horizontal menu buttons
        let hmenu1 = CGPoint(x: hMenuBtn1.center.x, y: hMenuBtn1.center.y)
        let hmenu2 = CGPoint(x: hMenuBtn2.center.x, y: hMenuBtn2.center.y)
        let hmenu3 = CGPoint(x: hMenuBtn3.center.x, y: hMenuBtn3.center.y)
        let hmenu4 = CGPoint(x: hMenuBtn4.center.x, y: hMenuBtn4.center.y)
        let menu1x = menuBtn.center.x - hmenu1.x - 100
        let menu2x = menuBtn.center.x - hmenu2.x - 100
        let menu3x = menuBtn.center.x - hmenu3.x - 100
        let menu4x = menuBtn.center.x - hmenu4.x - 100

        hMenuBtn1.transform = CGAffineTransform(translationX: menu1x, y: 0)
        hMenuBtn2.transform = CGAffineTransform(translationX: menu2x, y: 0)
        hMenuBtn3.transform = CGAffineTransform(translationX: menu3x, y: 0)
        hMenuBtn4.transform = CGAffineTransform(translationX: menu4x, y: 0)
    
        hMenuBtn1.alpha = 0
        hMenuBtn2.alpha = 0
        hMenuBtn3.alpha = 0
        hMenuBtn4.alpha = 0
        
        //for vertical menu buttons
        let vmenu1 = CGPoint(x: vMenuBtn1.center.x, y: vMenuBtn1.center.y)
        let vmenu2 = CGPoint(x: vMenuBtn2.center.x, y: vMenuBtn2.center.y)
        let vmenu3 = CGPoint(x: vMenuBtn3.center.x, y: vMenuBtn3.center.y)
        let vmenu4 = CGPoint(x: vMenuBtn4.center.x, y: vMenuBtn4.center.y)
        let vMenu1y = menuBtn.center.y - vmenu1.y - 600
        let vMenu2y = menuBtn.center.y - vmenu2.y - 600
        let vMenu3y = menuBtn.center.y - vmenu3.y - 600
        let vMenu4y = menuBtn.center.y - vmenu4.y - 600

        vMenuBtn1.transform = CGAffineTransform(translationX: 0, y: vMenu1y)
        vMenuBtn2.transform = CGAffineTransform(translationX: 0, y: vMenu2y)
        vMenuBtn3.transform = CGAffineTransform(translationX: 0, y: vMenu3y)
        vMenuBtn4.transform = CGAffineTransform(translationX: 0, y: vMenu4y)
        
        vMenuBtn1.alpha = 0
        vMenuBtn2.alpha = 0
        vMenuBtn3.alpha = 0
        vMenuBtn4.alpha = 0
    }
    
    func buttonFinalPositions(){
        menuBtn.transform = CGAffineTransform(rotationAngle: .pi/4)

        //for x
        hMenuBtn1.transform = .identity
        hMenuBtn2.transform = .identity
        hMenuBtn3.transform = .identity
        hMenuBtn4.transform = .identity
        hMenuBtn1.alpha = 1
        hMenuBtn2.alpha = 1
        hMenuBtn3.alpha = 1
        hMenuBtn4.alpha = 1
        
        // for y
        vMenuBtn1.transform = .identity
        vMenuBtn2.transform = .identity
        vMenuBtn3.transform = .identity
        vMenuBtn4.transform = .identity
        
        vMenuBtn1.alpha = 1
        vMenuBtn2.alpha = 1
        vMenuBtn3.alpha = 1
        vMenuBtn4.alpha = 1
        
    }
    @IBAction func menuTapped(_ sender: UIButton){
        isMenuVisible = !isMenuVisible
        if isMenuVisible{
            UIView.animate(withDuration: self.ANIMATION_DURATION, delay: self.ANIMATION_DELAY, options: [.curveEaseIn]) {
                self.mainView.transform = CGAffineTransform(translationX: self.MENU_TRANSLATION, y: self.MENU_TRANSLATION)
                self.buttonFinalPositions()
            } completion: { (_) in}

        }else{
            UIView.animate(withDuration: self.ANIMATION_DURATION, delay: self.ANIMATION_DELAY, options: [.curveEaseIn]) {
                self.mainView.transform = .identity
                self.setInitialPosition()

            } completion: { (_) in}
        }
        
    }
}
