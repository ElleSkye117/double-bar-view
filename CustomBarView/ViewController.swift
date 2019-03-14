//
//  ViewController.swift
//  CustomBarView
//
//  Created by MLeber on 1/7/19.
//  Copyright © 2019 MLeber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}


@IBDesignable
class DoubleBargraphView: UIView {
    
    @IBInspectable
    var vertical: Bool = true {
        didSet {
            drawGraph()
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat = 6.0 {
        didSet {
            drawGraph()
        }
    }
    
    @IBInspectable
    var primaryColor: UIColor = .black {
        didSet {
            drawGraph()
        }
    }
    
    @IBInspectable
    var secondaryColor: UIColor? {
        didSet {
            drawGraph()
        }
    }
    
    @IBInspectable
    var primaryPercent: CGFloat = 0.0 {
        didSet {
            drawGraph()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func draw(_ rect: CGRect) {
        drawGraph()
    }
    
    private func commonInit() {
        layer.backgroundColor = UIColor.clear.cgColor
        layer.masksToBounds = true
    }
    
    private func drawGraph() {
        layer.cornerRadius = cornerRadius
        layer.sublayers?.forEach {
            $0.removeFromSuperlayer()
        }
        
        if let secondaryColor = secondaryColor {
            let backgroundLayer = CALayer()
            backgroundLayer.frame = bounds
            backgroundLayer.backgroundColor = secondaryColor.cgColor
            layer.insertSublayer(backgroundLayer, at: 0)
        }
        
        let frontLayer = CALayer()
        frontLayer.backgroundColor = primaryColor.cgColor
        
        let width = vertical ? frame.width : primaryPercent * frame.width
        let height = vertical ? (primaryPercent * frame.height) : frame.height
        let y: CGFloat = vertical ? frame.height - (primaryPercent * frame.height) : 0.0
        frontLayer.frame = CGRect(x: 0, y: y, width: width, height: height)
        frontLayer.backgroundColor = primaryColor.cgColor
     
        layer.addSublayer(frontLayer)
    }
    
}
