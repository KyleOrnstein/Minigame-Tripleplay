//
//  HangmanViewController.swift
//  Minigame Tripleplay
//
//  Created by Kyle Ornstein on 3/28/19.
//  Copyright © 2019 Kyle Ornstein. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    @IBOutlet var hangmanLabel: UILabel!
    @IBOutlet var aToi: UIStackView!
    @IBOutlet var jTor: UIStackView!
    @IBOutlet var sToz: UIStackView!
    @IBOutlet var verticalConstraint: NSLayoutConstraint!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    verticalConstraint.constant = 0
    }
    

}
