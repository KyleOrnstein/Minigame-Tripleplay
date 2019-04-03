//
//  GallowsViewController.swift
//  Minigame Tripleplay
//
//  Created by Kyle Ornstein on 4/3/19.
//  Copyright © 2019 Kyle Ornstein. All rights reserved.
//

import UIKit

class GallowsViewController: UIViewController {
    @IBOutlet var nooseLabel: UILabel!
    
    func drawHead(){
        let circleView = CircleView(frame: CGRect(x: nooseLabel.frame.origin.x - nooseLabel.frame.size.width - 10, y: nooseLabel.frame.origin.y + nooseLabel.frame.size.height - 7, width: 50, height: 50))
        super.view.addSubview(circleView)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawHead()
        // Do any additional setup after loading the view.
    }


}
