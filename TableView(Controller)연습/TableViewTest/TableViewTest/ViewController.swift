//
//  ViewController.swift
//  TableViewTest
//
//  Created by 장서영 on 2020/09/14.
//  Copyright © 2020 장서영. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var TableView: UITableView!
    
    let cellIdentifier: String = "cell"
    
    let animalKorean = ["사자","호랑이","토끼","원숭이","돌고래"]
    let animalEnglish = ["Lion","Tiger","Rabbit","Monkey","Dolphin"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalEnglish.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int)->String?{
        if section == 0{
            return "동물 - 한국어"
        }
        else if section == 1{
            return "animal - English"
        }
      
        return " "
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        if indexPath[0] == 0{
            cell.textLabel?.text = animalKorean[indexPath.row]
            return cell
        }
        if indexPath[0] == 1{
            cell.textLabel?.text = animalEnglish[indexPath.row]
            return cell
        }
        return cell
    }


}

