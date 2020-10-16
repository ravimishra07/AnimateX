//
//  TransitionViewController.swift
//  AnimateX
//
//  Created by Ravi Mishra on 14/10/20.
//

import UIKit

class TransitionViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let dataSource = ["HomeLander","Queen Maeve","StarLight","A-Train","The Deep","Translucent","Black Noir","The Lamplighter","Stromfront","Kimiko","The Mesmerizer","HomeLander","Queen Maeve","StarLight","A-Train","The Deep","Translucent","Black Noir","The Lamplighter","Stromfront","Kimiko","The Mesmerizer"]
    var cellTranstaion:CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        cellTranstaion = self.view.bounds.height
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.4) {
            self.tableView.reloadData()
        }

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
       // self.tableView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
//        UIView.animateKeyframes(withDuration: 0.8, delay: 0, options: []) {
//            self.view.transform = .identity
//        } completion: { (isComplete) in
//
//        }

    }
}
extension TransitionViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TranstionCell") as? TranstionCell else{return UITableViewCell()}
        cell.titleLbl.text = dataSource[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cellTranstaion = (self.view.bounds.height - cell.contentView.bounds.height*CGFloat((indexPath.row+1)))
        cell.transform = CGAffineTransform(translationX: 0, y: self.cellTranstaion)

        UIView.animate(withDuration: 0.6) {
            cell.transform = .identity//CGAffineTransform(translationX: 0, y: self.cellTranstaion)

        } completion: { (isTrue) in
            
        }

    }
}
