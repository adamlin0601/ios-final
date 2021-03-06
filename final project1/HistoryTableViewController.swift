//
//  HistoryTableViewController.swift
//  final project1
//
//  Created by adam lin on 2018/1/11.
//  Copyright © 2018年 adam lin. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {

    @IBOutlet var couresTableView: UITableView!
    var courses = [Dictionary<String,String>]()
    let initcourses = [["name":"早餐", "startdate":"2018/1/11",
                        "description":"二餐"]]
    let fileManager = FileManager.default
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationName = Notification.Name("maintainNotification")
        NotificationCenter.default.addObserver(self, selector: #selector(self.maintainCoureNotification(noti:)), name: notificationName, object: nil)
        let url = Setfile()
        if let readcourses = NSArray(contentsOf: url!)
        {
            courses = readcourses as![Dictionary<String,String>]
        }
        else
        {
            (initcourses as NSArray).write(to: url!, atomically:true)
            courses = initcourses
        }
        
    }
    func Setfile()->URL? {
        let docUrls = fileManager.urls(for: .documentDirectory,in: .userDomainMask)
        let docUrl = docUrls.first
        
        let url = docUrl?.appendingPathComponent("courses.txt")
        return url
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return courses.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courselist", for: indexPath) as! HistoryTableViewCell
        
        
        let dic = courses[indexPath.row]
        cell.name.text=dic["name"]!
        cell.coursedate.text="日期\(dic["startdate"]!)"
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is DetailTableViewController{
            let controller = segue.destination as! DetailTableViewController
            
            let indexPath = self.couresTableView.indexPathForSelectedRow
            let courseSelect = courses[indexPath!.row]
            controller.coureSelect = courseSelect
        }
        
        
    }
    @objc func maintainCoureNotification(noti:Notification) {
        
        if self.couresTableView.indexPathForSelectedRow != nil {
            courses[self.couresTableView.indexPathForSelectedRow!.row] = noti.userInfo as! [String:String]
        }
        else{
            
            self.courses.insert(noti.userInfo as! [String:String], at: 0)
        }
        let url = Setfile()
        (courses as NSArray).write(to: url!, atomically:true)
        self.couresTableView.reloadData()
        
        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        courses.remove(at: indexPath.row)
        let url = Setfile()
        (courses as NSArray).write(to: url!, atomically:true)
        tableView.reloadData()
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
