//
//  ViewController.swift
//  DermWritePractice
//
//  Created by Padalingam A on 5/22/17.
//  Copyright © 2017 Padalingam A. All rights reserved.
//

import UIKit

enum TouchState {
    case began, moved, ended, cancelled
}

class ViewController: UIViewController {

    @IBOutlet weak var customView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var lastPoint:CGPoint!
    var isSwiping:Bool!
    var red:CGFloat!
    var green:CGFloat!
    var blue:CGFloat!
    var curPoint: CGPoint!
    var circleView:UIView?
    var touchState: TouchState?
    var startPoint: CGPoint!
   // var movedPoint: CGPoint
    
    override func viewDidLoad() {
        super.viewDidLoad()
        red   = (0.0/255.0)
        green = (0.0/255.0)
        blue  = (0.0/255.0)
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isSwiping = false
        touchState = .began
        if let touch = touches.first {
            lastPoint = touch.location(in: imageView)
            startPoint = lastPoint
        }
    }
    // For scribble
   /* override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: view)
            drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
            lastPoint = currentPoint
        }
    }*/
    // Draw a straight line
   /* override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: view)
            curPoint = currentPoint
        }
    } 
     override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
         if let touch = touches.first {
         let currentPoint = touch.location(in: view)
         let drawPoint = CGPoint(x: currentPoint.x, y:lastPoint.y)
         drawLineFrom(fromPoint: lastPoint, toPoint: drawPoint)
         }
     }
     */
    // Draw a circle
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: view)
            if ((startPoint.x < currentPoint.x) && ((startPoint?.y)! < currentPoint.y)){
               drawCricle(fromPoint: lastPoint, toPoint: currentPoint)
            } else {
                drawCricle(fromPoint: currentPoint, toPoint: lastPoint)
            }
            
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: view)
            circleView = nil
           // drawCricle(fromPoint: lastPoint, toPoint: currentPoint)
        }
    }
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContext(view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width:view.frame.size.width, height: view.frame.size.height))
        
        context?.move(to: fromPoint)
        context?.addLine(to: toPoint)
        
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(2.0)
        context?.setStrokeColor(red: red, green: green, blue: blue, alpha: 1.0)
        context?.setBlendMode(CGBlendMode.normal)
        context?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        imageView.alpha = 0.8
        UIGraphicsEndImageContext()
        
    }
    func drawCricle(fromPoint:CGPoint, toPoint: CGPoint) {
        circleView?.removeFromSuperview()
        let circleheight = toPoint.x - fromPoint.x
        let circle = UIView(frame: CGRect(x: fromPoint.x, y: fromPoint.y, width: circleheight, height: circleheight))
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.circleGesture(sender:)))
        //circle.center = self.view.center
        circle.layer.cornerRadius = (circleheight) / 2
        circle.backgroundColor = UIColor.clear
        circle.layer.borderColor = UIColor.black.cgColor
        circle.layer.borderWidth = 3
        circle.clipsToBounds = true
        circleView = circle
        self.imageView.addSubview(circle)
    }
    
    func circleGesture(sender: UIPanGestureRecognizer) {
         let translation = sender.translation(in: self.view)
         sender.view?.center = CGPoint(x: (sender.view?.center.x)! + translation.x, y: (sender.view?.center.y)! + translation.y)
         sender.setTranslation(.zero, in: self.view)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapDetected(_ sender: UIPanGestureRecognizer) {
       /* let translation = sender.translation(in: self.view)
        print("Xis \(translation.x) and y is \(translation.y)")
        sender.view?.center = CGPoint(x: (sender.view?.center.x)! + translation.x, y: (sender.view?.center.y)! + translation.y)
        print("Xis \(translation.x) and y is \(translation.y)")
        sender.setTranslation(.zero, in: self.view) */
        print("panning")
        
        let translation = sender.translation(in: self.view)
        
        print("the translation x:\(translation.x) & y:\(translation.y)")
        
        //sender.view.
        let tmp=sender.view?.center.x  //x translation
        let tmp1=sender.view?.center.y //y translation
        
        //set limitation for x and y origin
        if(translation.x <= 100 && translation.y <= 50 )
        {
            sender.view?.center = CGPoint(x: tmp! + translation.x, y: tmp1!+translation.y)
               // CGPointMake(tmp!+translation.x, tmp1!+translation.y)
            sender.setTranslation(.zero, in: self.view)
        }
    }
    

}

