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
    
    // MARK: Preview Action Items
    
    override func previewActionItems() -> [UIPreviewActionItem] {
        let alertAction = UIPreviewAction(title: "Say a Quote!", style: .Default) { (action, viewController) -> Void in
            
        };
        
        return [alertAction]
    }
    
    // Memory methods
    override func didReceiveMemoryWarning() {
        
    }
    
}