//
//  CircleView.swift
//  Minigame Tripleplay

import UIKit

class CircleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        // Get the Graphics Context
        if let context = UIGraphicsGetCurrentContext() {
            
            // line width
            context.setLineWidth(3.0);
            
            // line color
            UIColor.black.set()
            
            // Create Circle
            let circleCenter = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
            let r = (frame.size.width - 10)/2
            context.addArc(center: circleCenter, radius: r, startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true)
            
            // Draw
            context.strokePath()
        }
    }

}
