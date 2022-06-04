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
    //private let date: Date
    let completed: Bool
    
    init(title:String, description: String, completed:Bool) {
        self.title = title
        self.description = description
        self.completed = completed
    }
}

