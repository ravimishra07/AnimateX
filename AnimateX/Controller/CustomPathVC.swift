//
//  CustomPathVC.swift
//  AnimateX
//
//  Created by Ravi Mishra on 14/11/20.
//

import UIKit
enum CustomShape: String{
    case kLine = "Line"
    case kSquare = "Square"
    case kRectangle = "Rectangle"
    case kCircle = "Circle"
    case kEllipse = "Ellipse"
    case kSemiCircleTop = "Semi Circle Top"
    case kSemiCircleBottom = "Semi Circle Bottom"
    case kSemiCircleLeft = "Semi Circle Left"
    case kSemiCircleRight = "Semi Circle Right"
    case kPie = "Pie"
    case kTopCurve = "Top Curve"
    case kBottomCurve = "Bottom Curve"
}
class CustomPathVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let shapeArray: [CustomShape] = [.kLine,.kSquare,.kRectangle,.kCircle,.kEllipse,.kSemiCircleTop,.kSemiCircleBottom,.kSemiCircleLeft,.kSemiCircleRight,.kPie,.kTopCurve,.kBottomCurve]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    func drawLine(cellView: UIView){
        CATransaction.begin()
        
        // set initial and final points
        let startPoint =  CGPoint(x: 0, y: cellView.bounds.height/2)
        let endoint = CGPoint(x: cellView.frame.width,y: cellView.frame.height/2)
        cellView.backgroundColor = .green

        // design path of line
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: endoint)

        //
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.strokeColor  = UIColor.red.cgColor
        shape.lineWidth = 2
        cellView.layer.addSublayer(shape)
        
    }
}
extension CustomPathVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shapeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomShapeCell.description(), for: indexPath) as? CustomShapeCell else {
            return UITableViewCell()
        }
        let shapeType = shapeArray[indexPath.row]
        if shapeType == .kLine{
            drawLine(cellView: cell.mainView)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}
