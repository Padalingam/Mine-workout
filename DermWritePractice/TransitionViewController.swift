//
//  TransitionViewController.swift
//  DermWritePractice
//
//  Created by Padalingam A on 5/25/17.
//  Copyright © 2017 Padalingam A. All rights reserved.
//

import UIKit

class TransitionViewController: UIViewController {

    @IBOutlet weak var answerView: UIView!
    @IBOutlet weak var questionView: UIView!
    var flipcard = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func questionAction(_ sender: Any) {
        flipcard = !flipcard
        let fromView = flipcard ? questionView : answerView
        let toView = flipcard ? answerView : questionView
        UIView.transition(from: fromView!, to: toView!, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews])

    }

    @IBAction func ansAction(_ sender: Any) {
        
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
