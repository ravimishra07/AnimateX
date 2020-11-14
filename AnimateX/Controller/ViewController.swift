//
//  ViewController.swift
//  AnimateX
//
//  Created by Ravi Mishra on 06/10/20.
//

import UIKit
enum CVMenu: String{
    case kLoader = "Loader"
    case kTransition = "Transtion"
    case kAnimation = "Animation"
    case KMenu = "Menu"
}
class ViewController: UIViewController {
    @IBOutlet weak var animationCV: UICollectionView!
    @IBOutlet weak var loaderBtn: UIButton!
    @IBOutlet weak var transtionBtn: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
   // var menuItem = .kLoader
    let animationData:[CVMenu] = [.kLoader,.kTransition,.kAnimation,.KMenu]
    let colorArray = ["#FF5252","#546E7A","#827717","#4A148C"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        animationCV.delegate = self
        animationCV.dataSource = self
        addCorner(view: loaderBtn)
        addCorner(view: transtionBtn)
        addCorner(view: btn3)
        addCorner(view: btn4)

    }
    func addCorner(view: UIView, radius: CGFloat = 8){
        view.layer.cornerRadius = radius
        view.clipsToBounds = true
    }
  
    
     func loadersTapped(){
        let vc = self.storyboard?.instantiateViewController(identifier: "LoaderVC") as! LoaderVC
        //vc.modalPresentationStyle = .overFullScreen
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func transitionTapped(){
        let vc = self.storyboard?.instantiateViewController(identifier: "TransitionViewController") as! TransitionViewController
        //vc.modalPresentationStyle = .overFullScreen
//        self.present(vc, animated: false, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)

    }

    func navigationTapped(){
        let vc = self.storyboard?.instantiateViewController(identifier: "NavigationViewController") as! NavigationViewController
//        self.present(vc, animated: false, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)

    }
    func menuBtnTapped(){
        let vc = self.storyboard?.instantiateViewController(identifier: "MenuViewController") as! MenuViewController
//        self.present(vc, animated: false, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)

    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        animationData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnimationCVCell.description(), for: indexPath) as? AnimationCVCell else {
            return UICollectionViewCell()
        }
        cell.mainLabel.text = animationData[indexPath.row].rawValue
        cell.mainView.backgroundColor = UIColor(colorArray[indexPath.row])
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: collectionView.bounds.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            loadersTapped()
        case 1:
            transitionTapped()
        case 2:
            navigationTapped()
        case 3:
            menuBtnTapped()
            
        default:
            loadersTapped()
        }
    }
}
