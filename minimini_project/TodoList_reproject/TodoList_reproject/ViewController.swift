//
//  ViewController.swift
//  TodoList
//
//  Created by 장서영 on 2020/09/24.
//

import UIKit

var todolist = [TodoList]()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TableView : UITableView!
    
    // Row의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todolist.count
    }
    
    // cell에 들어갈 데이터
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = todolist[indexPath.row].todoTitle
        cell.detailTextLabel?.text = todolist[indexPath.row].todoText

        return cell
    }
    
    // Edit mode
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            todolist.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    // UserDefaults : 데이터 저장
    func saveData() {
        let data = todolist.map {
            [
                "title" : $0.todoTitle,
                "content" : $0.todoText
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "item")
        userDefaults.synchronize()

        
    }
    
    @IBAction func tableView(_ sender : UIBarButtonItem){
        if TableView.isEditing{
            TableView.setEditing(false, animated: true)
        }else{
            TableView.setEditing(true, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TableView.delegate = self
        TableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        TableView.reloadData()
       
    }

    
    

}


