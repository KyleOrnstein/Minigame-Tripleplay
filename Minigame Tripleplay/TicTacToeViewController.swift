//
//  ViewController.swift
//  Minigame Tripleplay
//
//  Created by Kyle Ornstein on 3/27/19.
//  Copyright © 2019 Kyle Ornstein. All rights reserved.
//

import UIKit
import CoreData

class TicTacToeViewController: UIViewController{
    
    
    @IBOutlet weak var box1button: UIButton!
    @IBOutlet weak var box2button: UIButton!
    @IBOutlet weak var box3button: UIButton!
    @IBOutlet weak var box4button: UIButton!
    @IBOutlet weak var box5button: UIButton!
    @IBOutlet weak var box6button: UIButton!
    @IBOutlet weak var box7button: UIButton!
    @IBOutlet weak var box8button: UIButton!
    @IBOutlet weak var box9button: UIButton!
    
    //an empty board created with a 2D array of empty strings
    var board = [["","",""],
                 ["","",""],
                 ["","",""]]
    
    //player1 will be denoted by the "X"s and player2 the "O"s
    let player1 = "X"
    let player2 = "O"
    
    //delcaration of move counter
    var moves = 0
    
    func disableAllButtons(){
        box1button.isEnabled = false
        box2button.isEnabled = false
        box3button.isEnabled = false
        box4button.isEnabled = false
        box5button.isEnabled = false
        box6button.isEnabled = false
        box7button.isEnabled = false
        box8button.isEnabled = false
        box9button.isEnabled = false
    }
    
    func reableAllButtons(){
        box1button.isEnabled = true
        box2button.isEnabled = true
        box3button.isEnabled = true
        box4button.isEnabled = true
        box5button.isEnabled = true
        box6button.isEnabled = true
        box7button.isEnabled = true
        box8button.isEnabled = true
        box9button.isEnabled = true
    }
    
    func clearButtons(){
        box1button.setTitle("", for: .normal)
        box2button.setTitle("", for: .normal)
        box3button.setTitle("", for: .normal)
        box4button.setTitle("", for: .normal)
        box5button.setTitle("", for: .normal)
        box6button.setTitle("", for: .normal)
        box7button.setTitle("", for: .normal)
        box8button.setTitle("", for: .normal)
        box9button.setTitle("", for: .normal)
    }
    
    //possible winning combinations for player
    func checkWin(board: [[String]]) {
        
        if
            (board[0][0] == player1 && board[0][1] == player1 && board[0][2] == player1) ||
                (board[1][0] == player1 && board[1][1] == player1 && board[1][2] == player1) ||
                (board[2][0] == player1 && board[2][1] == player1 && board[2][2] == player1) ||
                (board[0][0] == player1 && board[1][0] == player1 && board[2][0] == player1) ||
                (board[0][1] == player1 && board[1][1] == player1 && board[2][1] == player1) ||
                (board[0][2] == player1 && board[1][2] == player1 && board[2][2] == player1) ||
                (board[0][0] == player1 && board[1][1] == player1 && board[2][2] == player1) ||
                (board[0][2] == player1 && board[1][1] == player1 && board[2][0] == player1)
        {
            print("Player 1 won")
            updateTicTacToe(winner: "player1")
            disableAllButtons()
        }
        else if
            (board[0][0] == player2 && board[0][1] == player2 && board[0][2] == player2) ||
                (board[1][0] == player2 && board[1][1] == player2 && board[1][2] == player2) ||
                (board[2][0] == player2 && board[2][1] == player2 && board[2][2] == player2) ||
                (board[0][0] == player2 && board[1][0] == player2 && board[2][0] == player2) ||
                (board[0][1] == player2 && board[1][1] == player2 && board[2][1] == player2) ||
                (board[0][2] == player2 && board[1][2] == player2 && board[2][2] == player2) ||
                (board[0][0] == player2 && board[1][1] == player2 && board[2][2] == player2) ||
                (board[0][2] == player2 && board[1][1] == player2 && board[2][0] == player2)
        {
            print("Player 2 won")
            updateTicTacToe(winner: "player2")
            disableAllButtons()
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    //counting number of moves -> calculate whose turn it is by using the mod function
    @IBAction func box1Click(_ sender: Any) {
        
        moves = moves + 1
        
        if 1 == 1
        {
            box1button.setTitle("X", for: .normal)
            board[0][0] = "X"
        }
        else
        {
            box1button.setTitle("O", for: .normal)
            board[0][0] = "O"
        }
        checkWin(board: board)

        print (board)
    }
    
    @IBAction func box2Click(_ sender: Any) {
        
        moves = moves + 1
        
        if moves % 2 != 0
        {
            box2button.setTitle("X", for: .normal)
            board[0][1] = "X"
        }
        else
        {
            box2button.setTitle("O", for: .normal)
            board[0][1] = "O"
        }
        if moves < 9
        {
            checkWin(board: board)
        }
        else
        {
            //draw
        }
        print (board)
    }
    
    @IBAction func box3Click(_ sender: Any) {
        
        moves = moves + 1
        
        if moves % 2 != 0
        {
            box3button.setTitle("X", for: .normal)
            board[0][2] = "X"
        }
        else
        {
            box3button.setTitle("O", for: .normal)
            board[0][2] = "O"
        }
        if moves < 9
        {
            checkWin(board: board)
        }
        else
        {
            //draw
        }
        print (board)
    }
    
    @IBAction func box4Click(_ sender: Any) {
        
        moves = moves + 1
        
        if moves % 2 != 0
        {
            box4button.setTitle("X", for: .normal)
            board[1][0] = "X"
        }
        else
        {
            box4button.setTitle("O", for: .normal)
            board[1][0] = "O"
        }
        if moves < 9
        {
            checkWin(board: board)
        }
        else
        {
            //draw
        }
        print (board)
    }
    
    @IBAction func box5Click(_ sender: Any) {
        
        moves = moves + 1
        
        if moves % 2 != 0
        {
            box5button.setTitle("X", for: .normal)
            board[1][1] = "X"
        }
        else
        {
            box5button.setTitle("O", for: .normal)
            board[1][1] = "O"
        }
        if moves < 9
        {
            checkWin(board: board)
        }
        else
        {
            //draw
        }
        print (board)
    }
    
    @IBAction func box6Click(_ sender: Any) {
        
        moves = moves + 1
        
        if moves % 2 != 0
        {
            box6button.setTitle("X", for: .normal)
            board[1][2] = "X"
        }
        else
        {
            box6button.setTitle("O", for: .normal)
            board[1][2] = "O"
        }
        if moves < 9
        {
            checkWin(board: board)
        }
        else
        {
            //draw
        }
        print (board)
    }
    
    @IBAction func box7Click(_ sender: Any) {
        
        moves = moves + 1
        
        if moves % 2 != 0
        {
            box7button.setTitle("X", for: .normal)
            board[2][0] = "X"
        }
        else
        {
            box7button.setTitle("O", for: .normal)
            board[2][1] = "O"
        }
        if moves < 9
        {
            checkWin(board: board)
        }
        else
        {
            //draw
        }
        print (board)
    }
    
    @IBAction func box8Click(_ sender: Any) {
        
        moves = moves + 1
        
        if moves % 2 != 0
        {
            box8button.setTitle("X", for: .normal)
            board[2][1] = "X"
        }
        else
        {
            box8button.setTitle("O", for: .normal)
            board[2][1] = "O"
        }
        if moves < 9
        {
            checkWin(board: board)
        }
        else
        {
            //draw
        }
        print (board)
    }
    
    @IBAction func box9Click(_ sender: Any) {
        
        moves = moves + 1
        
        if moves % 2 != 0
        {
            box9button.setTitle("X", for: .normal)
            board[2][2] = "X"
        }
        else
        {
            box9button.setTitle("O", for: .normal)
            board[2][2] = "O"
        }
        if moves < 9
        {
            checkWin(board: board)
        }
        else
        {
            //draw
        }
        print (board)
    }
    
    @IBAction func seeScores(_ sender: Any) {
        performSegue(withIdentifier: "seeScoresT", sender: nil)
    }
    
    @IBAction func playAgain(_ sender: Any) {
        board = [["","",""],
                 ["","",""],
                 ["","",""]]
        moves = 0
        reableAllButtons()
        clearButtons()
    }
    
    
    func updateTicTacToe(winner: String){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Wins")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let test = try context.fetch(fetchRequest)
            let object = test[0] as! NSManagedObject
            if winner == "player1"{
                for data in test as! [NSManagedObject] {
                    object.setValue(Int(data.value(forKey: "tictactoeU") as! Int32) + 1, forKey: "tictactoeU")
                }
                do {
                    try context.save()
                    
                } catch {
                    
                    print("Failed")
                }
            }
            else{
                for data in test as! [NSManagedObject] {
                    object.setValue(Int(data.value(forKey: "tictactoeC") as! Int32) + 1, forKey: "tictactoeC")
                }
                do {
                    try context.save()
                    
                } catch {
                    print("Failed")
                }
            }
        }
        catch{
            print("failed")
        }
    }
}
