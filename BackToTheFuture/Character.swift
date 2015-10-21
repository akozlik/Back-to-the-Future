//
//  Character.swift
//  BackToTheFuture
//
//  Created by Andrew Kozlik on 10/19/15.
//  Copyright © 2015 Andrew Kozlik. All rights reserved.
//

import Foundation
import UIKit

class Character {
    var characterName : String
    var actorName : String
    var actorHeadshot : UIImage
    var actorHeadshotName : String
    var quote : String
    
    init(characterName : String, actorName : String, actorHeadshotName : String, quote : String) {
        self.characterName = characterName
        self.actorName = actorName
        self.quote = quote;
        
        self.actorHeadshot = UIImage(named: actorHeadshotName)!
        self.actorHeadshotName = actorHeadshotName
    }
}
