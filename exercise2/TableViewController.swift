//
//  TableViewController.swift
//  exercise2
//
//  Created by NDHU_CSIE on 2020/10/29.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var fruits = ["Apple", "Cherry", "Orange", "Peach", "Strawberry", "Mango"]
    var prices = ["10", "20", "30","40","50","60"]
    var total: Int = 0
   
    
    @IBOutlet weak var mylabel: UILabel!
    @IBOutlet var totalp: UILabel!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fruits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        
        cell.name.text = fruits[indexPath.row]
        cell.price.text = prices[indexPath.row]
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //myname.text = "My Favorite Fruit is " + fruits[indexPath.row]
        //myprice.text = " And it costs " + prices[indexPath.row]
        if let cell = tableView.cellForRow(at: indexPath) as? TableViewCell{
            if cell.accessoryType == .checkmark{
                total -= Int(prices[indexPath.row]) ?? 0
                cell.accessoryType = .none
            }
            else
            {
                total += Int(prices[indexPath.row]) ?? 0
                cell.accessoryType = .checkmark
            }
        }
         totalp.text = "Total Prices = " + String(total)
    }
    
}
