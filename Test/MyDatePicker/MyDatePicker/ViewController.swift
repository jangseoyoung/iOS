//
//  ViewController.swift
//  MyDatePicker
//
//  Created by 장서영 on 2020/09/11.
//  Copyright © 2020 장서영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker : UIDatePicker!
    @IBOutlet weak var dateLabel : UILabel!
    let dateFormatter : DateFormatter = {
        let formatter : DateFormatter = DateFormatter()
        formatter.dateStyle = .medium   //날짜만 출력
        formatter.timeStyle = .medium   //시간만 출력
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        return formatter
        
    }()
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker){
        print("value change")
        
        let date : Date = self.datePicker.date  //==sender.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLabel.text = dateString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        }


}

