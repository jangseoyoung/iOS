//
//  ViewController.swift
//  Alamofire_Test
//
//  Created by 장서영 on 2020/11/24.
//

import UIKit
import Alamofire // Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        AF.request("https://api.github.com/users", method: .get, parameters: [:], encoding: URLEncoding.default, headers: ["Content-Type":"application/json", "Accept":"application/json"]) .validate(statusCode: 200..<300) .responseJSON { (response) in print(response.response?.statusCode)} // print(response.result)하면 JSON으로 나옴

        
    }


}

