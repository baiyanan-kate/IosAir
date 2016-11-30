//
//  TravelTableViewController.swift
//  Air
//
//  Created by zero on 2016/11/28.
//  Copyright © 2016年 zero. All rights reserved.
//

import UIKit

class TravelTableViewController: UITableViewController {
    
    @IBOutlet weak var line: UIImageView!
    var travelList = [Travel]()
    var travelName = ["马尔代夫","三亚"]
    var recomList = [House]()
    var recomName = ["top","left","right"]
    var recomBed = ["2","3","4"]
    var recomCity = ["北京","上海","深圳"]
    var recomEquipment = ["无线网络","泳池","厨房"]
    var recomGuest = ["3","1","0"]
    var recomHouseName = ["田园小城","阳光暖房","海景房"]
    var recomIntroduction = ["地理位置优越，距离地铁、公交站近","安静，逃离烦躁城市","面朝大海，春暖花开"]
    var recomLication = ["北京交通大学","上海交通大学","浙江大学"]
    var recomOwner = ["马丁","白玉","王小二"]
    var recomPrince = ["￥345","￥333","￥100"]
    var recomRoom = ["2","1","5"]
    var recomToilet = ["1","2","2"]
    var recomType = ["整套房间","独立房间","合住房间"]

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(House.StoreURL)
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine;
        
        self.tableView.separatorColor = UIColor.clear;
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            if !FileManager().fileExists(atPath:Travel.StoreURL.path) {
                let travelDemo1 = appDelegate.addToContextForTravel(time: "2016.7.8", houseName: "田园小城")
                 let travelDemo2 = appDelegate.addToContextForTravel(time: "2016.8.8", houseName: "海景房")
                    travelList.append(travelDemo1)
                    travelList.append(travelDemo2)
                
                var i = 0
                for name in recomName {
                    let house = appDelegate.addToContextForHouse(bed: recomBed[i], city: recomCity[i], equipment: recomEquipment[i], guest: recomGuest[i], houseName: recomHouseName[i], image: UIImage(named:name), introduction: recomIntroduction[i], location: recomLication[i], owner: recomOwner[i], price: recomPrince[i], room: recomRoom[i], toilet: recomToilet[i], type: recomType[i])
                    recomList.append(house)
                    i = i+1
                }
                
            } else {
                if let fetchedList = appDelegate.fetchContextForTravel() {
                    travelList += fetchedList }
                if let fetchedList2 = appDelegate.fetchContextForHouse(){
                    recomList += fetchedList2
                }
            }
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return travelList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelCell", for: indexPath) as! TravelTableViewCell
        
        let travle = travelList[indexPath.row]
        var houseImage:Data?
        for house in recomList{
            if travle.houseName == house.houseName{
                houseImage = house.image
            }
        }
        
       
        // Configure the cell...
        cell.detail.text = travle.time!+","+travle.houseName!
        cell.line.image = UIImage(named: "travelFinal")
        cell.show.image = UIImage(data: houseImage!)

        return cell
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
