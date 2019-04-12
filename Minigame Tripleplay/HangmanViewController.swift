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
    @IBOutlet var wordLabel: UILabel!
    @IBOutlet var gallowsView: UIView!
    @IBOutlet var abutton: UIButton!
    @IBOutlet var bbutton: UIButton!
    @IBOutlet var cbutton: UIButton!
    @IBOutlet var dbutton: UIButton!
    @IBOutlet var ebutton: UIButton!
    @IBOutlet var fbutton: UIButton!
    @IBOutlet var gbutton: UIButton!
    @IBOutlet var hbutton: UIButton!
    @IBOutlet var ibutton: UIButton!
    @IBOutlet var jbutton: UIButton!
    @IBOutlet var kbutton: UIButton!
    @IBOutlet var lbutton: UIButton!
    @IBOutlet var mbutton: UIButton!
    @IBOutlet var nbutton: UIButton!
    @IBOutlet var obutton: UIButton!
    @IBOutlet var pbutton: UIButton!
    @IBOutlet var qbutton: UIButton!
    @IBOutlet var rbutton: UIButton!
    @IBOutlet var sbutton: UIButton!
    @IBOutlet var tbutton: UIButton!
    @IBOutlet var ubutton: UIButton!
    @IBOutlet var vbutton: UIButton!
    @IBOutlet var wbutton: UIButton!
    @IBOutlet var xbutton: UIButton!
    @IBOutlet var ybutton: UIButton!
    @IBOutlet var zbutton: UIButton!
    
    var word: String?
    var replacingArr: String? = "_"
    var wrongs = 0
    var win = false
    
    var wordList = ["able", "about", "account", "acid", "across", "act", "addition", "adjustment",
                    "advertisement", "after", "again", "against", "agreement", "air", "all", "almost", "among",
                    "amount", "amusement", "and", "angle", "angry", "animal", "answer", "ant", "any", "apparatus",
                    "apple", "approval", "arch", "argument", "arm", "army", "art", "as", "at", "attack", "attempt",
                    "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "bad", "bag",
                    "balance", "ball", "band", "base", "basin", "basket", "bath", "be", "beautiful", "because", "bed",
                    "bee", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bit",
                    "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling",
                    "bone", "book", "boot", "bottle", "box", "boy", "brain", "brake", "branch", "brass", "bread",
                    "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building",
                    "bulb", "burn", "burst", "business", "but", "butter", "button", "by", "cake", "camera", "canvas",
                    "card", "care", "carriage", "cart", "cat", "cause", "certain", "chain", "chalk", "chance",
                    "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean",
                    "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come",
                    "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex",
                    "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork",
                    "cotton", "cough", "country", "cover", "cow", "crack", "credit", "crime", "cruel", "crush", "cry",
                    "cup", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "day",
                    "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design",
                    "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty",
                    "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "do",
                    "dog", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dry",
                    "dust", "ear", "early", "earth", "east", "edge", "education", "effect", "egg", "elastic",
                    "electric", "end", "engine", "enough", "equal", "error", "even", "event", "ever", "every",
                    "example", "exchange", "existence", "expansion", "experience", "expert", "eye", "face", "fact",
                    "fall", "false", "family", "far", "farm", "fat", "father", "fear", "feather", "feeble", "feeling",
                    "female", "fertile", "fiction", "fiefight", "finger", "fire", "first", "fishfixed", "flag",
                    "flame", "flat", "flight", "floor", "flower", "fly", "fold", "food", "foolish", "foot", "for",
                    "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front",
                    "fruit", "full", "future", "garden", "general", "get", "girl", "give", "glass", "glove", "go",
                    "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group",
                    "growth", "guide", "gun", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard",
                    "harmony", "hat", "hate", "have", "he", "head", "healthy", "hear", "hearing", "heart", "heat",
                    "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour",
                    "house", "how", "humour", "I", "ice", "idea", "if", "ill", "important", "impulse", "in",
                    "increase", "industry", "ink", "insect", "instrument", "insurance", "interest", "invention",
                    "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "key",
                    "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late",
                    "laugh", "law", "lead", "leaf", "learning", "leather", "left", "leg", "let", "letter", "level",
                    "library", "lift", "light", "like", "limit", "linen", "lip", "liquid", "list", "little", "living",
                    "lock", "long", "look", "loose", "loss", "loud", "love", "low", "machine", "make", "male", "man",
                    "manager", "map", "mark", "market", "married", "mass", "match", "material", "may", "meal",
                    "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind",
                    "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother",
                    "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow",
                    "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "net", "new", "news",
                    "night", "no", "noise", "normal", "north", "nose", "not", "note", "now", "number", "nut",
                    "observation", "of", "off", "offer", "office", "oil", "old", "on", "only", "open", "operation",
                    "opinion", "opposite", "or", "orange", "order", "organization", "ornament", "other", "out", "oven",
                    "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste",
                    "payment", "peace", "pen", "pencil", "person", "physical", "picture", "pig", "pin", "pipe",
                    "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point",
                    "poison", "polish", "political", "poor", "porter", "position", "possible", "pot", "potato",
                    "powder", "power", "present", "price", "print", "prison", "private", "probable", "process",
                    "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment",
                    "purpose", "push", "put", "quality", "question", "quick", "quiet", "quite", "rail", "rain",
                    "range", "rat", "rate", "ray", "reaction", "reading", "ready", "reason", "receipt", "record",
                    "red", "regret", "regular", "relation", "religion", "representative", "request", "respect",
                    "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "rod", "roll",
                    "roof", "room", "root", "rough", "round", "rub", "rule", "run", "sad", "safe", "sail", "salt",
                    "same", "sand", "say", "scale", "school", "science", "scissors", "screw", "sea", "seat", "second",
                    "secret", "secretary", "see", "seed", "seem", "selection", "self", "send", "sense", "separate",
                    "serious", "servant", "sex", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt",
                    "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size",
                    "skin", "skirt", "sky", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile",
                    "smoke", "smooth", "snake", "sneeze", "snow", "so", "soap", "society", "sock", "soft", "solid",
                    "some", "son", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge",
                    "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam",
                    "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach",
                    "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong",
                    "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "sun", "support",
                    "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "tax",
                    "teaching", "tendency", "test", "than", "that", "the", "then", "theory", "there", "thick", "thin",
                    "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket",
                    "tight", "till", "time", "tin", "tired", "to", "toe", "together", "tomorrow", "tongue", "tooth",
                    "top", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble",
                    "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "up", "use", "value", "verse",
                    "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "war", "warm", "wash",
                    "waste", "watch", "water", "wave", "wax", "way", "weather", "week", "weight", "well", "west",
                    "wet", "wheel", "when", "where", "while", "whip", "whistle", "white", "who", "why", "wide", "will",
                    "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool",
                    "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yes", "yesterday", "you",
                    "young"]
    
    func indicesOf(string: String, substring: Character) -> [Int]{
        var indices1 = [Int]()
        var index = string.startIndex
        for char in string {
            if char == substring{
                indices1.append(string.distance(from: string.startIndex, to: index))
            }
            index = string.index(after: index)
        }
        
        return indices1
    }
    
    func addSpaces(string: String) -> String{
        var str = string
        var position = str.startIndex
        while position != str.endIndex{
            position = str.index(after: position)
            str.insert(" ", at: position)
            position = str.index(after: position)
        }
        return str
    }
    
    func buttonDisappear(str: String){
        switch str {
        case "a":
            abutton.alpha = 0.1
            abutton.isEnabled = false
            break
        case "b":
            bbutton.alpha = 0.1
            bbutton.isEnabled = false
            break
        case "c":
            cbutton.alpha = 0.1
            cbutton.isEnabled = false
            break
        case "d":
            dbutton.alpha = 0.1
            dbutton.isEnabled = false
            break
        case "e":
            ebutton.alpha = 0.1
            ebutton.isEnabled = false
            break
        case "f":
            fbutton.alpha = 0.1
            fbutton.isEnabled = false
            break
        case "g":
            gbutton.alpha = 0.1
            gbutton.isEnabled = false
            break
        case "h":
            hbutton.alpha = 0.1
            hbutton.isEnabled = false
            break
        case "i":
            ibutton.alpha = 0.1
            ibutton.isEnabled = false
            break
        case "j":
            jbutton.alpha = 0.1
            jbutton.isEnabled = false
            break
        case "k":
            kbutton.alpha = 0.1
            kbutton.isEnabled = false
            break
        case "l":
            lbutton.alpha = 0.1
            lbutton.isEnabled = false
            break
        case "m":
            mbutton.alpha = 0.1
            mbutton.isEnabled = false
            break
        case "n":
            nbutton.alpha = 0.1
            nbutton.isEnabled = false
            break
        case "o":
            obutton.alpha = 0.1
            obutton.isEnabled = false
            break
        case "p":
            pbutton.alpha = 0.1
            pbutton.isEnabled = false
            break
        case "q":
            qbutton.alpha = 0.1
            qbutton.isEnabled = false
            break
        case "r":
            rbutton.alpha = 0.1
            rbutton.isEnabled = false
            break
        case "s":
            sbutton.alpha = 0.1
            sbutton.isEnabled = false
            break
        case "t":
            tbutton.alpha = 0.1
            tbutton.isEnabled = false
            break
        case "u":
            ubutton.alpha = 0.1
            ubutton.isEnabled = false
            break
        case "v":
            vbutton.alpha = 0.1
            vbutton.isEnabled = false
            break
        case "w":
            wbutton.alpha = 0.1
            wbutton.isEnabled = false
            break
        case "x":
            xbutton.alpha = 0.1
            xbutton.isEnabled = false
            break
        case "y":
            ybutton.alpha = 0.1
            ybutton.isEnabled = false
            break
        case "z":
            zbutton.alpha = 0.1
            zbutton.isEnabled = false
            break
        default:
            break
        }
    }
    
    func buttonsReappear(){
        self.abutton.alpha = 1
        self.bbutton.alpha = 1
        self.cbutton.alpha = 1
        self.dbutton.alpha = 1
        self.ebutton.alpha = 1
        self.fbutton.alpha = 1
        self.gbutton.alpha = 1
        self.hbutton.alpha = 1
        self.ibutton.alpha = 1
        self.jbutton.alpha = 1
        self.kbutton.alpha = 1
        self.lbutton.alpha = 1
        self.mbutton.alpha = 1
        self.nbutton.alpha = 1
        self.obutton.alpha = 1
        self.pbutton.alpha = 1
        self.qbutton.alpha = 1
        self.rbutton.alpha = 1
        self.sbutton.alpha = 1
        self.tbutton.alpha = 1
        self.ubutton.alpha = 1
        self.vbutton.alpha = 1
        self.wbutton.alpha = 1
        self.xbutton.alpha = 1
        self.ybutton.alpha = 1
        self.zbutton.alpha = 1
    }
    
    func disableAllButtons(){
        abutton.isEnabled = false
        bbutton.isEnabled = false
        cbutton.isEnabled = false
        dbutton.isEnabled = false
        ebutton.isEnabled = false
        fbutton.isEnabled = false
        gbutton.isEnabled = false
        hbutton.isEnabled = false
        ibutton.isEnabled = false
        jbutton.isEnabled = false
        kbutton.isEnabled = false
        lbutton.isEnabled = false
        mbutton.isEnabled = false
        nbutton.isEnabled = false
        obutton.isEnabled = false
        pbutton.isEnabled = false
        qbutton.isEnabled = false
        rbutton.isEnabled = false
        sbutton.isEnabled = false
        tbutton.isEnabled = false
        ubutton.isEnabled = false
        vbutton.isEnabled = false
        wbutton.isEnabled = false
        xbutton.isEnabled = false
        ybutton.isEnabled = false
        zbutton.isEnabled = false
    }
    
    func reenableButtons(){
        abutton.isEnabled = true
        bbutton.isEnabled = true
        cbutton.isEnabled = true
        dbutton.isEnabled = true
        ebutton.isEnabled = true
        fbutton.isEnabled = true
        gbutton.isEnabled = true
        hbutton.isEnabled = true
        ibutton.isEnabled = true
        jbutton.isEnabled = true
        kbutton.isEnabled = true
        lbutton.isEnabled = true
        mbutton.isEnabled = true
        nbutton.isEnabled = true
        obutton.isEnabled = true
        pbutton.isEnabled = true
        qbutton.isEnabled = true
        rbutton.isEnabled = true
        sbutton.isEnabled = true
        tbutton.isEnabled = true
        ubutton.isEnabled = true
        vbutton.isEnabled = true
        wbutton.isEnabled = true
        xbutton.isEnabled = true
        ybutton.isEnabled = true
        zbutton.isEnabled = true
    }
    
    func replace(str: String, char: Character){
        if let w = word{
            buttonDisappear(str: str)
            if w.contains(char){
                let placesReplace = indicesOf(string: w, substring: char)
                print(placesReplace)
                if var r = replacingArr{
                    for x in placesReplace{
                        if x != 0{
                            let upperIndex = r.index(r.startIndex, offsetBy: x+1)
                            let index = r.index(r.startIndex, offsetBy: x)
                            replacingArr = r.replacingCharacters(in: index..<upperIndex, with: str)
                            r = r.replacingCharacters(in: index..<upperIndex, with: str)
                        }
                        else{
                            replacingArr = r.replacingCharacters(in: ...r.startIndex, with: str)
                            r = r.replacingCharacters(in: ...r.startIndex, with: str)
                        }
                    }
                    let spacedR = addSpaces(string: r)
                    if w == r{
                        win = true
                        wordLabel.text = spacedR
                        winAnimations()
                    }
                    else{
                        wordLabel.text = spacedR
                    }
                    print(r)
                }
            }
            else{
                wrongsAnimations()
            }
        }
    }
    
    func winAnimations(){
        print("won")
        disableAllButtons()
        UIView.animate(withDuration: 2, delay: 0.5, options:[], animations: {
            self.wordLabel.alpha = 0.0
            self.buttonsReappear()
        }, completion: {
            finished in
            if finished {
                self.wordLabel.text = "You Win the Game!"
                UIView.animate(withDuration: 2, animations: {
                    self.wordLabel.alpha = 1.0
                })
            }
        })
    }
    
    func wrongsAnimations(){
        wrongs += 1
        if wrongs == 6{
            print("lost")
            disableAllButtons()
            UIView.animate(withDuration: 2, delay: 0.5, options:[], animations: {
                self.wordLabel.alpha = 0.0
                self.buttonsReappear()
            }, completion: {
                finished in
                if finished {
                    self.wordLabel.text = "You lost the Game!"
                    UIView.animate(withDuration: 2, animations: {
                        self.wordLabel.alpha = 1.0
                    })
                }
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        verticalConstraint.constant = 0
        view.addSubview(gallowsView)
    }
    
    @IBAction func playNow(_ sender: Any) {
        print(wrongs)
        word = wordList[Int(arc4random_uniform(UInt32(wordList.count)))]
        replacingArr = ""
        reenableButtons()
        if let w = word{
            var count = 0
            while count != w.count{
                replacingArr?.append("_")
                count += 1
            }
            print(w)
        }
        if let r = replacingArr{
            let spacedR = addSpaces(string: r)
            wordLabel.text = spacedR
            print(r)
        }
    }
    
    @IBAction func resetButton(_ sender: Any) {
        reenableButtons()
        buttonsReappear()
        wordLabel.text = "word"
        wrongs = 0
    }

    @IBAction func aButtonPressed(_ sender: Any) {
        replace(str: "a", char: "a")
    }
    
    @IBAction func bButtonPressed(_ sender: Any) {
        replace(str: "b", char: "b")
    }
    
    @IBAction func cButtonPressed(_ sender: Any) {
        replace(str: "c", char: "c")
    }
    
    @IBAction func dButtonPressed(_ sender: Any) {
        replace(str: "d", char: "d")
    }
    
    @IBAction func eButtonPressed(_ sender: Any) {
        replace(str: "e", char: "e")
    }
    
    @IBAction func fButtonPressed(_ sender: Any) {
        replace(str: "f", char: "f")
    }
    
    @IBAction func gButtonPressed(_ sender: Any) {
        replace(str: "g", char: "g")
    }
    
    @IBAction func hButtonPressed(_ sender: Any) {
        replace(str: "h", char: "h")
    }
    
    @IBAction func iButtonPressed(_ sender: Any) {
        replace(str: "i", char: "i")
    }
    
    @IBAction func jButtonPressed(_ sender: Any) {
        replace(str: "j", char: "j")
    }
    
    @IBAction func kButtonPressed(_ sender: Any) {
        replace(str: "k", char: "k")
    }
    
    @IBAction func lButtonPressed(_ sender: Any) {
        replace(str: "l", char: "l")
    }
    
    @IBAction func mButtonPressed(_ sender: Any) {
        replace(str: "m", char: "m")
    }
    
    @IBAction func nButtonPressed(_ sender: Any) {
        replace(str: "n", char: "n")
    }
    
    @IBAction func oButtonPressed(_ sender: Any) {
        replace(str: "o", char: "o")
    }
    
    @IBAction func pButtonPressed(_ sender: Any) {
        replace(str: "p", char: "p")    }
    
    @IBAction func qButtonPressed(_ sender: Any) {
        replace(str: "q", char: "q")
    }
    
    @IBAction func rButtonPressed(_ sender: Any) {
        replace(str: "r", char: "r")
    }
    
    @IBAction func sButtonPressed(_ sender: Any) {
        replace(str: "s", char: "s")
    }
    
    @IBAction func tButtonPressed(_ sender: Any) {
        replace(str: "t", char: "t")
    }
    
    @IBAction func uButtonPressed(_ sender: Any) {
        replace(str: "u", char: "u")
    }
    
    @IBAction func vButtonPressed(_ sender: Any) {
        replace(str: "v", char: "v")
    }
    
    @IBAction func wButtonPressed(_ sender: Any) {
        replace(str: "w", char: "w")
    }
    
    @IBAction func xButtonPressed(_ sender: Any) {
        replace(str: "x", char: "x")
    }
    
    @IBAction func yButtonPressed(_ sender: Any) {
        replace(str: "y", char: "y")
    }
    
    @IBAction func zButtonPressed(_ sender: Any) {
        replace(str: "z", char: "z")
    }
}
