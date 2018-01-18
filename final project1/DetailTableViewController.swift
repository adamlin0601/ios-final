//
//  DetailTableViewController.swift
//  final project1
//
//  Created by adam lin on 2018/1/11.
//  Copyright © 2018年 adam lin. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    var coureSelect:[String:String]!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var startdateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationName = Notification.Name("maintainNotification")
        NotificationCenter.default.addObserver(self, selector: #selector(DetailTableViewController.editCoureNotification(noti:)), name: notificationName, object: nil)
        showData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let controller = segue.destination as! MaintainTableViewController
        controller.coureSelect = self.coureSelect
        
        
    }
    @objc func editCoureNotification(noti:Notification) {
        
        coureSelect = noti.userInfo as? [String:String]
        showData()
    }
    
    func showData()
    {
        
        nameLabel.text="哪一餐:\(coureSelect["name"]!)"
        startdateLabel.text="吃飯時間:\(coureSelect["startdate"]!)"
        //enddateLabel.text=coureSelect["enddate"]
        descriptionLabel.text="餐廳內容:\(coureSelect["description"]!)"
        
        
    }
    // MARK: - Table view data source
    /*
     override func numberOfSections(in tableView: UITableView) -> Int {
     // #warning Incomplete implementation, return the number of sections
     return 0
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     // #warning Incomplete implementation, return the number of rows
     return 0
     }
     
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
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
