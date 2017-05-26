//
//  SegmentedControl.swift
//  DermWritePractice
//
//  Created by Padalingam A on 5/26/17.
//  Copyright © 2017 Padalingam A. All rights reserved.
//

import UIKit

@IBDesignable class SegmentedControl: UIControl {
    
    private var labels = [UILabel]()
    var thumbView = UIView()
    var items: [String] = ["Items 1", "Items 2", "Items 4"] {
        didSet{
            setUpLabels()
        }
    }
    func setUpView() {
        layer.cornerRadius = frame.height / 2
        layer.borderColor = UIColor(white: 1.0, alpha: 0.5).cgColor
        layer.borderWidth = 2
        backgroundColor = UIColor.clear
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
        thumbView.backgroundColor = UIColor.white
        thumbView.layer.cornerRadius = thumbView.frame.height / 2
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
