//
//  ViewController.swift
//  UITextFieldDelegateTest
//
//  Created by 장서영 on 2020/09/16.
//  Copyright © 2020 장서영. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var enterLabel: UILabel!
    @IBOutlet weak var textLabel: UITextField!
    
//    @IBAction func buttonClicked(_ sender: Any){
//        enterLabel.text = textLabel.text
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textLabel.delegate = self
    }
    func textFieldShouldReturn(_ textfield:UITextField)->Bool{
        enterLabel.text = textfield.text
        return true
    }


}

