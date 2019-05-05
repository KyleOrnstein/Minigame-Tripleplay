//
//  ViewController.swift
//  Minigame Tripleplay
//
//  Created by Kyle Ornstein on 3/27/19.
//  Copyright © 2019 Kyle Ornstein. All rights reserved.
//

import UIKit

class TicTacToeViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func seeScores(_ sender: Any) {
        performSegue(withIdentifier: "seeScoresT", sender: nil)
    }
    
}

