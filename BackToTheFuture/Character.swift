//
//  Character.swift
//  BackToTheFuture
//
//  Created by Andrew Kozlik on 10/19/15.
//  Copyright © 2015 Andrew Kozlik. All rights reserved.
//

import Foundation
import UIKit

class Character: NSObject, NSCoding {
    var characterName : String?
    var actorName : String?
    var actorHeadshot : UIImage?
    var actorHeadshotName : String?
    var quote : String?
    
    init(characterName : String, actorName : String, actorHeadshotName : String?, quote : String?) {
        super.init();
        
        self.characterName = characterName
        self.actorName = actorName
        self.quote = quote;
        
        if (actorHeadshotName != nil) {
            self.actorHeadshot = UIImage(named: actorHeadshotName!)
            self.actorHeadshotName = actorHeadshotName
        }
    }

    required convenience init?(coder decoder: NSCoder) {
        guard let characterName = decoder.decodeObjectForKey("characterName") as? String,
            let actorName = decoder.decodeObjectForKey("actorName") as? String,
            let actorHeadshotName = decoder.decodeObjectForKey("actorHeadshotName") as? String,
            let quote = decoder.decodeObjectForKey("quote") as? String
        
            else { return nil }
        
        self.init(
            characterName:characterName,
            actorName:actorName,
            actorHeadshotName : actorHeadshotName,
            quote : quote
        )
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.characterName, forKey: "characterName")
        aCoder.encodeObject(self.actorName, forKey: "actorName")
        aCoder.encodeObject(self.actorHeadshotName, forKey: "actorHeadshotName")
        aCoder.encodeObject(self.quote, forKey: "quote")

    }


}
