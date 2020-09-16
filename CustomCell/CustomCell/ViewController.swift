//
//  ViewController.swift
//  CustomCell
//
//  Created by 장서영 on 2020/09/16.
//  Copyright © 2020 장서영. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellIdentifier: String = "customcell"
    
    
    override func viewDidLoad() {        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! TableViewCell
        
        cell.addressLabel.text = "This is address"
        cell.timeLabel.text = "This is time"
        cell.memoLabel.text = "This is memo"
        
        return cell
    }
    



}

