//
//  TravelViewController.swift
//  Air
//
//  Created by zero on 2016/11/27.
//  Copyright © 2016年 zero. All rights reserved.
//

import UIKit

class TravelViewController: UIViewController {

    @IBOutlet weak var travel: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        travel.layer.borderColor = UIColor(red: 0/255, green: 166/255, blue: 153/255, alpha: 1).cgColor;
        
        travel.layer.borderWidth = 1;
        travel.layer.cornerRadius = 5;
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
