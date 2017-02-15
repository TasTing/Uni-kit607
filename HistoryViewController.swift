//
//  HistoryViewController.swift
//  Newprototype
//
//  Created by kit305 on 24/04/2016.
//  Copyright © 2016 kit305. All rights reserved.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var objects = [NSManagedObject]()
    let date = NSDate()
    var formattedtime = String()
    var formatteddate = NSDate()
    var name = [String]()
    var value = [String]()
    var newobject = [NSManagedObject]()
    var pickeddate = NSDate()
    
    @IBOutlet var Datepicker: UIDatePicker!
    var testname = "Apple"
    
    @IBAction func filter(sender: UIButton) {
        
        filterdate()
        timeformat()
        
        historytable.reloadData()
    }
    
    func timeformat(){
        let format = NSDateFormatter()
        format.dateStyle = NSDateFormatterStyle.ShortStyle
        let time = format.stringFromDate(date)
        self.formattedtime = time
        self.formatteddate = format.dateFromString(time)!
        
    }
    
    
    
    @IBOutlet var historytable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        timeformat()
        name = ["1","2","3"]
        value = ["1","2","3"]
        
        self.Datepicker.date = formatteddate
        print(Datepicker.date)

        
        historytable.estimatedRowHeight = 80
        historytable.rowHeight = UITableViewAutomaticDimension
        let nib = UINib(nibName: "tablecell", bundle: nil)
        historytable.registerNib(nib, forCellReuseIdentifier: "cell")
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        timeformat()
        Datepicker.date = formatteddate
    }
    
        
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:tablecell = self.historytable.dequeueReusableCellWithIdentifier("cell") as! tablecell
        
        let food = objects[indexPath.row]
        
        cell.name.text = food.valueForKey("fname") as? String
        cell.serve.text = food.valueForKey("fvalue") as? String
        cell.photo.image = UIImage(named: cell.name.text!)
        cell.desc.text = food.valueForKey("fdesc") as? String
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    //wat a useless function!!!!!!!
    /*
    func fetchall(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "FOOD")
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            objects = results as! [NSManagedObject]
            
            
        }
        catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        fetchRequest.predicate = NSPredicate(format: "fname = %@", testname)
    }
    */
    func filterdate(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "FOOD")
        fetchRequest.predicate = NSPredicate(format: "time = %@", Datepicker.date)
        
        do{
            let results = try managedContext.executeFetchRequest(fetchRequest)
            objects = results as! [NSManagedObject]
        }
        catch{
            
        }
    }
    
    @IBAction func selectdate(sender: UIDatePicker) {
        
        let format = NSDateFormatter()
        format.dateStyle = NSDateFormatterStyle.ShortStyle
        let strDate = format.stringFromDate(Datepicker.date)
        Datepicker.date = format.dateFromString(strDate)!
        self.pickeddate = Datepicker.date
        if Datepicker.date == formatteddate{
            print("true")
        }
        else{
            print("false")
        }
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
