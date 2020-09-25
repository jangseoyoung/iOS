//
//  SecondViewController.swift
//  TodoList
//
//  Created by 장서영 on 2020/09/25.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var Maintitle: UITextField!
    @IBOutlet weak var Content: UITextView!
    
    @IBAction func cancelItem(_ sender : UIBarButtonItem){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func DoneItem(_ sender: UIBarButtonItem) {
        let title = Maintitle.text!
        let content = Content.text!
        
        let item: TodoList = TodoList(todoTitle: title, todoText: content)
    
        todolist.append(item)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

