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
       // applyFilter()
        shadowPath()
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
