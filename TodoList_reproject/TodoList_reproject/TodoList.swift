//
//  TodoList.swift
//  TodoList_reproject
//
//  Created by 장서영 on 2020/09/25.
//

import Foundation

struct TodoList {
    var todoTitle : String = " "
    var todoText : String = " "
    
    init(todoTitle:String,todoText:String){
        self.todoTitle = todoTitle
        self.todoText = todoText
    }
}

