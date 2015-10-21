//
//  ViewController.swift
//  BackToTheFuture
//
//  Created by Andrew Kozlik on 10/19/15.
//  Copyright (c) 2015 Andrew Kozlik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewingDelegate {
    
    @IBOutlet weak var buttonTimeTravel : UIButton?
    @IBOutlet weak var tableView : UITableView?
    
    let message2015 = "Time Travel to 2015"
    let message1985 = "Time Travel to 1985"
    
    let kCharacterDetailSegue = "characterDetailSegue"
    
    var characters : [Character]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (self.isForceTouchAvailable()) {
            registerForPreviewingWithDelegate(self, sourceView: tableView!)
        }
        
        self.title = "BTTF"
        
        if (characters == nil) {
            characters = [Character]()
        }
        
        // Set up a few characters
        let marty = Character.init(characterName: "Marty McFly", actorName: "Michael J Fox", actorHeadshotName: "michael", quote : "Are you telling me that you built a time machine... out of a DeLorean?")
        let doc = Character.init(characterName: "Doc Brown", actorName: "Christopher Lloyd", actorHeadshotName: "christopher", quote: "Where we're going we don't need roads!")
        let lorraine = Character.init(characterName: "Lorraine Baines", actorName: "Lea Thompson", actorHeadshotName: "lea", quote: "I'm going with Calvin Klein, okay?")
        
        characters?.append(marty)
        characters?.append(doc)
        characters?.append(lorraine)
        
        var shortcutItems = [UIMutableApplicationShortcutItem]()
        
        // Loop through each character and create shortcuts
        for character in characters! {
            let item = UIMutableApplicationShortcutItem(
                type: "com.codefortravel.backtothefuture.character",
                localizedTitle: character.characterName!,
                localizedSubtitle: "Tap for more details",
//                icon: nil, // No icon
//                icon: UIApplicationShortcutIcon(templateImageName: "flux-capacitor"), // Icon wtih a custom image
                icon: UIApplicationShortcutIcon(type: .Add), // Icon with a UIApplicationShortcutIconType

                userInfo: ["characterName" : character.characterName!]
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
    
    // MARK: Peek / Pop Methods
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let indexPath = tableView?.indexPathForRowAtPoint(location)
        let row = indexPath?.row
        let character = characters[row!]
        
        let detailVC = storyboard?.instantiateViewControllerWithIdentifier("CharacterDetailViewController") as? CharacterDetailViewController
        
        detailVC?.character = character
        detailVC?.preferredContentSize = CGSize(width: 0, height: 280)

        return detailVC
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        showViewController(viewControllerToCommit, sender: self)
    }
    
    // MARK: UITableViewDelegate/DataSource Methods
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier")
        
        if (cell != nil) {
//            let character : Character = (characters?.[indexPath.row])! as! Character
            let character : Character = characters[indexPath.row]
            
            cell?.textLabel?.text = character.characterName
            cell?.detailTextLabel?.text = character.actorName
            
            if (character.actorHeadshotName != nil) {
                cell?.imageView?.image = UIImage(named:character.actorHeadshotName!)   
            }
        }
        
        return cell!
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier(kCharacterDetailSegue, sender: self)
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
    
    // MARK: Segue Methods
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == kCharacterDetailSegue) {
            var detailVC = segue.destinationViewController as! CharacterDetailViewController
            
            let indexPath = tableView?.indexPathForSelectedRow
            let row = indexPath?.row
            detailVC.character = characters[row!]
        }
    }
    
    // MARK: 3D Touch check
    func isForceTouchAvailable() -> Bool {
        
        var isForceTouchAvailable = false;
        
        if (self.traitCollection.respondsToSelector("forceTouchCapability")) {
            isForceTouchAvailable = self.traitCollection.forceTouchCapability == UIForceTouchCapability.Available
        }
        
        return isForceTouchAvailable
    }
    
    // MARK: Memory Warning Method

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

