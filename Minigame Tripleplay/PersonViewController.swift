//
//  PersonViewController.swift
//  Minigame Tripleplay
//
//  Created by Kyle Ornstein on 4/4/19.
//  Copyright © 2019 Kyle Ornstein. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {
    
    func drawHead(){
        let circleView = CircleView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        view.addSubview(circleView)
        print(view.frame.width)
        print(view.frame.width/2)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let margins = view.layoutMarginsGuide
        drawHead()
    }
    

    

}
