//
//  WarViewController.swift
//  Minigame Tripleplay
//
//  Created by Kyle Ornstein on 3/28/19.
//  Copyright © 2019 Kyle Ornstein. All rights reserved.
//


import UIKit

class WarViewController: UIViewController {
    
    
    //Things needed to do
    //figure out disabling button during animation
    //put pictures in to so cards show what was played
    
    
    
    
    @IBOutlet var computerButton: UIButton!
    @IBOutlet var userButton: UIButton!
    @IBOutlet var midLabel: UILabel!
    @IBOutlet var compCardCount: UILabel!
    @IBOutlet var userCardCount: UILabel!
    
    var userDeck = [String]()
    var compDeck = [String]()
    var fullDeck = ["AS", "2S", "3S", "4S", "5S", "6S", "7S", "8S", "9S", "10S", "JS", "QS", "KS",
                    "AC", "2C", "3C", "4C", "5C", "6C", "7C", "8C", "9C", "10C", "JC", "QC", "KC",
                    "AH", "2H", "3H", "4H", "5H", "6H", "7H", "8H", "9H", "10H", "JH", "QH", "KH",
                    "AD", "2D", "3D", "4D", "5D", "6D", "7D", "8D", "9D", "10D", "JD", "QD", "KD"]
    var playedCards = [String]()
    var checked = "noWin"
    var currentCard = ""
    var compCard = ""
    var userCard = ""
    var outcome = ""
    var started = false
    
    func updateCount(){
        userCardCount.text = "Users Cards: " + String(userDeck.count)
        compCardCount.text = "Computers Cards: " + String(compDeck.count)
    }
    
    func refillDeck(){
        if fullDeck.count != 52{
            if userDeck.count > 0 {
                currentCard = userDeck[Int(arc4random_uniform(UInt32(userDeck.count)))]
                while userDeck.count != 0{
                    currentCard = userDeck[Int(arc4random_uniform(UInt32(userDeck.count)))]
                    if let itemToRemoveIndex = userDeck.index(of: currentCard) {
                            userDeck.remove(at: itemToRemoveIndex)
                            fullDeck.append(currentCard)
                    }
                }
            }
            if compDeck.count > 0 {
                currentCard = compDeck[Int(arc4random_uniform(UInt32(compDeck.count)))]
                while compDeck.count != 0{
                    currentCard = compDeck[Int(arc4random_uniform(UInt32(compDeck.count)))]
                    if let itemToRemoveIndex = compDeck.index(of: currentCard) {
                        compDeck.remove(at: itemToRemoveIndex)
                        fullDeck.append(currentCard)
                    }
                }
            }
        }
    }
    
    func fillDecks(){
        currentCard = fullDeck[Int(arc4random_uniform(UInt32(fullDeck.count)))]
        while fullDeck.count != 26{
            currentCard = fullDeck[Int(arc4random_uniform(UInt32(fullDeck.count)))]
            while fullDeck.contains(currentCard) {
                if let itemToRemoveIndex = fullDeck.index(of: currentCard) {
                    fullDeck.remove(at: itemToRemoveIndex)
                    userDeck.append(currentCard)
                }
            }
        }
        
        while fullDeck.count != 0{
            currentCard = fullDeck[Int(arc4random_uniform(UInt32(fullDeck.count)))]
            if let itemToRemoveIndex = fullDeck.index(of: currentCard) {
                fullDeck.remove(at: itemToRemoveIndex)
                compDeck.append(currentCard)
            }
        }
    }
    
    func compareFaceCards(user: String, comp: String) -> String{
        let faceCards = ["J", "Q", "K", "A"]
        let u = faceCards.firstIndex(of: user)
        let c = faceCards.firstIndex(of: comp)
        if u! > c!{
            return "user"
        }
        else if u! < c!{
            return "comp"
        }
        else{
            return "war"
        }
    }
    
    func compareCards(user: String, comp: String) -> String{
        let uindex = user.index(user.endIndex, offsetBy: -1)
        let u = Int(String(user[..<uindex]))
        let cindex = comp.index(comp.endIndex, offsetBy: -1)
        let c = Int(String(comp[..<cindex]))
        let uf = String(user[..<uindex])
        let cf = String(comp[..<cindex])
        if u != nil && c != nil{
            if u! > c!{
                return "user"
            }
            else if u! < c!{
                return "comp"
            }
            else{
                return "war"
            }
        }
        else if u != nil {
            return "comp"
        }
        else if c != nil{
            return "user"
        }
        else {
            return compareFaceCards(user: uf, comp: cf)
        }
    }
    
    func removeForWar(counts: Int) {
        var count = counts
        while count != 0{
            userCard = userDeck[Int(arc4random_uniform(UInt32(userDeck.count)))]
            compCard = compDeck[Int(arc4random_uniform(UInt32(compDeck.count)))]
            if let uRemoveIndex = userDeck.index(of: userCard), let cRemoveIndex = compDeck.index(of: compCard) {
                userDeck.remove(at: uRemoveIndex)
                compDeck.remove(at: cRemoveIndex)
                playedCards.append(userCard)
                playedCards.append(compCard)
            }
            count -= 1
        }
    }
    
    func midLabelAnimation(which: String){
        if which == "war"{
            UIView.animate(withDuration: 2, delay: 0.0, options:[], animations: {
                self.midLabel.alpha = 1
                self.midLabel.transform = .identity
            }, completion: {
                finished in
                UIView.animate(withDuration: 2, animations: {
                    self.midLabel.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
                    self.midLabel.alpha = 0
                })
            })
        }
        else if which == "userWins"{
            midLabel.text = "User wins"
            UIView.animate(withDuration: 2, animations: {
                self.midLabel.alpha = 1
            })
        }
        else{
            midLabel.text = "Computer wins"
            UIView.animate(withDuration: 2, animations: {
                self.midLabel.alpha = 1
            })
        }
    }
    
    func war(outcomes: String) -> String{
        midLabelAnimation(which: "war")
        outcome = outcomes
        while outcome == "war"{
            checked = checkForWin(check: checked)
            if userDeck.count < 4 {
                return "compWin"
            }
            else if compDeck.count < 4 {
                return "userWin"
            }
            removeForWar(counts: 3)
            userCard = userDeck[Int(arc4random_uniform(UInt32(userDeck.count)))]
            compCard = compDeck[Int(arc4random_uniform(UInt32(compDeck.count)))]
            if let uRemoveIndex = userDeck.index(of: userCard), let cRemoveIndex = compDeck.index(of: compCard) {
                userDeck.remove(at: uRemoveIndex)
                compDeck.remove(at: cRemoveIndex)
                playedCards.append(userCard)
                playedCards.append(compCard)
            }
            outcome = compareCards(user: userCard, comp: compCard)
        }
        return outcome
    }
    
    func checkForWin(check: String) -> String{
        updateCount()
        if check == "noWin"{
            if userDeck.isEmpty{
                midLabelAnimation(which: "compWins")
                updateCount()
                return "compWins"
            }
            else if compDeck.isEmpty {
                midLabelAnimation(which: "userWins")
                updateCount()
                return "userWins"
            }
            else {
                return "noWin"
            }
        }
        return check
    }
    
    func play(){
        currentCard = ""
        checked = checkForWin(check: checked)
        if checked != "noWin"{
            print("win")
            started = false
        }
        else{
            var count = 0
            userCard = userDeck[Int(arc4random_uniform(UInt32(userDeck.count)))]
            compCard = compDeck[Int(arc4random_uniform(UInt32(compDeck.count)))]
            outcome = compareCards(user: userCard, comp: compCard)
            print(userCard)
            print(compCard)
            print("outcome is " + outcome)
            if outcome == "user"{
                if let uRemoveIndex = userDeck.index(of: userCard), let cRemoveIndex = compDeck.index(of: compCard) {
                    userDeck.remove(at: uRemoveIndex)
                    compDeck.remove(at: cRemoveIndex)
                    userDeck.append(userCard)
                    userDeck.append(compCard)
                }
            }
            else if outcome == "comp"{
                if let uRemoveIndex = userDeck.index(of: userCard), let cRemoveIndex = compDeck.index(of: compCard) {
                    userDeck.remove(at: uRemoveIndex)
                    compDeck.remove(at: cRemoveIndex)
                    compDeck.append(userCard)
                    compDeck.append(compCard)
                }
            }
            else{
                if let uRemoveIndex = userDeck.index(of: userCard), let cRemoveIndex = compDeck.index(of: compCard) {
                    userDeck.remove(at: uRemoveIndex)
                    compDeck.remove(at: cRemoveIndex)
                    playedCards.append(userCard)
                    playedCards.append(compCard)
                }
               
                outcome = war(outcomes: "war")
                count = playedCards.count
                while count != 0{
                    currentCard = playedCards[playedCards.startIndex]
                    if let removeIndex = playedCards.index(of: currentCard) {
                        playedCards.remove(at: removeIndex)
                        if outcome == "user"{
                            userDeck.append(currentCard)
                        }
                        else{
                            compDeck.append(currentCard)
                        }
                    }
                    count -= 1
                }
            }
            print(userDeck)
            print(compDeck)
        }
        updateCount()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        midLabel.alpha = 0
        midLabel.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
    }
    
    @IBAction func playNow(_ sender: Any) {
        midLabel.text = "War"
        checked = "noWin"
        refillDeck()
        fillDecks()
        updateCount()
        started = true
    }

    @IBAction func userPlayButton(_ sender: Any) {
        if started == true{
            play()
        }
    }
    
    @IBAction func testButton(_ sender: Any) {
        while started == true{
            play()
        }
    }
}
