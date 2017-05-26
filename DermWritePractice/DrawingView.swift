//
//  DrawingView.swift
//  DermWritePractice
//
//  Created by Padalingam A on 5/23/17.
//  Copyright © 2017 Padalingam A. All rights reserved.
//

import UIKit

class DrawingView: UIView {
    var lastPoint: CGPoint = .zero
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var brushWidth: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    var swiped = false
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        //fatalError("init(coder:) has not been implemented")
    }
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
       
    }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.location(in: self)
        }
    }
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContext(self.frame.size)
        let context = UIGraphicsGetCurrentContext()
        self.draw(CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        context?.move(to: fromPoint)
        context?.addLine(to: toPoint)
        context?.setLineCap(CGLineCap.butt)
        context?.setLineWidth(2.0)
        context?.setFillColor(UIColor.black.cgColor)
        context?.strokePath()
        //CGContextMoveToPoint(context, fromPoint.x, fromPoint.y)
        //CGContextAddLineToPoint(context, toPoint.x, toPoint.y)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            // draw a single point
            drawLineFrom(fromPoint: lastPoint, toPoint: lastPoint)
        }
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: self)
            drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
            
            // 7
            lastPoint = currentPoint
        }
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
