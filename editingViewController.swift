//
//  editingViewController.swift
//  Newprototype
//
//  Created by kit305 on 13/05/2016.
//  Copyright © 2016 kit305. All rights reserved.
//

import UIKit
import CoreData

class editingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var objects = [NSManagedObject]()
    
    @IBOutlet var detailtable: UITableView!
    var index:Int = 0
    
    var formattedtime = String()
    var formatteddate = NSDate()
    let date = NSDate()
    
    var name:String = ""
    var serve:String = ""
    var desc:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func timeformat(){
        let format = NSDateFormatter()
        format.dateStyle = NSDateFormatterStyle.ShortStyle
        let time = format.stringFromDate(date)
        self.formattedtime = time
        self.formatteddate = format.dateFromString(time)!
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
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = detailtable.dequeueReusableCellWithIdentifier("cell") as! editviewTableViewCell
        let food = objects[index]
        //let foodphoto = photo[indexPath.row]
        //let fooddesc = desc[indexPath.row]
        
        
        cell.name.text = food.valueForKey("fname") as? String
        cell.pic.image = UIImage(named: cell.name.text!)
        cell.serve.text = food.valueForKey("fvalue") as? String
        cell.desc.text = food.valueForKey("fdesc") as? String
        //cell.desc = nil
        //cell.photo = nil
        // Configure the cell...

        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
