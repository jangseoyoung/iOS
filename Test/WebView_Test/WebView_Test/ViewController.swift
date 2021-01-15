//
//  ViewController.swift
//  WebView_Test
//
//  Created by 장서영 on 2021/01/15.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var txtUrl : UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadWebPage("http://2sam.net")
    }
    
    @IBAction func btnGotoUrl(_ sender: UIButton){
        
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton){
        
    }
    
    @IBAction func btnGoSite2(_ sender: UIButton){
        
    }
    
    @IBAction func btnLoadHtmlString(_ sender: UIButton){
        
    }
    
    @IBAction func btnLoadHtmlFile(_ sender: UIButton){
        
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem){
        
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem){
        
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem){
        
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem){
        
    }


}

