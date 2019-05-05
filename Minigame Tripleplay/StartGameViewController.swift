//
//  StartGameViewController.swift
//  Minigame Tripleplay
//
//  Created by Kyle Ornstein on 5/5/19.
//  Copyright © 2019 Kyle Ornstein. All rights reserved.
//

import UIKit
import CoreData

class StartGameViewController: UIViewController {

    func createEntity(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Wins", into: context)
        
        entity.setValue(0, forKey: "hangmanC")
        entity.setValue(0, forKey: "tictactoeC")
        entity.setValue(0, forKey: "warC")
        entity.setValue(0, forKey: "hangmanU")
        entity.setValue(0, forKey: "tictactoeU")
        entity.setValue(0, forKey: "warU")
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Wins")
        request.returnsObjectsAsFaults = false
        do{
            let result = try context.fetch(request)
            if result.count < 1{
                createEntity()
                }
        }
        catch{
            print("failed")
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func PlayNow(_ sender: Any) {
        let alert = UIAlertController(title: "Game is Starting", message: "Are you ready for it to start", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:{
            action in self.performSegue(withIdentifier: "startGame", sender:nil);
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
  
}
