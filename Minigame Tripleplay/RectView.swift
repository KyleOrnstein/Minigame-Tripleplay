//
//  RectView.swift
//  Minigame Tripleplay
//
//  Created by Kyle Ornstein on 4/3/19.
//  Copyright © 2019 Kyle Ornstein. All rights reserved.
//

import UIKit

class RectView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
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
            
            // Create Rectangle
            let rectangle = CGRect(x: 0, y: 0, width: 50, height: 50)
            
            context.addRect(rectangle)
            
            // Draw
            context.strokePath()
        }
    }
    
}
