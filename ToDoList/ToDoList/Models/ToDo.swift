//
//  ToDo.swift
//  ToDoList
//
//  Created by omer faruk bozbulut on 4.06.2022.
//

import Foundation

struct ToDo: Codable{
    let title: String
    let description: String
    var date: Date
    let completed: Bool
    
    init(title:String, description: String, date: Date, completed:Bool) {
        self.title = title
        self.description = description
        self.date = date
        self.completed = completed
    }
}

