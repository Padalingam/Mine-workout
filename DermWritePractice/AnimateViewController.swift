//
//  AnimateViewController.swift
//  DermWritePractice
//
//  Created by Padalingam A on 5/25/17.
//  Copyright © 2017 Padalingam A. All rights reserved.
//

import UIKit

class AnimateViewController: UIViewController {

    @IBOutlet weak var customView: UIView!
    var flag: Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        flag = true
        customView.frame.size = .zero
        customView.layer.cornerRadius = 15
        customView.layer.shadowOffset = CGSize(width: 5, height: 5)
        customView.layer.shadowRadius = 2.5
        customView.layer.shadowColor = UIColor.black.cgColor
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func expand(_ sender: Any) {
        if flag {
            UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                //self.customView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                               // self.customView.frame.size = CGSize(width: self.customView.frame.size.width+100, height: self.customView.frame.size.height+100)
                self.customView.frame.size.width += 500
                self.customView.frame.origin.x -= 500
                self.customView.frame.size.height += 500
                self.customView.layer.cornerRadius = 15
                self.customView.layer.shadowOffset = CGSize(width: 20, height: 20)
                self.customView.layer.shadowRadius = 10
                self.customView.layer.borderWidth = 5
                self.customView.layer.borderColor = UIColor.black.cgColor
                self.customView.layer.shadowColor = UIColor.black.cgColor
                //self.customView.frame.origin.y += 100
                
            })
//            UIView.animate(withDuration: 0.5) {
//                //self.customView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//                self.customView.frame.size = CGSize(width: self.customView.frame.size.width+100, height: self.customView.frame.size.height+100)
//            }
            flag = !flag
        } else {
            UIView.animate(withDuration: 0.5) {
                self.customView.frame.size.width = 0
                self.customView.frame.origin.x += 500
                self.customView.frame.size.height = 0
                //self.customView.transform = .identity
               // self.customView.frame.size = CGSize(width: self.customView.frame.size.width-100, height: self.customView.frame.size.height-100)
            }
            flag = !flag
        }
      
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
