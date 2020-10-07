//
//  SpringVC.swift
//  AnimateX
//
//  Created by Ravi Mishra on 06/10/20.
//

import UIKit

class SpringVC: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    //MARK:- Variables
    var  isVertical = false
    var collectionViewDataSource = ["Animation 1","Animation 2","Animation 3","Animation 4"]
    
    //MARK:- View controllers delegate function
    override func viewDidLoad() {
        super.viewDidLoad()
        subView.isHidden = true
        menuCollectionView.dataSource  = self
        menuCollectionView.delegate = self
        animateSpring()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Functions
    
    /// Aimate view
    private func animateSpring(){
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: { () -> Void in
            self.mainView.transform = self.mainView.transform.rotated(by: .pi / 2)
            if self.isVertical{
                self.mainView.backgroundColor = .red
                var rotation = CATransform3DMakeRotation(.pi, 1.0, 0.0, 0.0);
                rotation.m34 = CGFloat(-1.0/500.0)
                self.mainView.layer.transform = rotation
            }else{
                self.mainView.backgroundColor = .blue
                
                var rotation = CATransform3DMakeRotation(.pi, 0.0, 1.0, 0.0);
                rotation.m34 = CGFloat(-1.0/500.0)
                self.mainView.layer.transform = rotation
            }
            
            
        }) { (finished) -> Void in
            self.isVertical.toggle()
            self.animateSpring()
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
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 60)

    }
    
}
