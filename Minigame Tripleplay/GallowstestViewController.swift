//
//  GallowstestViewController.swift
//  Minigame Tripleplay
//
//  Created by Kyle Ornstein on 5/5/19.
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


class GallowstestViewController: UIViewController {
    @IBOutlet var leftLeg: UIView!
    @IBOutlet var rightLeg: UIView!
    @IBOutlet var leftArm: UIView!
    @IBOutlet var rightArm: UIView!
    @IBOutlet var personView: UIView!
    @IBOutlet var body: UIView!
    @IBOutlet var head: UIView!
    var wrongs = 0
    

    func setArmsAndLegs(){
        leftLeg.setAnchorPoint(CGPoint(x: 1, y: 0))
        rightLeg.setAnchorPoint(CGPoint(x: 0, y: 0))
        leftArm.setAnchorPoint(CGPoint(x: 1, y: 1))
        rightArm.setAnchorPoint(CGPoint(x: 0, y: 1))
        self.leftLeg.transform = CGAffineTransform(rotationAngle: .pi / 4)
        self.rightLeg.transform = CGAffineTransform(rotationAngle: (.pi / -4))
        self.leftArm.transform = CGAffineTransform(rotationAngle: (.pi / -4))
        self.rightArm.transform = CGAffineTransform(rotationAngle: (.pi / 4))
        self.head.alpha = 0
        self.leftArm.alpha = 0
        self.leftLeg.alpha = 0
        self.rightArm.alpha = 0
        self.rightLeg.alpha = 0
        self.body.alpha = 0
    }
    
    func addBodyParts(){
        switch wrongs {
        case 1:
            self.head.alpha = 1
            break
        case 2:
            self.body.alpha = 1
            break
        case 3:
            leftArm.alpha = 1
            break
        case 4:
            rightArm.alpha = 1
            break
        case 5:
            leftLeg.alpha = 1
            break
        case 6:
            rightLeg.alpha = 1
            break
        default:
            break
        }
    }
    
    func bodyDisapear(){
        self.head.alpha = 0
        self.leftArm.alpha = 0
        self.leftLeg.alpha = 0
        self.rightArm.alpha = 0
        self.rightLeg.alpha = 0
        self.body.alpha = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setArmsAndLegs()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func seeScores(_ sender: Any) {
        performSegue(withIdentifier: "seeScoresH", sender: nil)
    }
    
    @IBAction func updateHangedMan (sender: UIStoryboardSegue) {
        if let controller = sender.source as? KeysTestViewController {
            wrongs = controller.wrongs
        }
        if wrongs != 0{
            addBodyParts()
        }
        else{
            bodyDisapear()
        }
    }
}
