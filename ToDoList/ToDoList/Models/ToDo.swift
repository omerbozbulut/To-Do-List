//
//  ToDo.swift
//  ToDoList
//
//  Created by omer faruk bozbulut on 4.06.2022.
//

import Foundation

var toDoList: [ToDo] = [
    ToDo(title: "Markete git", description: "Ekmek, su, kahve al", date: Date(timeIntervalSince1970: 432233446145.0/1000.0), completed: false),
    ToDo(title: "Çamaşırları yıka", description: "note", date: Date(timeIntervalSince1970: 4333446145.0/1000.0), completed: false)]

struct ToDo: Codable{
    var title: String
    var description: String
    var date: Date
    var completed: Bool
    
    init(title:String, description: String, date: Date, completed:Bool) {
        self.title = title
        self.description = description
        self.date = date
        self.completed = completed
    }
}

