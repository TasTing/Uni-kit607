//
//  Todaysmeal.swift
//  Newprototype
//
//  Created by kit305 on 25/04/2016.
//  Copyright © 2016 kit305. All rights reserved.
//

import UIKit
import CoreData


class TodaysmealViewController: UITableViewController {
    
    
    var objects = [NSManagedObject]()
    //var photo = [NSManagedObject]()
    //var desc = [NSManagedObject]()
    //var result = [NSManagedObject]()
    //var todayslist = [NSManagedObject]()
    var formattedtime = String()
    var formatteddate = NSDate()
    let date = NSDate()
    var selecteditem: String = ""
    var selectedvalue: String = ""
    var index:Int = 0
    //var row:Int = 0

    var receivedrow: String = ""
    var receivedvalue: String = ""
    
    //let todaysmeal = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        
        
        
        tableView.reloadData()
        
        
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
    
    
    func timeformat(){
        let format = NSDateFormatter()
        format.dateStyle = NSDateFormatterStyle.ShortStyle
        let time = format.stringFromDate(date)
        self.formattedtime = time
        self.formatteddate = format.dateFromString(time)!
    }
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objects.count
    
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:tablecell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! tablecell
        
        let food = objects[indexPath.row]
        //let foodphoto = photo[indexPath.row]
        //let fooddesc = desc[indexPath.row]
        
        
        cell.name.text = food.valueForKey("fname") as? String
        cell.photo.image = UIImage(named: cell.name.text!)
        cell.serve.text = food.valueForKey("fvalue") as? String
        cell.desc.text = food.valueForKey("fdesc") as? String
        //cell.desc = nil
        //cell.photo = nil
        // Configure the cell...
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "forwardtoprogress"){
            let forwardpage = segue.destinationViewController as! MainView
            forwardpage.selectedIndex = 0
            //let date = NSDate()
            //savemeallist(objects, date: date)
        }
        else if (segue.identifier == "edit"){
            let forwardpage = segue.destinationViewController as! editingViewController
            forwardpage.index = sender as! Int
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //tableView.reloadData()
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if (cell != nil){
            let food = objects[indexPath.row]
            let name = food.valueForKey("fname") as? String
            let serve = food.valueForKey("fvalue") as? String
            self.index = indexPath.row
            self.selecteditem = name!
            self.selectedvalue = serve!
        }
        
        performSegueWithIdentifier("edit", sender: self.index)
    }
    
    //used to add new objects into objects
    func saveobject(name: String,value: String,time: NSDate, desc: String) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("FOOD", inManagedObjectContext: managedContext)
        let food = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        
        food.setValue(name, forKey: "fname")
        food.setValue(value, forKey: "fvalue")
        food.setValue(time, forKey: "time")
        food.setValue(desc, forKey: "fdesc")
        do {
            try managedContext.save()
            
            objects.append(food)
            
            
        }
        catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    //use to save changes
    func savecontext() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("FOOD", inManagedObjectContext: managedContext)
        let food = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        
        do {
            try managedContext.save()
            
            objects.append(food)
            
            
        }
        catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }

    /*
    func savemeallist(lists: [NSManagedObject],date: NSDate){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("DAILYLIST", inManagedObjectContext: managedContext)
        let list = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        let name = list.valueForKey("fname")
        let value = list.valueForKey("fvalue")
        
        
        
        list.setValue(date, forKey: "time")
        
        do {
            try managedContext.save()
            todayslist.append(list)
            //print(todayslist)
        }
        catch let error as NSError{
            print("Could not save\(error),\(error.userInfo)")
        }
    }
    */
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            let object = objects[indexPath.row]
            managedContext.deleteObject(object)
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            tableView.reloadData()
            
            
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
    


    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "FOOD")
        timeformat()
        fetchRequest.predicate = NSPredicate(format: "time = %@", formatteddate)
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            //timeformat()
            
            objects = results as! [NSManagedObject]
            
        }
        catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    
    
        
    /*
    
    func readPlist(namePlist: String, key: String) -> AnyObject{
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths.objectAtIndex(0) as! NSString
        let path = documentsDirectory.stringByAppendingPathComponent(namePlist)
        
        var output:AnyObject = false
        
        if let dict = NSMutableDictionary(contentsOfFile: path){
            output = dict.objectForKey("fname")!
        }else{
            if let privPath = NSBundle.mainBundle().pathForResource(namePlist, ofType: "plist"){
                if let dict = NSMutableDictionary(contentsOfFile: privPath){
                    output = dict.objectForKey("fname")!
                }else{
                    output = false
                    print("error_read")
                }
            }else{
                output = false
                print("error_read")
            }
        }

        return output
        
    }
    
    func writePlist(namePlist: String, key: String, data: AnyObject){
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths.objectAtIndex(0) as! NSString
        let path = documentsDirectory.stringByAppendingPathComponent(namePlist)
        
        if let dict = NSMutableDictionary(contentsOfFile: path){
            dict.setObject(data, forKey: key)
            if dict.writeToFile(path, atomically: true){
                print("plist_write")
            }else{
                print("plist_write_error")
            }
        }else{
            if let privPath = NSBundle.mainBundle().pathForResource(namePlist, ofType: "plist"){
                if let dict = NSMutableDictionary(contentsOfFile: privPath){
                    dict.setObject(data, forKey: key)
                    if dict.writeToFile(path, atomically: true){
                        print("plist_write")
                    }else{
                        print("plist_write_error")
                    }
                }else{
                    print("plist_write")
                }
            }else{
                print("error_find_plist")
            }
        }
    }
    */

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
