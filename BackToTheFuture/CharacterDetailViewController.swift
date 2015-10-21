//
//  CharacterDetail.swift
//  BackToTheFuture
//
//  Created by Andrew Kozlik on 10/20/15.
//  Copyright © 2015 Andrew Kozlik. All rights reserved.
//

import Foundation
import UIKit

class CharacterDetailViewController : UIViewController {

    @IBOutlet var actorHeadshotImageView : UIImageView?
    @IBOutlet var characterNameLabel : UILabel?
    @IBOutlet var actorNameLabel : UILabel?
    @IBOutlet var characterDescription : UITextField?
    
    var character : Character!
    
    // View lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = character.characterName

        actorHeadshotImageView?.image = UIImage(named: character.actorHeadshotName!)
        characterNameLabel?.text = character.characterName
        actorNameLabel?.text = character.actorName
    }
    
    // Memory methods
    override func didReceiveMemoryWarning() {
        
    }
    
}