//
//  ViewController.swift
//  AnimateX
//
//  Created by Ravi Mishra on 06/10/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var animationCV: UICollectionView!
    @IBOutlet weak var loaderBtn: UIButton!
    @IBOutlet weak var transtionBtn: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    let animationData = ["Anima"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addCorner(view: loaderBtn)
        addCorner(view: transtionBtn)
        addCorner(view: btn3)
        addCorner(view: btn4)

    }
    func addCorner(view: UIView, radius: CGFloat = 8){
        view.layer.cornerRadius = radius
        view.clipsToBounds = true
    }
    @IBAction func loadersTapped(_ sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(identifier: "LoaderVC") as! LoaderVC
        //vc.modalPresentationStyle = .overFullScreen
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func transitionTapped(_ sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(identifier: "TransitionViewController") as! TransitionViewController
        //vc.modalPresentationStyle = .overFullScreen
//        self.present(vc, animated: false, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)

    }

    @IBAction func navigationTapped(_ sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(identifier: "NavigationViewController") as! NavigationViewController
//        self.present(vc, animated: false, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)

    }
    @IBAction func menuBtnTapped(_ sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(identifier: "MenuViewController") as! MenuViewController
//        self.present(vc, animated: false, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)

    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
    
}
