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
enum ShapeDirection{
    case kClockWise
    case kAntiClockWise
}
class CustomPathVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let shapeArray: [CustomShape] = [.kLine,.kRectangle,.kFilledRect,.kCircle,.kEllipse,.kSemiCircleTop,.kSemiCircleBottom,.kSemiCircleLeft,.kSemiCircleRight,.kPie,.kTopCurve,.kBottomCurve]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: functions to draw shapes
    func drawLine(cellView: UIView){
        // initial values
        let timeInterval: CFTimeInterval = 1
        let initStartPoint =  CGPoint(x: 0, y: cellView.bounds.height/2)
        let initEndPoint =  CGPoint(x: 10, y: cellView.bounds.height/2)
        let endoint = CGPoint(x: cellView.frame.width,y: cellView.frame.height/2)

        // adding animation
        let animation = CABasicAnimation(keyPath: "path")
        let finalPath = UIBezierPath()
        
        finalPath.move(to: initEndPoint)
        finalPath.addLine(to: endoint)
        animation.toValue = finalPath.cgPath
        animation.isRemovedOnCompletion = false
        animation.duration = timeInterval
        animation.repeatCount=Float.infinity
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut) // animation curve is Ease Out
        animation.fillMode = CAMediaTimingFillMode.both
        animation.isRemovedOnCompletion = false
        
        // design path of line
        let initPath = UIBezierPath()
        initPath.move(to: initStartPoint)
        initPath.addLine(to: initEndPoint)

        // add shape
        let shape = CAShapeLayer()
        shape.path = initPath.cgPath
        shape.strokeColor  = UIColor.red.cgColor
        shape.lineWidth = 10
        shape.name = CustomShape.kLine.rawValue
        shape.add(animation, forKey: animation.keyPath)
        cellView.layer.addSublayer(shape)
        
    }
    func drawSquare(view: UIView){
        let timeInterval: CFTimeInterval = 1
        let initPath = UIBezierPath()
        initPath.move(to: CGPoint(x: 0, y: 0))
        initPath.addLine(to: CGPoint(x: 0, y: 0))
       
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
        
        
        // adding animation
        let animation = CABasicAnimation(keyPath: "path")
        animation.toValue = path.cgPath
        animation.isRemovedOnCompletion = false
        animation.duration = timeInterval
        animation.repeatCount=Float.infinity
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut) // animation curve is Ease Out
        animation.fillMode = CAMediaTimingFillMode.both
        animation.isRemovedOnCompletion = false

        
        // add shape
        let shape = CAShapeLayer()
        shape.path = initPath.cgPath
        shape.strokeColor  = UIColor.red.cgColor
        shape.fillColor = UIColor.clear.cgColor
        //shape.strokeColor
        
        shape.lineWidth = 6
        shape.name = CustomShape.kRectangle.rawValue
        shape.add(animation, forKey: animation.keyPath)

        view.layer.addSublayer(shape)
        
    }
 
    func drawFilledRect(view: UIView){
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 12, height: 0))
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.fillColor = UIColor.red.cgColor
        shape.name = CustomShape.kFilledRect.rawValue
        view.layer.addSublayer(shape)
    }
    
    func drawCircle(view: UIView){
        let cellCenter = CGPoint(x: view.bounds.height/2+55, y: view.bounds.height/2)
        let path = UIBezierPath(arcCenter: cellCenter, radius: CGFloat(50), startAngle: CGFloat(0), endAngle: .pi*2, clockwise: true)
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.strokeColor = UIColor.red.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.lineWidth = 12
        shape.name = CustomShape.kCircle.rawValue
        view.layer.addSublayer(shape)
    }
    
    func drawEclipse(view: UIView){
        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height-20))
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 12
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.red.cgColor
        shape.name = CustomShape.kEllipse.rawValue
        view.layer.addSublayer(shape)
    }
    
    func  drawCircularArc(view: UIView, startAngle: CGFloat, endAngle: CGFloat, isClockwise: Bool? = true, radius: CGFloat = 50){
        let cellCenter = CGPoint(x: view.bounds.height/2+55, y: view.bounds.height/2)
        let path = UIBezierPath(arcCenter: cellCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: isClockwise!)
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.strokeColor = UIColor.red.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.lineWidth = 12
        shape.name = CustomShape.kCircle.rawValue
        view.layer.addSublayer(shape)
    }
    /*
    func drawArc(view: UIView){
        
        let endPoint = CGPoint(x: view.bounds.width-20, y: 60)
        let curvePoint1 = CGPoint(x: 60, y: 10)
        let curvePoint2 = CGPoint(x: view.bounds.width-80, y: 10)

        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 20, y: 60))
        path.addCurve(to: endPoint, controlPoint1: curvePoint1, controlPoint2: curvePoint2)
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.strokeColor = UIColor.red.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.lineWidth = 12
        shape.name = CustomShape.kCircle.rawValue
        view.layer.addSublayer(shape)
    }
    */
    func drawArc(view: UIView, startPoint: CGPoint, curvePoint1: CGPoint, curvePoint2: CGPoint, endPoint: CGPoint){
        let path = UIBezierPath()
         path.move(to: startPoint)
         path.addCurve(to: endPoint, controlPoint1: curvePoint1, controlPoint2: curvePoint2)
     
        let shape = CAShapeLayer()
        shape.path =  path.cgPath
        shape.strokeColor = UIColor.red.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.lineWidth = 4
        shape.name = CustomShape.kCircle.rawValue
        view.layer.addSublayer(shape)
    }
    func removeAnimation(view: UIView) {
       for layer in view.layer.sublayers ?? [CALayer](){
             layer.removeFromSuperlayer()
         }
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
        removeAnimation(view: cell.mainView)
        cell.shapeLabel.text = shapeArray[indexPath.row].rawValue
        let shapeType = shapeArray[indexPath.row]
        if shapeType == .kLine{
            drawLine(cellView: cell.mainView)
            cell.shapeLabel.text = shapeType.rawValue
        }else if shapeType == .kRectangle{
            drawSquare(view: cell.mainView)
        }else if shapeType == .kFilledRect{
            drawFilledRect(view: cell.mainView)
        }else if shapeType == .kCircle{
            drawCircle(view: cell.mainView)
        }else if shapeType == .kEllipse{
            drawEclipse(view: cell.mainView)
        }else if shapeType == .kSemiCircleTop{
             drawCircularArc(view: cell.mainView, startAngle: CGFloat(0), endAngle: .pi,isClockwise: false)
        }else if shapeType == .kSemiCircleBottom{
             drawCircularArc(view: cell.mainView, startAngle: CGFloat(0), endAngle: .pi,isClockwise: true)
        }else if shapeType == .kSemiCircleLeft{
             drawCircularArc(view: cell.mainView, startAngle: -.pi/2, endAngle: .pi/2,isClockwise: false)

        }else if shapeType == .kSemiCircleRight{
             drawCircularArc(view: cell.mainView, startAngle: -.pi/2, endAngle: .pi/2,isClockwise: true)
        }else if shapeType == .kPie{
             drawCircularArc(view: cell.mainView, startAngle: -(.pi)/6, endAngle: -2*(.pi)/3,isClockwise: false)
        }else if shapeType ==  .kTopCurve{
            let startPoint = CGPoint(x: 20, y: 60)
            let endPoint = CGPoint(x: cell.mainView.bounds.width-20, y: 60)
            let curvePoint1 = CGPoint(x: 60, y: 10)
            let curvePoint2 = CGPoint(x: cell.mainView.bounds.width-80, y: 10)
            
           drawArc(view: cell.mainView, startPoint: startPoint, curvePoint1:curvePoint1, curvePoint2: curvePoint2, endPoint: endPoint)
        }else if shapeType == .kBottomCurve{
            let startPoint = CGPoint(x: 20, y: 60)
            let endPoint = CGPoint(x: cell.mainView.bounds.width-20, y: 60)
            let curvePoint1 = CGPoint(x: 60, y: 120)
            let curvePoint2 = CGPoint(x: cell.mainView.bounds.width-80, y: 120)
            
           drawArc(view: cell.mainView, startPoint: startPoint, curvePoint1:curvePoint1, curvePoint2: curvePoint2, endPoint: endPoint)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}
