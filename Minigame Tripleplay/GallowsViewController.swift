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
    @IBOutlet var personView: UIView!
    @IBOutlet var gallowsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gallowsView.addSubview(personView)
    }


}
