//
//  ViewController.swift
//  BackToTheFuture
//
//  Created by Andrew Kozlik on 10/19/15.
//  Copyright (c) 2015 Andrew Kozlik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var buttonTimeTravel : UIButton?
    @IBOutlet weak var tableView : UITableView?
    
    let message2015 = "Time Travel to 2015"
    let message1985 = "Time Travel to 1985"
    
    var characters : NSMutableArray?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (characters == nil) {
            characters = NSMutableArray();
        }
        
        let marty = Character.init(characterName: "Marty McFly", actorName: "Michael J Fox", actorHeadshotName: "michael")
        let doc = Character.init(characterName: "Doc Brown", actorName: "Christopher Lloyd", actorHeadshotName: "christopher")
        let lorraine = Character.init(characterName: "Lorraine Baines", actorName: "Lea Thompson", actorHeadshotName: "lea")
        
        characters?.addObjectsFromArray([marty, doc, lorraine])
        
        var shortcutItems = [UIMutableApplicationShortcutItem]()
        
        for character in characters! {
            let c = character as! Character
            let item = UIMutableApplicationShortcutItem(
                type: "com.codefortravel.backtothefuture.character",
                localizedTitle: c.characterName!,
                localizedSubtitle: "Tap for more details",
//                icon: nil,
//                icon: UIApplicationShortcutIcon(templateImageName: "flux-capacitor"),
                icon: UIApplicationShortcutIcon(type: .Add),

                userInfo: nil
            )
            shortcutItems.append(item)
        }
        
        UIApplication.sharedApplication().shortcutItems = shortcutItems
    }
    
    // MARK: IBAction Methods
    
    @IBAction func timeTravel(sender:UIButton) {
        if (sender.titleLabel!.text == message2015) {
            sender.setTitle(message1985, forState: UIControlState.Normal)
        } else if (sender.titleLabel!.text == message1985) {
            sender.setTitle(message2015, forState: UIControlState.Normal)
        }
    }
    
    // MARK: UITableViewDelegate/DataSource Methods
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier")
        
        if (cell != nil) {
            let character : Character = (characters?.objectAtIndex(indexPath.row))! as! Character
            
            cell?.textLabel?.text = character.characterName
            cell?.detailTextLabel?.text = character.actorName
            
            if (character.actorHeadshotName != nil) {
                cell?.imageView?.image = UIImage(named:character.actorHeadshotName!)   
            }
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters!.count
    }
    
    // MARK: Memory Warning Method

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

