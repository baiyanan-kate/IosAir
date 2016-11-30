//
//  SearchTableViewController.swift
//  Air
//
//  Created by zero on 2016/11/28.
//  Copyright © 2016年 zero. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {
    

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

        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            if !FileManager().fileExists(atPath:House.StoreURL.path) {
                var i = 0
                for name in recomName {
                    let house = appDelegate.addToContextForHouse(bed: recomBed[i], city: recomCity[i], equipment: recomEquipment[i], guest: recomGuest[i], houseName: recomHouseName[i], image: UIImage(named:name), introduction: recomIntroduction[i], location: recomLication[i], owner: recomOwner[i], price: recomPrince[i], room: recomRoom[i], toilet: recomToilet[i], type: recomType[i])
                    recomList.append(house)
                    i = i+1
                }
        } else {
            if let fetchedList = appDelegate.fetchContextForHouse() {
                recomList += fetchedList }
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
        return recomList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchTableViewCell
        
        let house = recomList[indexPath.row]
        
        if let photo = house.image{
            cell.show.image = UIImage(data: photo)
        }else{
            cell.show.image = UIImage(named: "photoalbum")
        }
        cell.price.text = house.price
        cell.name.text = house.houseName
        cell.collectHouse.setTitle("未收藏", for: .normal)
        

        // Configure the cell...

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "SearchToDetail"{
            let roomDetail = segue.destination as? RoomDetailTableViewController
            let indexPath = tableView.indexPathForSelectedRow
            roomDetail?.house = recomList[(indexPath?.row)!]
        }
    }
    

}
