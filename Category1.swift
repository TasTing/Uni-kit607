//
//  Category1.swift
//  Newprototype
//
//  Created by kit305 on 24/04/2016.
//  Copyright © 2016 kit305. All rights reserved.
//

import UIKit



class Category1: UITableViewController {
    
    //var objects = [String]()
    //var photo = [UIImage]()
    //var desc = [String]()
    
    var objects = ["Banana":"1","Apple":"1","Orange":"1","Pear":"1","Apricot": "0.5","Kiwi fruits":"0.5", "Plums":"0.5", "Fruit juice":"2","Canned fruit":"1","Apricot halves":"0.25","Sultanas":"0.66"]
    var photo = UIImage(named: "")
    var desc = ["1 medium size apple = 1 serve",
        "1 medium size pear= 1 serve",
        "1 medium size orange = 1 serve)",
        "1 small size kiwi fruit (no matter green or gold) = half serve",
        "1 medium size banana = 1 serve",
        "1 cup fruit juice (no added sugar 250ml) = 700kj = 2 serves",
        "1 dried apricot halve (7.5g) = 1/4 serve",
        "1 tablespoon of sultanas = 0.66 serves",
        "1 small size apricot = half serve",
        "1 small size redplum or blackplum = half serve",
        "1 cup (150g) of diced or canned fruit has 350kj = 1 serves"]
    let date = NSDate()
    
    
    var selecteditem: String = ""
    var selectedvalue: String = ""
    var selecteddesc: String = ""
    
    var formattedtime = String()
    var formatteddate = NSDate()
    
    func timeformat(){
        let format = NSDateFormatter()
        format.dateStyle = NSDateFormatterStyle.ShortStyle
        let time = format.stringFromDate(date)
        self.formattedtime = time
        self.formatteddate = format.dateFromString(time)!
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        let nib = UINib(nibName: "tablecell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the
        //navigation bar; for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return objects.count
    }
    */


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objects.count    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:tablecell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! tablecell
        let name = [String](objects.keys)
        let value = [String](objects.values)
        
        cell.name.text = name[indexPath.row]
        cell.photo.image = UIImage(named: cell.name.text!)
        cell.desc.text = desc[indexPath.row]
        cell.serve.text = value[indexPath.row]
        
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //tableView.reloadData()
        
        let name = [String](objects.keys)
        let value = [String](objects.values)
        let description = [String](desc)
        self.selecteditem = name[indexPath.row]
        self.selectedvalue = value[indexPath.row]
        self.selecteddesc = description[indexPath.row]
                
        performSegueWithIdentifier("showmeal", sender: self)
        
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "showmeal"){
            
            let forwardpage = segue.destinationViewController as! TodaysmealViewController
            timeformat()
            forwardpage.saveobject(selecteditem,value: selectedvalue, time:formatteddate, desc: selecteddesc)
            forwardpage.tableView.reloadData()
        }
    }
    
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
