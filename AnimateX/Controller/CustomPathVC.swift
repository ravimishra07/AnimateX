//
//  CustomPathVC.swift
//  AnimateX
//
//  Created by Ravi Mishra on 14/11/20.
//

import UIKit
enum CustomShape: String{
    case kLine = "Line"
    case kRectangle = "Rectangle"
    case kFilledRect = "Filled Rectangle"

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
    let shapeArray: [CustomShape] = [.kLine,.kRectangle,.kFilledRect,.kCircle,.kEllipse,.kSemiCircleTop,.kSemiCircleBottom,.kSemiCircleLeft,.kSemiCircleRight,.kPie,.kTopCurve,.kBottomCurve]
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
       // cellView.backgroundColor = .green

        // design path of line
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: endoint)

        // add shape
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.strokeColor  = UIColor.red.cgColor
        shape.lineWidth = 2
        cellView.layer.addSublayer(shape)
        
    }
    func drawSquare(view: UIView){
        let path = UIBezierPath()
        // initial line
        path.move(to: CGPoint(x: 0, y: 0))
        
        //draws line to bottom left point
        path.addLine(to: CGPoint(x: 0, y: view.bounds.height))
        
        //draws line to bottom right point
        path.addLine(to: CGPoint(x: view.bounds.width, y: view.bounds.height))
        
        //draws line to top right point
        path.addLine(to: CGPoint(x: view.bounds.width, y: 0))
        
        //closes the shape by drawing last line
        path.close()
        
        // add shape
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.strokeColor  = UIColor.red.cgColor
        shape.fillColor = UIColor.clear.cgColor
        //shape.strokeColor
        
        shape.lineWidth = 6
        view.layer.addSublayer(shape)
        
    }
    func drawFilledRect(view: UIView){
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 12, height: 0))
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.fillColor = UIColor.red.cgColor
        
        view.layer.addSublayer(shape)
   
        
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
        cell.mainView.backgroundColor = .clear
        cell.shapeLabel.text = shapeArray[indexPath.row].rawValue
        let shapeType = shapeArray[indexPath.row]
        if shapeType == .kLine{
            drawLine(cellView: cell.mainView)
            cell.shapeLabel.text = shapeType.rawValue
        }else if shapeType == .kRectangle{
            drawSquare(view: cell.mainView)
        }else if shapeType == .kFilledRect{
            drawFilledRect(view: cell.mainView)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}
