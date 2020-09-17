//
//  ViewController.swift
//  CustomCell
//
//  Created by 장서영 on 2020/09/16.
//  Copyright © 2020 장서영. All rights reserved.
//

import UIKit

struct CustomLabel {
    let address : String
    let time : String
    let memo : String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "customcell"
    
    var array: [CustomLabel] = []
    
    let Labels = [
       CustomLabel(address : "This is address Label", time : "This is time Label", memo: "This is memo")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}


extension ViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! TableViewCell
        
        let cells = Labels[indexPath.row]
        
        cell.addressLabel.text = cells.address
        cell.timeLabel?.text = cells.time
        cell.memoLabel?.text = cells.memo
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
