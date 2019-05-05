//
//  Wins+CoreDataProperties.swift
//  Minigame Tripleplay
//
//  Created by Kyle Ornstein on 5/5/19.
//  Copyright © 2019 Kyle Ornstein. All rights reserved.
//
//

import Foundation
import CoreData


extension Wins {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Wins> {
        return NSFetchRequest<Wins>(entityName: "Wins")
    }

    @NSManaged public var hangmanU: Int32
    @NSManaged public var hangmanC: Int32
    @NSManaged public var tictactoeU: Int32
    @NSManaged public var tictactoeC: Int32
    @NSManaged public var warU: Int32
    @NSManaged public var warC: Int32

}
