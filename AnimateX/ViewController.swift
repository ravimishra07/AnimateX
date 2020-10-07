//
//  ViewController.swift
//  AnimateX
//
//  Created by Ravi Mishra on 06/10/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func pulseTapped(_ sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(identifier: "SpringVC") as! SpringVC
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }

}

