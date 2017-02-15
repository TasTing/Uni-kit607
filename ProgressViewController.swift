 //
//  FirstViewController.swift
//  Newprototype
//
//  Created by kit305 on 23/04/2016.
//  Copyright © 2016 kit305. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {
    
    var superobjects = MainView()
    
    
    @IBOutlet var tableview: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
                
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cats.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableview.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ProgressTableViewCell
        
        cell.textLabel?.text = cats[indexPath.row]
        
        return cell
    }
    */
    
    /*
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("showview", sender: self)
        
    }
    */
    
    
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "showview"){
            
            var upcoming: Descriptionpage = segue.destinationViewController as! Descriptionpage
            let fname = cats
        }
        
    }
    */
    


}

