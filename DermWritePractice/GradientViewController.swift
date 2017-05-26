//
//  GradientViewController.swift
//  DermWritePractice
//
//  Created by Padalingam A on 5/26/17.
//  Copyright © 2017 Padalingam A. All rights reserved.
//

import UIKit

class GradientViewController: UIViewController {
    @IBOutlet weak var customView: UIViewX!
    var colorArray: [(color1:UIColor, color2:UIColor)] = []
    var colorArrayIndex = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorArray.append((color1:#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1),color2: #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)))
        colorArray.append((color1:#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1),color2: #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)))
        colorArray.append((color1:#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1),color2: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
        colorArray.append((color1:#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1),color2: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
        colorArray.append((color1:#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1),color2: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)))
        colorArray.append((color1:#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1),color2: #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)))
        colorArray.append((color1:#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1),color2: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
        colorArray.append((color1:#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),color2: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
        animateGradient()
        // Do any additional setup after loading the view.
    }
    func animateGradient() {
        colorArrayIndex = colorArrayIndex == (colorArray.count - 1) ? 0 : colorArrayIndex + 1
        UIView.transition(with: customView, duration: 2, options: [.transitionCrossDissolve,.allowUserInteraction], animations: {
            self.customView.firstColor = self.colorArray[self.colorArrayIndex].color1
            self.customView.secondColor = self.colorArray[self.colorArrayIndex].color2
        }) { (success) in
            self.animateGradient()
        }
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
