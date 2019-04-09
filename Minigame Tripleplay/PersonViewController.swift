//
//  PersonViewController.swift
//  Minigame Tripleplay
//
//  Created by Kyle Ornstein on 4/4/19.
//  Copyright © 2019 Kyle Ornstein. All rights reserved.
//

import UIKit

extension UIView {
    
    //found extension here allowing me to rotate a view around the edge rather then center
    //https://www.hackingwithswift.com/example-code/calayer/how-to-change-a-views-anchor-point-without-moving-it
    func setAnchorPoint(_ point: CGPoint) {
        var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y);
        
        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)
        
        var position = layer.position
        
        position.x -= oldPoint.x
        position.x += newPoint.x
        
        position.y -= oldPoint.y
        position.y += newPoint.y
        
        layer.position = position
        layer.anchorPoint = point
    }
}

class PersonViewController: UIViewController {
    
    @IBOutlet var leftLeg: UIView!
    @IBOutlet var rightLeg: UIView!
    @IBOutlet var leftArm: UIView!
    @IBOutlet var rightArm: UIView!
    @IBOutlet var personView: UIView!
    @IBOutlet var body: UIView!
    
    func drawHead(){
        let circleView = CircleView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        personView.addSubview(circleView)
    }
    
    func setArmsAndLegs(){
        leftLeg.setAnchorPoint(CGPoint(x: 1, y: 0))
        rightLeg.setAnchorPoint(CGPoint(x: 0, y: 0))
        leftArm.setAnchorPoint(CGPoint(x: 1, y: 1))
        rightArm.setAnchorPoint(CGPoint(x: 0, y: 1))
        self.leftLeg.transform = CGAffineTransform(rotationAngle: .pi / 4)
        self.rightLeg.transform = CGAffineTransform(rotationAngle: (.pi / -4))
        self.leftArm.transform = CGAffineTransform(rotationAngle: (.pi / -4))
        self.rightArm.transform = CGAffineTransform(rotationAngle: (.pi / 4))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        drawHead()
        setArmsAndLegs()
    }

    

}
