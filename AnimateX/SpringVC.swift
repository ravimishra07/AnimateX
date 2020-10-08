//
//  SpringVC.swift
//  AnimateX
//
//  Created by Ravi Mishra on 06/10/20.
//

import UIKit
enum AnimationType{
    case kType1
    case kType2

}
class SpringVC: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    //MARK:- Variables
    var  isVertical = false
    var animationType : AnimationType = .kType1
    let VIEW_TAG = 101

    var collectionViewDataSource = ["Animation 1","Animation 2","Animation 3","Animation 4"]
    
    //MARK:- View controllers delegate function
    override func viewDidLoad() {
        super.viewDidLoad()
        subView.isHidden = true
        menuCollectionView.dataSource  = self
        menuCollectionView.delegate = self
        mainView.isHidden = true
        addView()
       animate1()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Functions
    
    /// Aimate view
    
    func addView(){
        let viewDemo = UIView()
        let xPos = (self.view.frame.width-100)/2
        let yPos = (self.view.frame.height-100)/2

        viewDemo.frame = CGRect(x: xPos, y: yPos, width: 100, height: 100)
        viewDemo.tag = VIEW_TAG
        self.view.addSubview(viewDemo)
    }
    func removeView(){
        guard let view  =  self.view.viewWithTag(VIEW_TAG) else {
            print("no view to remove")
            return
        }
        view.removeFromSuperview()
    }
    private func  vertical3DRotation(view: UIView){
        UIView.animate(withDuration: 0.5) {
            view.transform = view.transform.rotated(by: .pi / 2)
            view.backgroundColor = .red
            var rotation = CATransform3DMakeRotation(.pi, 1.0, 0.0, 0.0);
            rotation.m34 = CGFloat(-1.0/500.0)
            view.layer.transform = rotation
        } completion: { (finished) -> Void in
            self.vertical3DRotation(view: view)
        }


    }
    private func animate1(){
        if animationType == AnimationType.kType1{
            guard let mainV =  self.view.viewWithTag(VIEW_TAG) else{
                print("no view found")
                return
            }
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: { () -> Void in
                mainV.transform = mainV.transform.rotated(by: .pi / 2)
                if self.isVertical{
                    mainV.backgroundColor = .red
                    mainV.layer.cornerRadius = 40//mainV.frame.height/2
                    var rotation = CATransform3DMakeRotation(.pi, 1.0, 0.0, 0.0);
                    rotation.m34 = CGFloat(-1.0/500.0)
                    mainV.layer.transform = rotation
                }else{
                    mainV.backgroundColor = .blue
                    mainV.layer.cornerRadius = 0
                    var rotation = CATransform3DMakeRotation(.pi, 0.0, 1.0, 0.0);
                    rotation.m34 = CGFloat(-1.0/500.0)
                    mainV.layer.transform = rotation
                }
                
            }) { (finished) -> Void in
                self.isVertical.toggle()
                self.animate1()
            }
        }
    }
    func animate2(){
        if animationType == AnimationType.kType2{
            guard let mainV =  self.view.viewWithTag(VIEW_TAG) else{
                print("no view found")
                return
            }
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: { () -> Void in
            mainV.transform = mainV.transform.rotated(by: .pi / 2)
            if self.isVertical{
                mainV.backgroundColor = .red
                mainV.layer.cornerRadius = 40//mainV.frame.height/2
                var rotation = CATransform3DMakeRotation(.pi, 1.0, 1.0, 0.0);
                rotation.m34 = CGFloat(-1.0/500.0)
                mainV.layer.transform = rotation
            }else{
                mainV.backgroundColor = .blue
                mainV.layer.cornerRadius = 0
                var rotation = CATransform3DMakeRotation(.pi, 1.0, 1.0, 0.0);
                rotation.m34 = CGFloat(-1.0/500.0)
                mainV.layer.transform = rotation
            }
            
        }) { (finished) -> Void in
            
            self.isVertical.toggle()
            self.animate2()
        }
        }
    }
}
extension SpringVC: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionViewDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCell
        cell.titleLabel.text = collectionViewDataSource[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch  indexPath.row {
        case 0:
            animationType = .kType1
            isVertical = false
            self.removeView()
            addView()
            animate1()
        case 1:
            animationType = .kType2
            isVertical = false
            self.removeView()

            addView()
            animate2()
        default:
            animationType = .kType1
            isVertical = false
            self.removeView()

            addView()
            animate1()
        }
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 60)
        
    }
    
}
