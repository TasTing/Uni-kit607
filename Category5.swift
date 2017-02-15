//
//  Category5.swift
//  Newprototype
//
//  Created by kit305 on 23/04/2016.
//  Copyright © 2016 kit305. All rights reserved.
//

import UIKit

class Category5: UITableViewController {

    var objects = ["Milk":"1","Evaporated Milk":"1","Cheese":"0.5","Ricotta cheese":"0.5","Yoghurt":"1.33","Soy drink":"1"]
    var photo = UIImage(named: "")
    var desc = ["Half cup (120ml) of evaporated milk = 1 serve","1 slice (20g) or 4x3x2cm cube of hard cheese, such as cheddar = half serve","Half cup (120g) of ricotta cheese = 1 serve","1 cup (266.7g) of Yoghurt = 1.33 serves","1 cup (250ml) Soy, rice or other cereal drink with at least 100mg of added calcium per 100ml = 1 serve","1 cup (250ml) fresh, UHT long life, reconstituted powdered milk or buttermilk = 1 serve"]
    
    
    var selecteditem: String = ""
    var selectedvalue: String = ""
    var formattedtime = String()
    var formatteddate = NSDate()
    let date = NSDate()
    
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
    
    var selecteddesc: String = ""
    
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

}
