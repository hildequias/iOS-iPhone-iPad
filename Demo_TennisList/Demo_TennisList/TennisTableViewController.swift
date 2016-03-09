//
//  TennisTableViewController.swift
//  Demo_TennisList
//
//  Created by Mobile6 on 3/1/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

import UIKit

class TennisTableViewController: UITableViewController {
    
    var tenisArr:[AnyObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        if let plistPath = NSBundle.mainBundle().pathForResource("ListaTenis", ofType: "plist") {
            
            self.tenisArr = NSArray(contentsOfFile: plistPath)! as [AnyObject]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (tenisArr?.count)!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 160
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellID", forIndexPath: indexPath)
        
        let dic: [String:AnyObject] = self.tenisArr![indexPath.row] as! [String:AnyObject]
        cell.textLabel?.text = dic["Nome"] as? String
        let valor: Double = dic["Valor"] as! Double
        
        cell.detailTextLabel?.text = "R$ \(valor)"
        cell.imageView?.image = UIImage(named: dic["Imagem"] as! String)
        cell.accessoryType = UITableViewCellAccessoryType.None
        
        if (NSUserDefaults.standardUserDefaults().objectForKey(dic["Nome"] as! String) != nil){
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        let cellKey = cell?.textLabel?.text!
        if (cell?.accessoryType == UITableViewCellAccessoryType.None) {
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            NSUserDefaults.standardUserDefaults().setValue("S", forKey: cellKey!)
        
        } else {
            cell?.accessoryType = UITableViewCellAccessoryType.None;  NSUserDefaults.standardUserDefaults().removeObjectForKey(cellKey!)
        }
            // Efetiva as operacoes no userdefaults
            NSUserDefaults.standardUserDefaults().synchronize()
            // Desmarca a celula selecionada  tableView.deselectRowAtIndexPath(indexPath, animated: true)
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
