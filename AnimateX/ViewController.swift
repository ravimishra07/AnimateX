//
//  ViewController.swift
//  AnimateX
//
//  Created by Ravi Mishra on 06/10/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loaderBtn: UIButton!
    @IBOutlet weak var transtionBtn: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!

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
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func transitionTapped(_ sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(identifier: "TransitionViewController") as! TransitionViewController
        //vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }

}

