//
//  SegmentedControl.swift
//  DermWritePractice
//
//  Created by Padalingam A on 5/26/17.
//  Copyright © 2017 Padalingam A. All rights reserved.
//

import UIKit

@IBDesignable class CustomTab: UIControl {
    
    private var labels = [UILabel]()
    var thumbView = UIView()
    var thumbBarImage = UIView()
    var items: [String] = ["Items 1", "Items 2", "Items 4"] {
        didSet{
            setUpLabels()
            // Comment
        }
    }
    func setUpView() {
        backgroundColor = UIColor.black
        setUpLabels()
        insertSubview(thumbView, at: 0)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    var selectedIndex: Int = 0 {
        didSet {
            displaySelectedIndex()
        }
    }
    func setUpLabels() {
        for label in labels {
            label.removeFromSuperview()
        }
        labels.removeAll(keepingCapacity: true)
        for index in 1...items.count {
            let label = UILabel(frame: .zero)
            label.text = items[index-1]
            label.textAlignment = .center
            label.textColor = UIColor(white: 0.5, alpha: 1.0)
            self.addSubview(label)
            labels.append(label)
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        var calculatedIndex: Int?
        for (index, item) in labels.enumerated() {
            if item.frame.contains(location) {
                calculatedIndex = index
            }
        }
        if calculatedIndex != nil {
            selectedIndex = calculatedIndex!
            sendActions(for: .valueChanged)
        }
        return false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var selectFrame = self.bounds
        let newWidth = selectFrame.width / CGFloat(items.count)
        selectFrame.size.width = newWidth
        thumbView.frame = selectFrame
        thumbBarImage.frame = CGRect(x: selectFrame.origin.x, y: selectFrame.size.height-5, width: selectFrame.size.width, height: 5)
        thumbBarImage.backgroundColor = UIColor.white
        thumbBarImage.alpha = 0.5
        thumbView.addSubview(thumbBarImage)
        thumbView.backgroundColor = UIColor.red
        let labelHeight = self.bounds.height
        let labelWidth = self.bounds.width / CGFloat(labels.count)
        for index in 0...labels.count - 1 {
            let label = labels[index]
            let xPosition = CGFloat(index) * labelWidth
            label.frame = CGRect(x: xPosition, y: 0, width: labelWidth, height: labelHeight)
        }
    }
    func displaySelectedIndex() {
        let label = labels[selectedIndex]
        UIView.animate(withDuration: 0.5) {
            self.thumbView.frame = label.frame
        }
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
