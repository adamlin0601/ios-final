//
//  randomSelect.swift
//  final project1
//
//  Created by adam lin on 2018/1/9.
//  Copyright © 2018年 adam lin. All rights reserved.
//

import UIKit
import GameplayKit
class randomSelect: UIViewController {
    
    
    @IBOutlet weak var selectDate: UILabel!
    @IBOutlet weak var selectMeal: UILabel!
    @IBOutlet weak var selectStore: UILabel!
    let randomDistribution = GKRandomDistribution(lowestValue:0, highestValue:10)
    var meal:String?
    var date:String?
    var store = ["寶妹","711","大大魯","818","漢堡","一餐","二餐","三媽","八方","滷味","牛肉麵"]
    override func viewDidLoad() {
        super.viewDidLoad()
        selectDate.text = date
        selectMeal.text = meal
        selectStore.text = "吃"+store[randomDistribution.nextInt()]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
