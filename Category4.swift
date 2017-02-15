//
//  Category4.swift
//  Newprototype
//
//  Created by kit305 on 23/04/2016.
//  Copyright © 2016 kit305. All rights reserved.
//

import UIKit

class Category4: UITableViewController {

    var objects = ["Red meat":"1","Lean poultry":"1","Fish fillet":"1","Egg":"0.5","Beans":"1","Tofu":"1","Nuts":"1"]
    var photo = UIImage(named: "")
    var desc = ["115g raw or 1 small can of fish = 1 serve","A cup of (150g) Cooked or canned legumes/beans such as lentils, chick peas or split peas = 1 serve","30g of Nuts, seeds, peanuts or almond butter or tahini or other nut or seed paste (no added salt) = 1 serve","Such as beef, lamb, veal, port, goat or kangaroo(about 90-100g raw)= cooked meat (65g) = 1 serve","All types tofu (170g) = 1 serve","Such as chicken, turkey or duck (100g raw) = cooked meat (80g) = 1 serve","1 large egg (60g) = half serve"]
    
    
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
