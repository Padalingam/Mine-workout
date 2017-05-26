//
//  MyTestView.swift
//  DermWritePractice
//
//  Created by Padalingam A on 5/26/17.
//  Copyright © 2017 Padalingam A. All rights reserved.
//

import UIKit

class MyTestView: UIView {
    override func draw(_ rect: CGRect) {
        //drawLine()
        //drawMultipleLines()
        drawRect()
    }
    private func drawRect() {
        let context = UIGraphicsGetCurrentContext()
        //context?.move(to: CGPoint(x: 100, y: 100))
        context?.addRect(CGRect(x: 10, y: 10, width: 100, height: 100))
        context?.setLineCap(CGLineCap.butt)
        context?.setLineWidth(5.0)
        context?.setFillColor(UIColor.black.cgColor)
       // context?.setShadow(offset: CGSize(width: 10, height: 10), blur: 0.5)
        context?.setShadow(offset: CGSize(width: 10, height: 10), blur: 0.5, color: UIColor.red.cgColor)
        context?.strokePath()
    }

    private func drawMultipleLines() {
        let context = UIGraphicsGetCurrentContext()
        context?.move(to: CGPoint(x: 100, y: 100))
        let pathArray = [CGPoint(x: 250, y: 150),
                         CGPoint(x: 300, y: 300),
                         CGPoint(x: 50, y: 400),
                         ]
        context?.addLines(between: pathArray)
        context?.setLineCap(CGLineCap.butt)
        context?.setLineWidth(2.0)
        context?.setFillColor(UIColor.black.cgColor)
        context?.strokePath()
    }
    
    private func drawLine() {
        let context = UIGraphicsGetCurrentContext()
        context?.move(to: CGPoint(x: 100, y: 100))
        context?.addLine(to: CGPoint(x: 200, y: 200))
        context?.setLineCap(CGLineCap.butt)
        context?.setLineWidth(2.0)
        context?.setFillColor(UIColor.black.cgColor)
        context?.strokePath()
    }
}

