//
//  SeeScoresViewController.swift
//  Minigame Tripleplay
//
//  Created by Kyle Ornstein on 5/5/19.
//  Copyright © 2019 Kyle Ornstein. All rights reserved.
//

import UIKit
import CoreData

class SeeScoresViewController: UIViewController {
    @IBOutlet var hangman: UILabel!
    @IBOutlet var tictactoe: UILabel!
    @IBOutlet var war: UILabel!
    
    var hangmanU = 0
    var hangmanC = 0
    var tictactoeU = 0
    var tictactoeC = 0
    var warU = 0
    var warC = 0
    
    func updateHangman(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Wins")
        let test = try! context.fetch(fetchRequest)
        let object = test[0] as! NSManagedObject
        object.setValue(0, forKey: "hangmanU")
        object.setValue(0, forKey: "hangmanC")
        object.setValue(0, forKey: "tictactoeU")
        object.setValue(0, forKey: "tictactoeC")
        object.setValue(0, forKey: "warU")
        object.setValue(0, forKey: "warC")
        do {
            try context.save()
            
        } catch {
            
            print("Failed")
        }
        
    }
    
    func gethangman(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Wins")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                hangmanU = Int(data.value(forKey: "hangmanU") as! Int32)
                tictactoeU = Int(data.value(forKey: "tictactoeU") as! Int32)
                warU = Int(data.value(forKey: "warU") as! Int32)
                hangmanC = Int(data.value(forKey: "hangmanC") as! Int32)
                tictactoeC = Int(data.value(forKey: "tictactoeC") as! Int32)
                warC = Int(data.value(forKey: "warC") as! Int32)
            }
            
        } catch {
            
            print("Failed")
        }
    }
    
    func updateScreen(){
        gethangman()
        hangman.text = "Hangman:\nUser Wins = " + String(hangmanU) + "\nComputer Wins = " +  String(hangmanC)
        tictactoe.text = "Hangman:\nUser Wins = " + String(tictactoeU) + "\nComputer Wins = " +  String(tictactoeC)
        war.text = "Hangman:\nUser Wins = " + String(warU) + "\nComputer Wins = " +  String(warC)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateScreen()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func resetWins(_ sender: Any) {
        updateHangman()
        updateScreen()
    }
    
}
