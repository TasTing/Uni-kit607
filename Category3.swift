//
//  Category3.swift
//  Newprototype
//
//  Created by kit305 on 23/04/2016.
//  Copyright © 2016 kit305. All rights reserved.
//

import UIKit

class Category3: UITableViewController {
    
    var objects = ["Bread":"1","Roll bread":"2","Flat bread":"2","Rice":"2","Pasta":"2","Noodles":"2","Barley":"2","Buckwheat":"2","Semolina":"2","Polenta":"2","Bulgur":"2","Quinoa":"2","Porridge":"2","Wheat flakes":"1.5","Cereal flakes":"1.5","Muesli":"4","Crisp breads":"0.33","Crumpet":"1","English muffin":"1","Scone":"1"]
    var photo = UIImage(named: "")
    var desc = ["1 cup of wheat flakes (45g) = 750kj = 1.5 serves","1 cup of cooked barley (150-240g) = 1000kj = 2 serves","1 cup of cereal flakes (45g) = 750kj = 1.5 serves","One piece of crisp bread (11.7g) = 166.7kj = 0.33 serve","1 small English muffin (35g) = 500kj = 1 serve","1 cup of cooked quinoa (150-240g) = 1000kj = 2 serves","1 cup of cooked porridge (240g) = 1000kj = 2 serves","1 small scone (35g) = 500kj = 1 serve","1 medium roll bread (80g) = 1000kj = 2 serves","1 plate of cooked pasta (150-240g) = 1000kj = 2 serves","1 plate of cooked noodles (150-240g) = 1000kj = 2 serves","1 cup of cooked rice (150-240g) = 1000kj = 2 serves","One piece of crumpet (60g) = 500kj = 1 serve","1 medium flat bread (80g) = 1000kj = 2 serves","1 cup of muesli (120g) = 2000kj = 4 serves","1 cup of cooked barley (150-240g) =1000kj = 2 serves","1 cup of cooked semolina (150-240g) = 1000kj = 2 serves","1 cup of cooked polenta (150-240g) = 1000kj = 2 serves","1 cup of cooked bulgur (150-240g) = 1000kj = 2 serves","1 slice bread (40g) = 500kj = 1 serve"]
    
    
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
