//
//  LayerViewController.swift
//  DermWritePractice
//
//  Created by Padalingam A on 5/25/17.
//  Copyright © 2017 Padalingam A. All rights reserved.
//

import UIKit

class LayerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let layer = CALayer()
        layer.backgroundColor = UIColor.red.cgColor
        layer.cornerRadius = 40
        layer.masksToBounds = true
        layer.frame = self.view.frame.insetBy(dx: 20, dy: 20)
            //self.view.layer.addSublayer(layer)
        let sublayer = CALayer()
        sublayer.backgroundColor = UIColor.blue.cgColor
        sublayer.shadowColor = UIColor.black.cgColor
        sublayer.shadowOffset = CGSize(width: 10, height: 10)
        sublayer.shadowRadius = 10
        sublayer.shadowOpacity = 0.8
        sublayer.borderWidth = 3
        sublayer.cornerRadius = 20
        sublayer.borderColor = UIColor.black.cgColor
        sublayer.frame = layer.frame.insetBy(dx: 100, dy: 100)
        sublayer.contents = UIImage(named: "icon")?.cgImage
        
            //layer.addSublayer(sublayer)
       // drawLine()
       // shadowPath()
        // shapeLayer()
        //textAnimation()
        //drawRect()
        //circleShape()
        //starShape()
        //textShape()
        //gradientLayer()
        //replicatorLayer1()
       // replicatorLayer2()
        tranformLayer()
    }
    
    func tranformLayer() {
        let layer = CATransformLayer()
        
        func layerOfColor(_ color: UIColor, zPosition: CGFloat) -> CALayer {
            let layer = CALayer()
            layer.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
            layer.backgroundColor = color.cgColor
            layer.zPosition = zPosition
            layer.opacity = 0.5
            
            return layer
        }
        
        layer.addSublayer(layerOfColor(.red, zPosition: 20))
        layer.addSublayer(layerOfColor(.green, zPosition: 40))
        layer.addSublayer(layerOfColor(.blue, zPosition: 60))
        
        var perspective = CATransform3DIdentity
        perspective.m34 = -1 / 100
        
        layer.transform = CATransform3DRotate(perspective, 0.1, 0, 1, 0)
        view.layer.addSublayer(layer)
    }
    
    func replicatorLayer2() {
        view.backgroundColor = UIColor.gray
        let r = CAReplicatorLayer()
        r.bounds = CGRect(x: 0.0, y: 0.0, width: 200.0, height: 200.0)
        r.cornerRadius = 10.0
        r.backgroundColor = UIColor(white: 0.0, alpha: 0.75).cgColor
        r.position = view.center
        
        view.layer.addSublayer(r)
        
        let dot = CALayer()
        dot.bounds = CGRect(x: 0.0, y: 0.0, width: 14.0, height: 14.0)
        dot.position = CGPoint(x: 100.0, y: 40.0)
        dot.backgroundColor = UIColor(white: 0.8, alpha: 1.0).cgColor
        dot.borderColor = UIColor(white: 1.0, alpha: 1.0).cgColor
        dot.borderWidth = 1.0
        dot.cornerRadius = 2.0
        
        r.addSublayer(dot)
        
        let nrDots: Int = 15
        
        r.instanceCount = nrDots
        let angle = CGFloat(2 * Double.pi) / CGFloat(nrDots)
        r.instanceTransform = CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0)
        
        let duration: CFTimeInterval = 1.5
        
        let shrink = CABasicAnimation(keyPath: "transform.scale")
        shrink.fromValue = 1.0
        shrink.toValue = 0.1
        shrink.duration = duration
        shrink.repeatCount = Float.infinity
        
        dot.add(shrink, forKey: nil)
        
        r.instanceDelay = duration/Double(nrDots)
        dot.transform = CATransform3DMakeScale(0.01, 0.01, 0.01)
    }
    
    func replicatorLayer1() {
        let r = CAReplicatorLayer()
        r.bounds = CGRect(x: 0.0, y: 0.0, width: 60.0, height: 60.0)
        r.position = view.center
        r.backgroundColor = UIColor.lightGray.cgColor
        view.layer.addSublayer(r)
        let bar = CALayer()
        bar.bounds = CGRect(x: 0.0, y: 0.0, width: 8.0, height: 40.0)
        bar.position = CGPoint(x: 10.0, y: 75.0)
        bar.cornerRadius = 2.0
        bar.backgroundColor = UIColor.red.cgColor
        
        r.addSublayer(bar)
        
        let move = CABasicAnimation(keyPath: "position.y")
        move.toValue = bar.position.y - 35.0
        move.duration = 0.5
        move.autoreverses = true
        move.repeatCount = Float.infinity
        
        bar.add(move, forKey: nil)
        r.instanceCount = 3
        r.instanceTransform = CATransform3DMakeTranslation(20.0, 0.0, 0.0)
        r.instanceDelay = 0.33
    }
    
    func gradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        self.view.layer.addSublayer(gradientLayer)
    }
    
    func textShape() {
        let myAttributes = [
            NSFontAttributeName: UIFont(name: "Chalkduster", size: 30.0)! , // font
            NSForegroundColorAttributeName: UIColor.cyan                    // text color
        ]
        let myAttributedString = NSAttributedString(string: "My text", attributes: myAttributes )
        let myTextLayer = CATextLayer()
        myTextLayer.string = myAttributedString
        myTextLayer.backgroundColor = UIColor.blue.cgColor
        myTextLayer.foregroundColor = UIColor.cyan.cgColor
        myTextLayer.frame = self.view.bounds
        self.view.layer.addSublayer(myTextLayer)
    }
    
    func starShape() {
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.frame = CGRect(x: 0.0, y: 0.0, width: 120.0, height: 120.0)
        shapeLayer.lineWidth = 2.0
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.green.cgColor
        
        let starPath = UIBezierPath()
        
        let shapeBounds = shapeLayer.bounds
        let center = shapeLayer.position
        
        let numberOfPoints = CGFloat(5.0)
        let numberOfLineSegments = Int(numberOfPoints * 2.0)
        let theta = .pi / numberOfPoints
        
        let circumscribedRadius = center.x
        let outerRadius = circumscribedRadius * 1.039
        let excessRadius = outerRadius - circumscribedRadius
        let innerRadius = CGFloat(outerRadius * 0.382)
        
        let leftEdgePointX = (center.x + cos(4.0 * theta) * outerRadius) + excessRadius
        let horizontalOffset = leftEdgePointX / 2.0
        
        // Apply a slight horizontal offset so the star appears to be more
        // centered visually
        let offsetCenter = CGPoint(x: center.x - horizontalOffset, y: center.y)
        
        // Alternate between the outer and inner radii while moving evenly along the
        // circumference of the circle, connecting each point with a line segment
        for i in 0..<numberOfLineSegments {
            let radius = i % 2 == 0 ? outerRadius : innerRadius
            
            let pointX = offsetCenter.x + cos(CGFloat(i) * theta) * radius
            let pointY = offsetCenter.y + sin(CGFloat(i) * theta) * radius
            let point = CGPoint(x: pointX, y: pointY)
            
            if i == 0 {
                starPath.move(to: point)
            } else {
                starPath.addLine(to: point)
            }
        }
        
        starPath.close()
        
        // Rotate the path so the star points up as expected
        var pathTransform  = CGAffineTransform.identity
        pathTransform = pathTransform.translatedBy(x: center.x, y: center.y)
        pathTransform = pathTransform.rotated(by: CGFloat(Double.pi/2))
        pathTransform = pathTransform.translatedBy(x: -center.x, y: -center.y)
        
        starPath.apply(pathTransform)
        
        shapeLayer.path = starPath.cgPath
        self.view.layer.addSublayer(shapeLayer)
    }
    
    func circleShape() {
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.frame = CGRect(x: 0.0, y: 0.0, width: 120.0, height: 120.0)
        shapeLayer.lineWidth = 2.0
        //shapeLayer.fillColor = UIColor.black.cgColor
        shapeLayer.strokeColor = UIColor.green.cgColor
        
        let arcCenter = shapeLayer.position
        let radius = shapeLayer.bounds.size.width / 2.0
        let startAngle = CGFloat(0.0)
        let endAngle = CGFloat(2.0 * .pi)
        let clockwise = true
        
        let circlePath = UIBezierPath(arcCenter: arcCenter,
                                      radius: radius,
                                      startAngle: startAngle,
                                      endAngle: endAngle,
                                      clockwise: clockwise)
        
        shapeLayer.path = circlePath.cgPath
        self.view.layer.addSublayer(shapeLayer)
    }
    
    func drawRect() {
        let shapeLayer1 = CAShapeLayer()
        
        shapeLayer1.lineWidth = 5.0
        shapeLayer1.fillColor = UIColor.black.cgColor
        shapeLayer1.strokeColor = UIColor.green.cgColor
        let rect = CGRect(x: 100, y: 100, width: 100, height: 100)
       // shapeLayer1.path = UIBezierPath(rect: CGRect(x: 100, y: 100, width: 100, height: 100)).cgPath
        //shapeLayer1.path = UIBezierPath(roundedRect: rect, cornerRadius: 20).cgPath
        //shapeLayer1.path = UIBezierPath(roundedRect: rect, byRoundingCorners: [UIRectCorner.topLeft, UIRectCorner.topRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
        shapeLayer1.path = UIBezierPath(ovalIn: rect).cgPath
       // shapeLayer1.path = UIBezierPath(arcCenter: CGPoint(x:100, y:100), radius: 20, startAngle: 100, endAngle: 180, clockwise: true).cgPath
        //shapeLayer1.path = UIBezierPath().cgPath
        self.view.layer.addSublayer(shapeLayer1)
    }
    
    func textAnimation() {
        let label = UILabel()
        label.frame = CGRect(x: 100.0, y: 100.0, width: 400.0, height: 75.0)
        label.backgroundColor = UIColor.white
        label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.title1)
        label.textAlignment = .center
        label.text = "Hello, world!"
        self.view.addSubview(label)
        let fadeTransition = CATransition()
        fadeTransition.duration = 1
        
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            label.text = "Goodnight, moon..."
            label.layer.add(fadeTransition, forKey: kCATransition)
        })
        
        label.text = ""
        label.layer.add(fadeTransition, forKey: kCATransition)
        
        CATransaction.commit()
    }
    
    func drawLine() {
//        let layer = CAShapeLayer()
//        layer.path = UIBezierPath(roundedRect: CGRect(x: 64, y: 64, width: 160, height: 160), cornerRadius: 50).cgPath
//        layer.fillColor = UIColor.red.cgColor
//        view.layer.addSublayer(layer)
        
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 100, y: 100))
        linePath.addLine(to: CGPoint(x: 200, y: 200))
        line.path = linePath.cgPath
        line.fillColor = UIColor.black.cgColor
        line.opacity = 1.0
        line.strokeColor = UIColor.green.cgColor
        self.view.layer.addSublayer(line)
        
       
    }
    
    func applyFilter() {
        
        let textLayer = CATextLayer()
        textLayer.string = "Core Animation"
        textLayer.foregroundColor = UIColor.blue.cgColor
        textLayer.backgroundColor = UIColor.lightGray.cgColor
        textLayer.alignmentMode = kCAAlignmentCenter
        textLayer.fontSize = 100
        textLayer.frame = CGRect(x: 20, y: 20, width: 700, height: 140)
        
        if let filter = CIFilter(name: "CIPointillize",
                                 withInputParameters: ["inputRadius": 6]) {
            textLayer.filters = [filter]
        }
        
        view.layer.addSublayer(textLayer)
    }

    func shadowPath() {
        let layer = CALayer()
        
        layer.frame = CGRect(x: 75, y: 75, width: 150, height: 150)
        layer.backgroundColor = UIColor.darkGray.cgColor
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 1
        
        let contactShadowSize: CGFloat = 20
        let shadowRect = CGRect(x: 0, y:160 , width: layer.bounds.width, height: 20)
        let shadowPath = CGPath(ellipseIn: shadowRect, transform: nil)
//            CGPath(ellipseIn: CGRect(x: contactShadowSize,
//                                                  y: contactShadowSize * 0.5,
//                                                  width: layer.bounds.width + contactShadowSize * 2,
//                                                  height: contactShadowSize),
//                                transform: nil)
        
        layer.shadowPath = shadowPath
        self.view.layer.addSublayer(layer)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
