//
//  TransitionViewController.swift
//  AnimateX
//
//  Created by Ravi Mishra on 14/10/20.
//

import UIKit

class TransitionViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let dataSource = ["HomeLander","Queen Maeve","StarLight","A-Train","The Deep","Translucent","Black Noir","The Lamplighter","Stromfront","Kimiko","The Mesmerizer"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self

        // Do any additional setup after loading the view.
    }
}
extension TransitionViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "") as? TranstionCell else{return UITableViewCell()}
        cell.titleLbl.text = dataSource[indexPath.row]
        return cell
    }
    
    
}
