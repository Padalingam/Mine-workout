//
//  StackViewController.swift
//  DermWritePractice
//
//  Created by Padalingam A on 5/22/17.
//  Copyright © 2017 Padalingam A. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {

    @IBOutlet weak var horizontalStackview: UIStackView!
    @IBOutlet weak var stackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func removeView(_ sender: Any) {
        let last: UIView? = self.stackView.arrangedSubviews.last
        if let lastView = last {
            self.stackView.removeArrangedSubview(lastView)
            lastView.removeFromSuperview()
            UIView.animate(withDuration: 0.5, animations: { 
                self.stackView.layoutIfNeeded()
            })
        }
    }

    @IBAction func add(_ sender: Any) {
      let firstView = stackView.arrangedSubviews[0]
      let secondView = UIButton(frame: firstView.frame)
        secondView.backgroundColor = UIColor.red
        self.stackView.insertArrangedSubview(secondView, at: 0)
        UIView.animate(withDuration: 0.5, delay: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.stackView.layoutIfNeeded()
        })
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
